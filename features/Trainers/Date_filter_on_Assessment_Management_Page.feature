@DR-398  @DR-395 @DR_1219 @pass
Feature: Date Filter on Assessment Page
  As an NGU user,
  I want to able to filter records on Assessments Management page by date range,
  so that I can view filtered list of records I am interested in.

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I am on the Assessments Management page
    And I deleted the assessments from Database
    And I click "ASSESSMENT MANAGEMENT"
    Then I should see a message "There are no assessments to display."
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I logout

  Scenario: Verify the Assessments sorted by (Date) with nearest Date first
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I logout
    And I login as an "Compliance Manager"
    Then I will see list of all requested assessments
    And The assessment list will be sorted by assessment course date

  @DR_1219
  Scenario: Verify default date range filter selection
     When I login as an "Compliance Manager"
      And default Date range filter will have no selection
      And the value of the 'start date' will be today's date

  Scenario Outline: Verify Start date and End Date fields enable functionality
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I logout
    And I login as an "Compliance Manager"
    And I enter "<start_date>" in start date field
    And The assessment list will be sorted by assessment course date
    And the end date field value will be empty
    Examples:
      |start_date|
      |15/06/2016|
      |23/12/2016|

  Scenario Outline: 'start date' value auto populates to today's date
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I logout
    And I login as an "Compliance Manager"
    And I enter "<end_date>" in End date field
    Then the 'start date' field auto populated
    And the value of the 'start date' will be today's date
    Examples:
      |end_date|
      |22/01/2017|

  Scenario Outline: 'end date' value always greater than the 'start date'
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I logout
    And I login as an "Compliance Manager"
    And I enter "<end_date>" in End date field
    And the value of the 'start date' will be today's date
    When I enter "<start_date>" more than 'end date'
    Then the 'end date' falls one day more than 'start date'
    Examples:
      |end_date|start_date|
      |22/01/2017|27/04/2017|


  Scenario Outline: Sort the assessments with in the selected date range
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I logout
    And I login as an "Compliance Manager"
    And I set "<start_date>" and "<end_date>" filter on assessment page
    Then assessments falling in "<start_date>" and "<end_date>" range will be displayed
    And The assessment list will be sorted by assessment course date
    Examples:
      |start_date|end_date|
      |10/08/2016|16/11/2016|
      |10/08/2016|23/05/2017|
      |20/04/2017|16/05/2017|
      |15/05/2017|15/05/2017|

  Scenario Outline: Verify the assessments that meet 'Date'and 'Status' combination
    Given I login as an "Assessor3"
    Then I request assessment to be booked
    And I request assessment as requested
    And I logout
    When I login as an "Compliance Manager"
    And I click "Assessment Status"
    And I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
    And I set "<start_date>" and "<end_date>" filter on assessment page
    Then assessments that meet all filter criteria in combination will be displayed
    Examples:
    |Status_filter1|Status_filter2|start_date|end_date|
    | Requested    | Approved     |15/06/2016|23/05/2017|
