@pass
@mileage_calculation
Feature: Total Mileage calculation

  Background:

    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I click "REQUEST ASSESSMENT"
    And I navigate to Summary page

@mileage_calculation1
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

@mileage_calculation2
  Scenario: Verify the visibility of mileage fields and text
    Then I see this message "Enter your mileage below and it will automatically calculate your expenses"
    And below the message i see "Total Mileage" and "Expenses Claimed" fields

@mileage_calculation3
  Scenario: Verify the mileage restriction to three digits
    When I enter "1234" in mileage field
    Then I see that the mileage field is restricted to "123"

@mileage_calculation4
  Scenario Outline: Verify the mileage restriction to max of 999 miles
    When I enter "<miles>" in mileage field
    Then I see that the mileage field is restricted to "<expected_miles>"

    Examples:
      | miles | expected_miles |
      | 999   | 999            |
      | 1000  | 100            |

@mileage_calculation5
  Scenario: Verify the mileage field by entering alphabets and decimals
    When I enter "abcd" in mileage field
    Then I see that the mileage field does not accept alphabets
    When I enter "34.5" in mileage field
    Then I see that the mileage field does not accept numbers and displays as "345"

@mileage_calculation6
  Scenario Outline: Verify that the mileage and expenses are saved with assessment record when clicked on submit
    And I enter "<Miles>" miles
    And The expenses claimed will be "<Expenses Claimed>" for "<Miles>"
    When I click "Submit"
    Then The mileage and expenses will be saved with the assessment request record as "<Miles>" and "<Expenses Claimed>"

  Examples:
  | Miles | Expenses Claimed |
  | 550   | 315.00           |
  | 999   | 629.30           |







