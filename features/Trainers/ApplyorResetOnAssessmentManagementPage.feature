@DR_1216

Feature: Apply or Reset on Assessments Management page

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I am on the Assessment Management page
    And I deleted the assessments from Database
    And I click "ASSESSMENT MANAGEMENT"
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    Then I should see a message "There are no assessments to display."

  Scenario: Default view of Assessments Management page is loaded
    Then I see 'Apply' button should be disabled
    And I see 'Reset' button should be disabled
    And the value of the 'start date' will be today's date
    And the end date field value will be empty
    And 'Trainer' filter default value should be empty
    And 'Assessor' filter default value should be empty
    And 'Assessment ID' field should be empty

  Scenario Outline: Verify Default Filters functionality on Assessments Management page
    And I logout
    And I login as a "<ASSESSOR>" user
    And I deleted the assessments from Database
    And I book assessment with nearby trainer
    And I logout
    And I login as a "Compliance Manager" user
    And I click "Assessment Status"
    And I select 'Approved' status from 'Assessment Status' dropdown
    And the value of the 'start date' will be today's date
    When I search with assessor "<Assessor Name>" in the assessor search field
    And I click "Apply" button
    Then assessments will be shown which fall under selected Assessor "<Assessor Name>"
    And I click "Reset" button
    When I click 'Assessment Status' dropdown button
    Then I should not see 'Approved' status is selected
    And I should not see Assessor "<Assessor Name>" in assessor search field
    Then I see 'Apply' button should be disabled
    And I see 'Reset' button should be disabled
    Then I should see a message "There are no assessments to display."

    Examples:
      |Assessor Name|ASSESSOR|
      | deena grit  |Assessor3|
      | sudiv p     |Assessor |


  Scenario Outline: Apply Filter with Date ,Status and Assessor on Assessments Management page
    And I logout
    And I login as a "<ASSESSOR>" user
    And I deleted the assessments from Database
    Then I request assessment to be booked
    And I request assessment as requested
    And I logout
    When I login as an "Compliance Manager"
    Then I am on the Assessment Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I click "Assessment Status"
    And I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
    And I set "<start_date>" and "<end_date>" filter on assessment page
    When I search with assessor "<Assessor Name>" in the assessor search field
    And I click "Apply" button
    Then assessments that meet all filter criteria in combination will be displayed

    Examples:
      |Assessor Name|Status_filter1|Status_filter2|start_date|end_date  |ASSESSOR|
      | deena grit  | Requested    | Approved     |15/06/2016|23/05/2017|Assessor3|


  Scenario Outline: Reset Filters on Assessments Management page
      And I logout
      And I login as a "<ASSESSOR>" user
      And I deleted the assessments from Database
      Then I request assessment to be booked
      And I request assessment as requested
      And I logout
      When I login as an "Compliance Manager"
      Then I am on the Assessment Management page
      When I click 'Assessment Status' dropdown button
      Then I see 'Requested' status is in selected status
      And I click "Assessment Status"
      And I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
      And I set "<start_date>" and "<end_date>" filter on assessment page
      When I search with assessor "<Assessor Name>" in the assessor search field
      And I click "Apply" button
      Then I see 'Apply' button should be disabled
      And I should see 'Reset' button will be enabled
      Then assessments that meet all filter criteria in combination will be displayed
      And I click "Reset"
      Then I see 'Apply' button should be disabled
      And I see 'Reset' button should be disabled
      When I click 'Assessment Status' dropdown button
      Then I see 'Requested' status is in selected status
      And the value of the 'start date' will be today's date
      And the end date field value will be empty
      And 'Assessor' filter default value should be empty
      And 'Trainer' filter default value should be empty
      And I should see default requested assessments for selected "<Assessor Name>" on assessment management page

      Examples:
        |Assessor Name|Status_filter1|Status_filter2|start_date|end_date  |ASSESSOR|
        | deena grit  | Requested    | Approved     |15/06/2016|23/05/2017|Assessor3|


  Scenario Outline: Filter persistence on Assessments Management page(when i navigate to other page and return back to ASSESSMENT MANAGEMENT)
    And I logout
    And I login as a "<ASSESSOR>" user
    And I deleted the assessments from Database
    Then I request assessment to be booked
    And I request assessment as requested
    And I logout
    When I login as an "Compliance Manager"
    Then I am on the Assessment Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I click "Assessment Status"
    And I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
    And I set "<start_date>" and "<end_date>" filter on assessment page
    When I search with assessor "<Assessor Name>" in the assessor search field
    And I click "Apply" button
    Then I see 'Apply' button should be disabled
    And I should see 'Reset' button will be enabled
    Then assessments that meet all filter criteria in combination will be displayed
    And I navigate to "BOOK ASSESSMENT" page
    Then I will be on Book Assessment page
    And I navigate to "ASSESSMENT MANAGEMENT" page
    Then I see applied filters "<Status_filter1>", "<Status_filter2>", "<Assessor Name>", "<start_date>", "<end_date>" should remain same
    Examples:
        |Assessor Name|Status_filter1|Status_filter2|start_date|end_date|ASSESSOR|
        |sudiv p      |Requested     | Approved     |15/06/2016|23/05/2017|Assessor|



  Scenario Outline: Filter persistence on Assessments Management page (when I logout and login back to ASSESSMENT MANAGEMENT)
    And I logout
    And I login as a "<ASSESSOR>" user
    And I deleted the assessments from Database
    Then I request assessment to be booked
    And I request assessment as requested
    And I logout
    When I login as an "Compliance Manager"
    Then I am on the Assessment Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I click "Assessment Status"
    And I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
    And I set "<start_date>" and "<end_date>" filter on assessment page
    When I search with assessor "<Assessor Name>" in the assessor search field
    And I click "Apply" button
    Then I see 'Apply' button should be disabled
    And I should see 'Reset' button will be enabled
    Then assessments that meet all filter criteria in combination will be displayed
    When I search with assessor "<Assessor Name>" in the assessor search field
    And I logout
    And I login as a "Compliance Manager" user
    Then I navigate to "ASSESSMENT MANAGEMENT" page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And the value of the 'start date' will be today's date
    And the end date field value will be empty
    And 'Assessor' filter default value should be empty
    And 'Trainer' filter default value should be empty
    Examples:
      |Assessor Name|Status_filter1|Status_filter2|start_date|end_date  |ASSESSOR|
      | deena grit  |Requested     | Approved     |15/06/2016|23/05/2017|Assessor3|


    Scenario Outline: Apply all statuses(Req/APP/Cance/Reje/Comple) with Date and search for invalid assessor and verify Reset functionality
      When I click 'Assessment Status' dropdown button
      And I select 'Approved' status from 'Assessment Status' dropdown
      And I click 'Assessment Status' dropdown button
      And I select 'Rejected' status from 'Assessments Status' dropdown
      And I click 'Assessment Status' dropdown button
      And I select 'Cancelled' status from 'Assessments Status' dropdown
      And I click 'Assessment Status' dropdown button
      And I select 'Completed' status from 'Assessments Status' dropdown
      And I enter "<start_date>" in start date field
      And I enter "<end_date>" in End date field
      And I enter "<Trainer Name>" in trainer search field on assessment management page
      Then I should not see "No such trainer exists." message
      And I enter "<Assessor Name>" in assessor search field on assessment management page
      Then I should not see "No such assessor exists." message
      And I click "Apply"
      Then I see 'Apply' button should be disabled
      Then I should see a message "There are no assessments to display."
      And I should see 'Reset' button will be enabled
      And I click "Reset"
      And I see 'Reset' button should be disabled
      Then I click 'Assessment Status' dropdown button
      And I see 'Requested' status is in selected status
      And the value of the 'start date' will be today's date
      And the end date field value will be empty
      And 'Assessor' filter default value should be empty
      And 'Trainer' filter default value should be empty
      Examples:
      |Assessor Name|Trainer Name|start_date|end_date  |
      |asd          |adf         |12/06/2016|28/01/2017|


  Scenario Outline: remove default filters on assessement management page and verify Apply n Reset functionality
    When I click 'Assessment Status' dropdown button
    And I uncheck "<status>" status
    And I enter "<start_date>" in start date field
    And I click "Apply"
    Then I see 'Apply' button should be disabled
    And I should see 'Reset' button will be enabled
    Then I should see a message "There are no assessments to display."
    And I click "Reset"
    Then I click 'Assessment Status' dropdown button
    And I see 'Requested' status is in selected status
    And the value of the 'start date' will be today's date
    And the end date field value will be empty
    And 'Assessor' filter default value should be empty
    And 'Trainer' filter default value should be empty

    Examples:
    |start_date|status|
    |          |Requested|
