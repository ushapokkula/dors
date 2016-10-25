DR-1216
Feature: Apply/Reset on Assessments Management page

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I am on the Assessments Management page
    And I deleted the assessments from Database
    And I click "ASSESSMENT MANAGEMENT"
    Then I should see a message "There are no assessments to display."

  Scenario: Default view of Assessments Management page is loaded
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And "Start Date" filter default value should be today's date
    And "End Date" filter default value should be empty
    And "Trainer" filter default value should be empty
    And "Assessor" filter default value should be empty
    Then I should see "Apply" button should be disabled
    And I should see "Reset" buton should be disabled

  Scenario Outline: Apply Filters on Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    When I searched "<Assessor Name>" in assessor search field
    And I click "Apply" button
    Then I should see a message saying "<string>"

    Examples:
    |Assessor Name|
    | deena       |
    | Sudiv       |


  Scenario Outline: Apply Filter with date ,status and Assessor on Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I logout
    And I login as a "<ASSESSOR>" user
    Then I request assessment
    Then I request assessment to be booked
    And I logout
    And I login as a "<Compliance Manager>" user
    Then I am on the Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I set status filter with "<Status_filter>"
    And I enter "<Start_Date>" in start date field
    And I enter "<End_Date>" in End date field
    When I searched "<Assessor Name>" in assessor search field
    Then I should see "Apply" button will be enable
    And I click "Apply" button
    Then I see that assessments will be displayed under that criteria
    Examples:
      |Assessor Name|Status_filter|Start_Date|End_Date|ASSESSOR|
      |             |             |          |        |Assessor|
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
      Then I am on the Assessments Management page
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



      Scenario Outline:  Filter persistence on Assessments Management page
        When I click 'Assessment Status' dropdown button
        Then I see 'Requested' status is in selected status
        And I logout
        And I login as a "<ASSESSOR>" user
        Then I request assessment
        Then I request assessment to be booked
        And I logout
        And I login as a "<Compliance Manager>" user
        Then I am on the Assessments Management page
        When I click 'Assessment Status' dropdown button
        Then I see 'Requested' status is in selected status
        And I set status filter with "<Status_filter>"
        And I enter "<Start_Date>" in start date field
        And I enter "<End_Date>" in End date field
        When I searched "<Assessor Name>" in assessor search field
        Then I should see "Apply" button will be enable
        And I click "Apply" button
        Then I see that assessments will be displayed under that criteria
        And when I navigate to another page and return to the Assessment Management page, the filters set above will still be applied
      Examples:
      |Assessor Name|Status_filter|Start_Date|End_Date|ASSESSOR|
      |             |             |          |        |Assessor|
      |             |             |          |        |Assessor3|
    