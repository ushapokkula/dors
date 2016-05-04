@DR-398
Feature: As a NGU user,
  As an NGU user,
  I want to able to filter records on Assessments Management page by date range,
  so that I can view filtered list of records I am interested in.

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I am on the Assessments Management page
    And default view of the page is loaded


  Scenario: In conjunction with existing filters
    #When I select a date range and set a filter on other filters available on the page (e.g. Status) i.e. use multiple filters in combination
   # Then assessments that meet all filter criteria in combination will be displayed


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

    Scenario: verify default date range
    And default Date range filter will have no selection
    #Examples:
    #|Date_range|
    #|Start date|
    #|End date   |
     #Then
