@DR-285
Feature:DR-285
  Assessment Management Default View

  Background:
    Given that I am logged into the system
#    When There are no assessments on the assessment management page
    And I navigate to "ASSESSMENT MANAGEMENT" page

  @default1
  Scenario: Verify the message when there are no assessments with status requested
    When There are no assessments with status requested
    Then I see a message "There are no assessments to display."

  @default2
  Scenario: Verify the default view of Assessment management
    Then I will see  list of all Assessments Requests with status requested
    And Each assessment request will include following details
      | Details       |
      | Assessor Name |
      | Date    |
      | Expenses      |
      | Name          |
      | Expiry Date   |
      | Status        |


