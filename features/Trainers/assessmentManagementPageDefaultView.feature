@pass
@DR-285
Feature: Assessment Management Default View

  @default1
  Scenario: Verify the message when there are no assessments with status requested
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    When There are no assessments with status requested
    Then I see a message "There are no assessments to display."

  @default2 @DR-973
  Scenario: Verify the default view of Assessment management
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I request all assessments
    And I logout
    And I login as an "Compliance Manager"
    Then I will see  list of all Assessments Requests with status requested
    And Each assessment request will include following details
      | Details        |
      | Trainer ID     |
      | Expenses       |
      | Trainer        |
      | Licence Exp.   |
      | Licence Status |
    And assessor name and date are also displayed in the default view

  @default3
  Scenario: Verify Assessment ID, maximum count of trainers
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I request all assessments
    And I logout
    And I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT"
    Then I will see  list of all Assessments Requests with status requested
    And Each request contains Assessment ID
    And Maximum trainers included are not more than four

  @DR-173
  Scenario: Verify 'View Details' and 'Approve' button
   Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I request all assessments
    And I logout
    And I login as an "Compliance Manager"
    When I click "ASSESSMENT MANAGEMENT"
    Then I will see  list of all Assessments Requests with status requested
    And I see "View Details"
    And I see "Approve" button

  @DR-173
  Scenario: Verify the list of assessments sorted  by assessment date
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I request all assessments
    And I logout
    And I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT"
    Then I will see  list of all Assessments Requests with status requested
    And The assessment list will be sorted by assessment date









