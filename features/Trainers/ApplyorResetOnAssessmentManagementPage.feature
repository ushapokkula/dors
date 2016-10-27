DR-1216
Feature: Apply/Reset on Assessments Management page

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I am on the Assessment Management page
    And I deleted the assessments from Database
    And I click "ASSESSMENT MANAGEMENT"
    Then I should see a message "There are no assessments to display."

  Scenario: Default view of Assessments Management page is loaded
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    Then I see "Apply" button should be disabled
    And I see "Reset" button should be disabled
    And the value of the 'start date' will be today's date
    And the end date field value will be empty
    And "Trainer" filter default value should be empty
    And "Assessor" filter default value should be empty

  Scenario Outline: Verify Default Filters functionality on Assessments Management page
    And I logout
    And I login as a "<ASSESSOR>" user
    And I book assessment with nearby trainer
    And I logout
    And I login as a "Compliance Manager" user
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I select 'Approved' status from 'Assessment Status' dropdown
    And the value of the 'start date' will be today's date
    When I search with assessor "<Assessor Name>" in the assessor search field
    And I click "Apply" button
    Then assessments will be shown which fall under selected Assessor "<Assessor Name>"
    And I click "Reset" button
    When I click 'Assessment Status' dropdown button
    Then I should not see 'Approved' status is selected
    And I should not see Assessor "<Assessor Name>" in assessor search field
    Then I should see a message "There are no assessments to display."
    Examples:
      |Assessor Name|ASSESSOR|
      | deena grit  |Assessor3|
      | sudiv p     |Assessor |


  Scenario Outline: Apply Filter with Date ,Status and Assessor on Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I logout
    And I login as a "<ASSESSOR>" user
    Then I request assessment
    Then I request assessment to be booked
    And I logout
    And I login as a "<Compliance Manager>" user
    Then I am on the Assessment Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I set status filter with "<Status_filter>"
    And I enter "<Start_Date>" in start date field
    And I enter "<End_Date>" in End date field
    When I search with assessor "<Assessor Name>" in the assessor search field
    And I click "Apply" button
    Then I see assessments will be displayed under that applied filters
    And I click "Reset"
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And the value of the 'start date' will be today's date
    And the end date field value will be empty
    And "Assessor" filter default value should be empty
    And I should see default requested assessments on assessment management page
    Examples:
      |Assessor Name|Status_filter|Start_Date|End_Date|ASSESSOR|
      | Deena grit  |             |          |        |Assessor|
      |             |             |          |        |Assessor3|


    Scenario Outline: Reset Filters on Assessments Management page
      When I click 'Assessment Status' dropdown button
      Then I see 'Requested' status is in selected status
      And I logout
      And I login as a "<ASSESSOR>" user
      Then I request assessment
      Then I request assessment to be booked
      And I logout
      And I login as a "<Compliance Manager>" user
      Then I am on the Assessment Management page
      Then I see 'Requested' status is in selected status
      And I set status filter with "<Status_filter>"
      And I enter "<Start_Date>" in start date field
      And I enter "<End_Date>" in End date field
      When I searched "<Assessor Name>" in assessor search field
      Then I should see "Apply" button will be enable
      And I click "Apply" button
      Then I see that assessments will be displayed under that criteria
      And click on "Reset" button
      Then I see 'Requested' status is in selected status
      And "Start Date" filter default value should be today's date
      And "End Date" filter default value should be empty
      And "Trainer" filter default value should be empty
      And "Assessor" filter default value should be empty
      And "Search Assessment" field should be empty

      Examples:
        |Assessor Name|Status_filter|Start_Date|End_Date|ASSESSOR|
        |             |             |          |        |Assessor|
        |             |             |          |        |Assessor3|


    Scenario Outline: Filter persistence on Assessments Management page
        When I click 'Assessment Status' dropdown button
        Then I see 'Requested' status is in selected status
        And I logout
        And I login as a "<ASSESSOR>" user
        Then I request assessment
        And I logout
        And I login as a "<Compliance Manager>" user
        Then I am on the Assessment Management page
        When I click 'Assessment Status' dropdown button
        Then I see 'Requested' status is in selected status
        And I set status filter with "<Status_filter>"
        And I enter "<Start_Date>" in start date field
        And I enter "<End_Date>" in End date field
        When I search with assessor "<Assessor Name>" in the assessor search field
        Then I should see "Apply" button will be enable
        And I click "Apply" button
        Then I see that assessments will be displayed under that criteria
        And I navigate to "Book Assessment" page
        Then I will be redirected to "Book Assessment" page
        And I navigate to "ASSESSMENT MANAGEMENT" page
        Then the filters set as  above will still be applied

      Examples:
      |Assessor Name|Status_filter|Start_Date|End_Date|ASSESSOR|
      |             |             |          |        |Assessor|
      |             |             |          |        |Assessor3|

  Scenario Outline: Filter persistence on Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I logout
    And I login as a "<ASSESSOR>" user
    Then I request assessment
    And I logout
    And I login as a "<Compliance Manager>" user
    Then I am on the Assessment Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I set status filter with "<Status_filter>"
    And I enter "<Start_Date>" in start date field
    And I enter "<End_Date>" in End date field
    When I search with assessor "<Assessor Name>" in the assessor search field
    Then I should see "Apply" button will be enable
    And I click "Apply" button
    Then I see that assessments will be displayed under that criteria
    And I logout
    And I login as a "<Compliance Manager>" user
    Then I navigate to "ASSESSMENT MANAGEMENT" page
    And I see there is no Filters applied

    Examples:
      |Assessor Name|Status_filter|Start_Date|End_Date|ASSESSOR|
      |             |             |          |        |Assessor|
      |             |             |          |        |Assessor3|