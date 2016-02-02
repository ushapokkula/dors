Feature:DR-285
  Assessment Management Default View

  @default1
  Scenario: Verify the message when there are no assessments with status requested
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    When There are no assessments with status requested
    Then I see a message "There are no assessments to display."

  @default2
  Scenario: Verify the default view of Assessment management
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    Then I will see  list of all Assessments Requests with status requested
    And Each assessment request will include following details
      | Details       |
      | Assessor Name |
      | Date    |
      | Expenses      |
      | Name          |
      | Expiry Date   |
      | Status        |


