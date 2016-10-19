@manual
@DR-167
Feature: Filter on My Assessment page

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on the My Assessments page

  @my_assessment_status_filter1
  Scenario: Verify the assessment status filter visibility on My Assessments page and default view
    When The default view of the page of My assessments is loaded
    Then I can see the assessment status filter with these following options on My Assessments page
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |

  @my_assessment_status_filter2
  Scenario: Verify the default option selected as 'Booked' from the status filter
    When I can see the assessment status filter with these following options on My Assessments page
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |
    Then I see that the "Approved" option is selected by default on my assessments page

  @my_assessment_status_filter3
  Scenario Outline: Verify the visibility of assessments when respective status filter is choosen
    When I select "<Status Filter>" on My Assessments page
    Then Only those assessments will be shown with status as "<Status Assertion>" on My assessments page

    Examples:
      | Status Filter | Status Assertion |
      | REQUESTED     | Requested        |
      | APPROVED      | Approved         |
      | REJECTED      | Rejected         |
      | CANCELLED     | Cancelled        |
      | COMPLETED     | Completed        |

  @my_assessment_status_filter4
  Scenario Outline: Verify the visibility of assessments when combination of status filter is selected
    And I select "<Status Filter1>" and "<Status Filter2>" on My Assessments page
    Then Only those assessments will be shown with status as "<Status Assertion1>" and "<Status Assertion2>"


    Examples:
      | Status Filter1 | Status Filter2 | Status Assertion1 | Status Assertion2 |
      | REQUESTED      | APPROVED       | Requested         | Approved          |
      | APPROVED       | REJECTED       | Approved          | Rejected          |
      | REJECTED       | CANCELLED      | Rejected          | Cancelled         |
      | REJECTED       | COMPLETED      | Rejected          | Completed         |

  @DR_385
  Scenario: Verify the scheme filter visibility on my assessements page
    Given the option to filter the list by courses is displayed
    And no course filters are selected
    And  no course filters are applied

  @DR_385
  Scenario Outline: Verify the trainers list after applying single course from course filter
    Given the option to filter the list by courses is displayed
    And no course filters are selected
    And  no course filters are applied
    When I select one "<string>" from the dropdown
    Then the results are displayed showing only those trainers who fall under the selected course "<Course>"

    Examples:
      | Course       |
      | Berks-Scheme |