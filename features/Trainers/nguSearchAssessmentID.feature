@pass
@DR-251
Feature:DR-251
  NGU searches for an Assessment by ID

  Background:

    Given that I have licence.ndors.org.uk page opened



  @one
  Scenario: Verify the visibilty of view mode
    And I login as an "Assessor"
    And I request assessment as Booked
    And I logout
    And I login as Compliance Manager and click assessment management tab to search booked assessments
    When I click "Search"
    Then The system will load the detailed information for assessment record in view mode

  @two
  Scenario: Verify the information  of assessment record available in view mode
    And I login as an "Assessor"
    And I request assessment as Booked
    And I logout
    And I login as Compliance Manager and click assessment management tab to search booked assessments
    When I click "Search"
    Then The system will load the following information for assessment record in view mode
      | Details            |
      | Scheme             |
      | Date               |
      | Time               |
      | Venue              |
      | Name               |
      | Assessor           |
      | Expiry Date        |
      | Total Mileage      |
      | Expenses Claimed £ |
      | Status             |
      | Assessment Notes   |

  @three
  Scenario: Verify the visibility of 'Reject' button when the status is Requested
    And I login as an "Assessor"
    And I request assessment as Requested
    And I logout
    And I login as Compliance Manager and click assessment management tab to search requested assessments
    When I click "Search"
    Then The system will load the detailed information for assessment record in view mode
    And The page will include "Reject" button

  @four
  Scenario: Verify the visibility of 'Mark Complete' and ' Cancel' when the status is Booked
    And I login as an "Assessor"
    And I request assessment as Booked
    And I logout
    And I login as Compliance Manager and click assessment management tab to search booked assessments
    When I click "Search"
    And the page include Outcome dropdown
    Then The system will load the detailed information for assessment record in view mode
    And The page will include Mark Complete and Cancel button


  @five
  Scenario: Verify the validation message when Invalid assessment Id is entered to search
    And I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT"
    When I enter the assessment Id which does'nt exists
    And I click "Search"
    Then I will see "No assessment record exists with this ID."

  @six
  Scenario: Verify the validation message without entering assessment Id and searched
    And I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT"
    When I do not enter any assessment Id
    And I click "Search"
    Then I will see "Please provide an assessment ID."










