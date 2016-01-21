Feature:DR-251
  NGU searches for an Assessment by ID

  Background:
    Given that I am logged into the system
    And I navigate to "ASSESSMENT MANAGEMENT" page

  @one
  Scenario: Verify the visibilty of view mode
    And I type the Booked Assessment ID in the Assessment search field
    When I click "Search"
    Then The system will load the detailed information for assessment record in view mode

  @two
  Scenario: Verify the information  of assessment record available in view mode
    And I type the Booked Assessment ID in the Assessment search field
    When I click "Search"
    Then The system will load the following information for assessment record in view mode
      | Details            |
      | Scheme             |
      | Date               |
      | Time               |
      | Venue              |
      | Name               |
      | Assessor Name      |
      | License            |
      | Expiry Date        |
      | Total Mileage      |
      | Expenses Claimed £ |
      | Status             |
      | Assessment Notes   |

  @three
  Scenario: Verify the visibility of 'Reject' button when the status is Requested
    And I type the Request Assessment ID in the Assessment search field
    When I click "Search"
    Then The system will load the detailed information for assessment record in view mode
    And The page will include "Reject" button

  @four
  Scenario: Verify the visibility of 'Mark Complete' and ' Cancel' when the status is Booked
    And I type the Booked Assessment ID in the Assessment search field
    When I click "Search"
    Then The system will load the detailed information for assessment record in view mode
    And The page will include 'Mark Complete' and 'Cancel'button
    And 'Outcome' dropdown

  @five
  Scenario: Verify the validation message when Invalid assessment Id is entered to search
    When I enter the assessment Id which does'nt exists
    And I click "Search"
    Then I will see "No assessment record exists with this ID."

  @six
  Scenario: Verify the validation message without entering assessment Id and searched
    When I do not enter any assessment Id
    And I click "Search"
    Then I will see "Please provide an assessment ID."










