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
      | Details      |
      | Trainer ID   |
      | Expenses     |
      | Trainer      |
      | Licence Exp. |
      | Status       |
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

  @DR-1139
  Scenario Outline: Verify the licence type for requested/booked assessments in the assessment management page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    And I request assessment as "<Assessment_Type>" of course type "<Type>"
    And I logout
    And I login as an "<User>"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    And I select assessment status depending on "<User>" and "<Assessment_Type>"
    And I can see the label "Licence Type"
    Then I see licence type "<Type>" against the trainer for each assessment in the assessment management page


    Examples:
      | Assessment_Type | User               | Type      |
      | Requested       | Compliance Manager | Theory    |
      | Requested       | Compliance Manager | Practical |
      | Booked          | Compliance Manager | Theory    |
      | Booked          | Compliance Manager | Practical |

  @DR-1139
  Scenario Outline: Verify the licence type for rejected/cancelled assessments in the assessment management page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    And I request assessment as "<Assessment_Type>" of course type "<Type>"
    And I logout
    And I login as an "<User>"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I select assessment status depending on "<User>" and "<Assessment_Type>"
    And I click on "View Details" button on 'Assessment management' page
    And I reject/cancel the Assessment depending on "<Assessment_Type>"
    And I select assessment status depending on "<Cancellation_Type>"
    Then I see licence type "<Type>" against the trainer for each assessment in the assessment management page


    Examples:
      | Assessment_Type | User               | Type      | Cancellation_Type |
      | Requested       | Compliance Manager | Theory    | Rejected          |
      | Requested       | Compliance Manager | Practical | Rejected          |
      | Booked          | Compliance Manager | Theory    | Cancelled         |
      | Booked          | Compliance Manager | Practical | Cancelled         |


  @DR-1139
  Scenario Outline: Verify the licence type for completed assessment in the assessment management page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    And I request assessment as "<Assessment_Type>" of course type "<Type>"
    And I logout
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I select "<Status_Type1>" from assessment status dropdown
    And I click on "View Details" button on 'Assessment management' page
    And I select possible outcome against each trainer depending on "<Type>"
    And I click "Mark Complete"
    When I select "<Status_Type2>" from assessment status dropdown
    Then I see licence type "<Type>" against the trainer for each assessment in the assessment management page

    Examples:
      | Assessment_Type | Status_Type1 | Status_Type2 | Type      |
      | Booked          | Approved     | Completed    | Theory    |
      | Booked          | Approved     | Completed    | Practical |

  @DR-1146
  Scenario Outline: Verify the licence type for requested/booked assessments in the assessment detailed view
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    And I request assessment as "<Assessment_Type>" of course type "<Type>"
    And I logout
    And I login as an "<User>"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I select assessment status depending on "<User>" and "<Assessment_Type>"
    And I see licence type "<Type>" against the trainer for each assessment in the assessment management page
    When I click on "View Details" button on 'Assessment management' page
    Then I see "License Type" as column name
    And I see "<Type>" under licence type column



    Examples:
      | Assessment_Type | User               | Type      |
      | Requested       | Compliance Manager | Theory    |
      | Requested       | Compliance Manager | Practical |
      | Booked          | Compliance Manager | Theory    |
      | Booked          | Compliance Manager | Practical |


  @DR-1146
  Scenario Outline: Verify the licence type for rejected/cancelled assessments in the assessment detailed view
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    And I request assessment as "<Assessment_Type>" of course type "<Type>"
    And I logout
    And I login as an "<User>"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I select assessment status depending on "<User>" and "<Assessment_Type>"
    And I click on "View Details" button on 'Assessment management' page
    And I reject/cancel the Assessment depending on "<Assessment_Type>"
    And I select assessment status depending on "<Cancellation_Type>"
    And I see licence type "<Type>" against the trainer for each assessment in the assessment management page
    When I click on "View Details" button on 'Assessment management' page
    Then I see "License Type" as column name
    And I see "<Type>" under licence type column


    Examples:
      | Assessment_Type | User               | Type      | Cancellation_Type |
      | Requested       | Compliance Manager | Theory    | Rejected          |
      | Requested       | Compliance Manager | Practical | Rejected          |
      | Booked          | Compliance Manager | Theory    | Cancelled         |
      | Booked          | Compliance Manager | Practical | Cancelled         |


  @DR-1146
  Scenario Outline: Verify the licence type for completed assessment in the assessment detailed view
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    And I request assessment as "<Assessment_Type>" of course type "<Type>"
    And I logout
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I select "<Status_Type1>" from assessment status dropdown
    And I click on "View Details" button on 'Assessment management' page
    And I select possible outcome against each trainer depending on "<Type>"
    And I click "Mark Complete"
    And I select "<Status_Type2>" from assessment status dropdown
    And I see licence type "<Type>" against the trainer for each assessment in the assessment management page
    When I click on "View Details" button on 'Assessment management' page
    Then I see "Licence Type" as column name
    And I see "<Type>" under licence type column

    Examples:
      | Assessment_Type | Status_Type1 | Status_Type2 | Type      |
      | Booked          | Approved     | Completed    | Theory    |
      | Booked          | Approved     | Completed    | Practical |



















