@DR-398 @pass
Feature: As a NGU user,
  As an NGU user,
  I want to able to filter records on Assessments Management page by date range,
  so that I can view filtered list of records I am interested in.

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I am on the Assessments Management page
    And default view of the page is loaded

  Scenario: Verify the Assessments sorted by (Date) with nearest Date first
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I login as an "Compliance Manager"
    Then I will see list of all Assessments Requests with status requested
    And The assessment list will be sorted by assessment date

  Scenario: Verify default date range filter selection
      And default Date range filter will have no selection

  Scenario Outline: Verify Start date and End Date fields enable functionality
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I login as an "Compliance Manager"
    And I enter "<start_date>" in start date field
    Then The assessment list will be sorted by assessment date
    And the end date option will be empty
    Examples:
      |start_date|
      |15/06/2016|
      |23/12/2016|

  Scenario Outline: Won't be able to select an 'end date' which falls before the 'start date'
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I login as an "Compliance Manager"
    And I enter "<end_date>" in End date field
    Then the 'start date' field auto populated with date
    And the value of the 'start date' will be 'today date'
    When I enter "<start_date>" more than 'end date'
    Then the "<end_date>" falls one day more than 'start date'
    Examples:
      |end_date|start_date|
      |22/01/2017|27/04/2017|


  Scenario Outline: Sort the assessments with in the selected date range
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessments
    And I login as an "Compliance Manager"
    And I set "<start_date>" and "<end_date>" filter on assessment page
    Then assessments falling in "<start_date>" and "<end_date>" range will be displayed
    And The assessment list will be sorted by assessment date
    Examples:
      |start_date|end_date|
      |10/08/2016|16/11/2016|
      |10/08/2016|23/05/2017|
      |20/04/2017|16/05/2017|
      |15/05/2017|15/05/2017|

  Scenario Outline: In conjunction with existing filters
    Then I set status "<Status_filter1>" and "<Status_filter2>" available on the assessment page
    And I set "<start_date>" and "<end_date>" filter on assessment page
    Then assessments that meet all filter criteria in combination will be displayed
    Examples:
    |Status_filter1|Status_filter2|start_date|end_date|
    | Requested    | Approved     |15/06/2016|23/05/2017|
