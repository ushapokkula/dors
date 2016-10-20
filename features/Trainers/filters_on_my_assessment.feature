@manual
@DR-167
Feature: Filter on My Assessment page

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"

#
#  @my_assessment_status_filter1
#  Scenario: Verify the assessment status filter visibility on My Assessments page and default view
#    And I am on the My Assessments page
#    When The default view of the page of My assessments is loaded
#    Then I can see the assessment status filter with these following options on My Assessments page
#      | Expected Status Filters |
#      | Requested               |
#      | Approved                |
#      | Rejected                |
#      | Cancelled               |
#      | Completed               |
#
#  @my_assessment_status_filter2
#  Scenario: Verify the default option selected as 'Booked' from the status filter
#    And I am on the My Assessments page
#    When I can see the assessment status filter with these following options on My Assessments page
#      | Expected Status Filters |
#      | Requested               |
#      | Approved                |
#      | Rejected                |
#      | Cancelled               |
#      | Completed               |
#    Then I see that the "Approved" option is selected by default on my assessments page
#
#  @my_assessment_status_filter3
#  Scenario Outline: Verify the visibility of assessments when respective status filter is choosen
#    And I am on the My Assessments page
#    When I select "<Status Filter>" on My Assessments page
#    Then Only those assessments will be shown with status as "<Status Assertion>" on My assessments page
#
#    Examples:
#      | Status Filter | Status Assertion |
#      | REQUESTED     | Requested        |
#      | APPROVED      | Approved         |
#      | REJECTED      | Rejected         |
#      | CANCELLED     | Cancelled        |
#      | COMPLETED     | Completed        |
#
#  @my_assessment_status_filter4
#  Scenario Outline: Verify the visibility of assessments when combination of status filter is selected
#    And I am on the My Assessments page
#    And I select "<Status Filter1>" and "<Status Filter2>" on My Assessments page
#    Then Only those assessments will be shown with status as "<Status Assertion1>" and "<Status Assertion2>"
#
#
#    Examples:
#      | Status Filter1 | Status Filter2 | Status Assertion1 | Status Assertion2 |
#      | REQUESTED      | APPROVED       | Requested         | Approved          |
#      | APPROVED       | REJECTED       | Approved          | Rejected          |
#      | REJECTED       | CANCELLED      | Rejected          | Cancelled         |
#      | REJECTED       | COMPLETED      | Rejected          | Completed         |

  @DR_385
  Scenario: Verify the scheme filter visibility on my assessements page
    Given I am on the My Assessments page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied

  @DR_385
  Scenario Outline: Verify the assessments list after applying single course from course filter
    Given I request assessment as "<Type>"
    When I navigate to "MY ASSESSMENTS" page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied
    And I select assessment status depending on "<Type>"
    When I select one "<Course>" from the dropdown
    And I click "Apply"
    Then I see assessments matching with that course filter are displayed
    And I click "View Details"
    Then I see that the "<Type>" assessments are displayed which belong to the selected "<Course>"

    Examples:
      | Type      | Course        |
      | Requested | Speed Control |
      | Booked    | Speed Control |

  @DR_385
  Scenario Outline: Verify the results after applying multiple courses from the filter without other filters
    Given I request assessment as "<Type>"
    When I navigate to "MY ASSESSMENTS" page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied
    And I select assessment status depending on "<Type>"
    When I select  multiple courses "<Course1>", "<Course2>","<Course3>" from the dropdown
    And I click "Apply"
    Then I see assessments matching with that course filter are displayed
    And I click "View Details"
    Then I see that the "<Type>" assessments are displayed which belong to the selected "<Course1>","<Course2>" and "<Course3>"


    Examples:
      | Type      | Course1       | Course2 | Course3                          |
      | Requested | Speed Control | RiDE    | National Driver Alertness Course |
      | Booked    | Speed Control | RiDE    | National Driver Alertness Course |

  @DR_385
  Scenario Outline: Verify the message when there are no assessments matching course filter
    Given I request assessment as "<Type>"
    When I navigate to "MY ASSESSMENTS" page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied
    And I select assessment status depending on "<Type>"
    When I select one "<Course>" from the dropdown
    And I click "Apply"
    Then I see the message "There are no assessments to display" on my assessments page

    Examples:
      | Type      | Course |
      | Requested | RiDE   |
      | Booked    | RiDE   |