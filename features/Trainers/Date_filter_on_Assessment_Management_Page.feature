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

  Scenario: Verify the default option selected as 'Requested' from the status filter
    Then I can see the assessment status filter with these following options
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |
    Then I see that the "Requested" option is selected by default

  Scenario: Verify the Assessments sorted by Date
    When I login as an "Assessor3"
    Then I request assessments
    And I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT"
    Then I will see list of all Assessments Requests with status requested
    And The assessment list will be sorted by assessment date

    Scenario: Verify by default Start and End date fields filter
      #Then I see that the "Requested" option is selected by default
      And default Date range filter will have no selection

    #Scenario:selecting end date option will be disabled until I have selected a start date

    Scenario Outline: Verify Start date and End Date fields enable functionality
      When I select "<start_date>" or type it in
      Then the end date option will be enabled
      Examples:
      |start_date|
      |10/12/2016|

    Scenario Outline: won't be able to select an end date which falls before the start date
        When I enter or select "<end_date>" in End date field
        Then the "<start_date>" field auto populated with date
        And The value of the "<start_date>" will be end date -1 day
       Examples:
       |start_date|end_date|
       |21/05/2016|06/05/2016|

     Scenario Outline: Sort the assessments with in the selected date range
       When I login as an "Assessor3"
       Then I request assessments
       #And I login as an "Compliance Manager"
       #And I click "ASSESSMENT MANAGEMENT"
       #Then I will see list of all Assessments Requests with status requested
       When I have selected the "<start_date>" and "<end_date>"
       Then assessment falling in that range will be displayed
       And the assessments will be sorted by nearest date first
      Examples:
      |start_date|end_date|
      |10/08/2016|10/08/2016|
      |10/07/2016|23/01/2017|
      |10/08/2016|22/01/2017|
      |20/01/2017|23/01/2017|

  Scenario Outline: In conjunction with existing filters
    When I select a "<start_date>" and "<end_date>"
    And  I set a filter on "<Status_filter>" available on the assessment page
    Then assessments that meet all filter criteria in combination will be displayed
    Examples:
    |Status_filter|start_date|end_date|

