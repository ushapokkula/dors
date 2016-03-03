@DR-175
Feature: As a NGU user,
  I want to be able to filter assessment records on Assessment Management page by Status,
  so that I can view filtered list of records I am interested in.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I am on the Assessments Management page

  @status_filter1
  Scenario: Verify the assessment status filter visibility
    When The default view of the page is loaded
    Then I can see the assessment status filter with these following options
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |

  @status_filter2
  Scenario: Verify the default option selected as 'Requested' from the status filter
    And The default view of the page is loaded
    When I can see the assessment status filter with these following options
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |
    Then I see that the "REQUESTED" option is selected by default

  @status_filter3
  Scenario Outline: Verify the visibility of assessments when respective status filter is choosen
    #And The default view of the page is loaded
    When I select "<Status Filter>"
    Then Only those assessments will be shown with status as "<Status Assertion>"

    Examples:
      | Status Filter | Status Assertion |
      | REQUESTED     | Requested        |
      | APPROVED      | Approved         |
      | REJECTED      | Rejected         |
      | CANCELLED     | Cancelled        |
      | COMPLETED     | Completed        |

  @status_filter4
  Scenario Outline: Verify the visibility of assessments when combination of status filter is selected
    And The default view of the page is loaded
    And I select "<Status Filter1>"
    And I select "<Status Filter2>"
    Then Only those assessments will be shown with status as "<Status Assertion>"


    Examples:
      | Status Filter1 | Status Filter2 |
      | REQUESTED      | APPROVED       |
      | APPROVED       | REJECTED       |
      | REJECTED       | CANCELLED      |
      | CANCELLED      | COMPLETED      |







