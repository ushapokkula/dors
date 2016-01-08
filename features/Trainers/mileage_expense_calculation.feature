@DR-259
Feature: Total Mileage calculation

  Background:
    Given that I am logged into the system
    And I click "REQUEST ASSESSMENT"
    And I navigate to Summary page


  Scenario Outline: Verify the mileage calculation when more than 100 miles are entered
    When I enter "<Miles>" miles
    Then The expenses claimed will be "<Expenses Claimed>" for "<Miles>"

    Examples:
      | Miles | Expenses Claimed |
      | 0     | 0.00             |
      | 100   | 0.00             |
      | 200   | 70.00            |
      | 550   | 315.00           |
      | 999   | 629.30           |


  Scenario: Verify the visibility of mileage fields and text
    Then I see a message "Enter your mileage below and it will automatically calculate your expenses"
    And below the message i see "Total Mileage" and "Expenses Claimed" fields


  Scenario: Verify the mileage restriction to three digits
    When I enter "1234" in mileage field
    Then I see that the mileage field is restricted to "123"


  Scenario Outline: Verify the mileage restriction to max of 999 miles
    When I enter "<miles>" in mileage field
    Then I see that the mileage field is restricted to "<expected_miles>"

    Examples:
      | miles | expected_miles |
      | 999   | 999            |
      | 1000  | 100            |


  Scenario: Verify the mileage field by entering alphabets and decimals
    When I enter "abcd" in mileage field
    Then I see that the mileage field does not accept alphabets
    When I enter "34.5" in mileage field
    Then I see that the mileage field does not accept numbers and displays as "345"

  @miles1
  Scenario Outline: Verify that the mileage and expenses are saved with assessment record when clicked on submit
    And I enter "<Miles>" miles
    And The expenses claimed will be "<Expenses Claimed>" for "<Miles>"
    When I click "Submit"
    Then The mileage and expenses will be saved with the assessment request record as "<Miles>" and "<Expenses Claimed>"

  Examples:
  | Miles | Expenses Claimed |
  | 550   | 315.00           |
  | 999   | 629.30           |







