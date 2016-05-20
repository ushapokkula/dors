@pass
@DR-168
Feature:DR-168
  As an assessor,
  I want to be able to load details of an assessment,
  so that I can read through full details.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    When I navigate to "MY ASSESSMENTS" page
    When I click one of the items in the list
    Then The system will load "Assessment Outcome" page

  @AssessmentDetails1
  Scenario: Verify the Assessor and trainer details on summary page

    And The page will display the Assessor and Trainer details
      | Details       |
      | Assessor Name |
      | Scheme        |
      | License       |
      | Expiry Date   |
      | Date          |
      | Time          |
      | Venue         |
      | Phone         |
      | Status Approved |

  @AssessmentDetails2
  Scenario: Verify the display of mileage, expenses claimed and Notes field
    And The mileage and expenses claimed  will be shown
    And The Notes field will be displayed

  @AssessmentDetails3
  Scenario: Verify Back button
    When I click "Back"
    Then I will be re-direct to My Assessments page








