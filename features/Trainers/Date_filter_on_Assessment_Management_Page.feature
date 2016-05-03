@DR-398
Feature: As a NGU user,
  As an NGU user,
  I want to able to filter records on Assessments Management page by date range,
  so that I can view filtered list of records I am interested in.

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I am on the Assessments Management page


  Scenario: In conjunction with existing filters
    And default view of the page is loaded
    When I select a date range and set a filter on other filters available on the page (e.g. Status) i.e. use multiple filters in combination
    Then assessments that meet all filter criteria in combination will be displayed


  Scenario: Verify the default option selected as 'Requested' from the status filter
    And the default view of the page is loaded
    Then I can see the assessment status filter with these following options
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |
    Then I see that the "Requested" option is selected by default

  Scenario: Verify the Assessments sorted by Date
    And Assessments sorted by nearest date first

    Scenario:
     And default date range filter will have no selection
     Then
