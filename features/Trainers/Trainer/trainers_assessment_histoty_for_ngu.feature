@DR-836 @pass
Feature: As an NGU (TrainingGovernance)
  I want to be able to search a Trainer with Name or ID,
  so that I can filter the assessment records on Assessment
  management page.

  Background:
    Given that I have licence.ndors.org.uk page opened

  Scenario Outline: search for assessments  by trainer name
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    Examples:
         | Trainer Name|
         | bob         |
         | tes         |
         | roo         |

  Scenario Outline: Verify the auto-predict search for trainer when searched with Trainer ID
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    When I start typing six digits as "<Trainer ID>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    Examples:
      | Trainer ID |
      | 111111     |
      | 333333     |
      | 555555     |

 Scenario Outline: Verify the validation message for 'no trainer exists' for invalid Trainer ID
   And I login as an "Compliance Manager"
   When I navigate to "ASSESSMENT MANAGEMENT" page
   When I start typing invalid trainer id as "<Trainer ID>" in the trainer search field
   Then I see the message "No such trainer exists."
   Examples:
   |Trainer ID|
   |120112012010|
   |111111111111111|
   |00000000000000|


  Scenario Outline: Verify the format of displaying the list of names when trainer name is searched
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    When I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    When I hit enter after typing first three characters of trainer name as "<Trainer Name>"
    Then searched trainer "<Name>" name includes trainer full name and trainer ID
    Then The first name "<Name>" will be selected from the auto predict list
    Examples:
      | Trainer Name |Name                   |
      | ali          | Ali Mashhadi (160001) |


  Scenario: Verify validation message 'no trainer exists' when searched trainer record not in database
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    When The search criteria does'nt match any trainer record on the database
    Then I see the message "No such trainer exists."


  Scenario Outline: Verify trainer details by moving up and down arrow keys from auto-predict list
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    When I hit DOWN arrow key from the trainer auto predict list
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    When I hit UP arrow key from the trainer auto predict list
    Examples:
      | Trainer Name |
      | ali          |


  Scenario Outline: Verify 'no assessment records' are found in the database for selected filter criteria on assessment management page
    When I login as an "Assessor3"
    Then I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    Then I request assessment
    And I logout
    And I login as an "Compliance Manager"
    Then I navigate to "ASSESSMENT MANAGEMENT" page
    Then I am on the Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I enter "<start date>" in start date field
    And I enter "<end date>" in End date field
    And I search for "<Trainer First Name>" and "<Trainer Last Name>" in the trainer search field
    Then I should see a message "There are no assessments to display."
    Examples:
    |Trainer First Name|Trainer Last Name|start date|end date|
    | auto1            |Trainer           |5/08/2016|5/09/2016|

  Scenario Outline: Verify assessment records, When I set values in other filters on the page: Status, Start Date, End Date
    When I login as an "Assessor3"
    Then I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    Then I request assessment
    And I book assessment with nearby trainer
    And I logout
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    Then I am on the Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    Then I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
    And I set "<start_date>" and "<end_date>" filter on assessment page
    And I search for "<Trainer First Name>" and "<Trainer Last Name>" in the trainer search field
    Then the system will filter assessment records in all "<end_date>","<Status_filter1>","<Status_filter2>","<selected_trainer_name>"combination on assessment management page
    Examples:
      |Trainer First Name  |Trainer Last Name|Status_filter1|Status_filter2|start_date|end_date |selected_trainer_name|
      |  auto7             |Trainer          | Requested    | Approved     |25/07/2016|10/09/2016|auto7 Trainer |
      |  auto1             |Trainer          |Requested    | Approved      |5/08/2016 |22/01/2017|auto1 Trainer |



  Scenario Outline: Verify assessments data by removing selected trainer from trainer search field
    When I login as an "Assessor3"
    Then I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    Then I request assessment
    And I book assessment with nearby trainer
    And I logout
    And I login as an "Compliance Manager"
    Then I navigate to "ASSESSMENT MANAGEMENT" page
    Then I am on the Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    Then I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
    And I set "<start_date>" and "<end_date>" filter on assessment page
    And I search for "<Trainer First Name>" and "<Trainer Last Name>" in the trainer search field
    When I click X against the selected trainer as shown in trainer search field
    Then "<selected_trainer_name>" will be removed from trainer search field
    And assessments list on the Assessments page will be refreshed to show updated data
    When I click "Assessment Status"
    Then other filters "<Status_filter1>","<Status_filter2>","<start_date>","<end_date>" , if set, will be remain same
    Examples:
      |Trainer First Name  |Trainer Last Name|Status_filter1|Status_filter2|start_date|end_date |selected_trainer_name|
      |  auto7             |Trainer          | Requested    | Approved     |25/07/2016|10/12/2016|auto7 Trainer |
      |  auto1             |Trainer          |Requested    | Approved      |5/08/2016 |22/01/2017|auto1 Trainer |
