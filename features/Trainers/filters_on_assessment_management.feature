#@manual
#@DR-175
#Feature: As a NGU user,
#  I want to be able to filter assessment records on Assessment Management page by Status,
#  so that I can view filtered list of records I am interested in.
#
#  Background:
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I am on the Assessments Management page
#
#  @status_filter1
#  Scenario: Verify the assessment status filter visibility on assessment management page
#    When The default view of the page is loaded
#    Then I can see the assessment status filter with these following options
#      | Expected Status Filters |
#      | Requested               |
#      | Approved                |
#      | Rejected                |
#      | Cancelled               |
#      | Completed               |
#
#
#  @status_filter2
#  Scenario: Verify the default option selected as 'Requested' from the status filter
#    When I can see the assessment status filter with these following options
#      | Expected Status Filters |
#      | Requested               |
#      | Approved                |
#      | Rejected                |
#      | Cancelled               |
#      | Completed               |
#    Then I see that the "Requested" option is selected by default
#
#
#  @status_filter3
#  Scenario Outline: Verify the visibility of assessments when respective status filter is choosen
#    When I select "<Status Filter>"
    #Then Only those assessments will be shown with status as "<Status Assertion>" on Assessment management page
#
#
#    Examples:
#      | Status Filter | Status Assertion |
#      | REQUESTED     | Requested        |
#      | APPROVED      | Approved         |
#     # | REJECTED      | Rejected         |
#     # | CANCELLED     | Cancelled        |
#     # | COMPLETED     | Completed        |
#
#  @status_filter4
#  Scenario Outline: Verify the visibility of assessments when combination of status filter is selected
#    And I select "<Status Filter1>" and "<Status Filter2>"
#    Then Only those assessments will be shown with status as "<Status Assertion1>" and "<Status Assertion2>" on Assessment management page
#
#
#
#    Examples:
#      | Status Filter1 | Status Filter2 | Status Assertion1 | Status Assertion2 |
#      | REQUESTED      | APPROVED       | Requested         | Approved          |
#      | APPROVED       | REJECTED       | Approved          | Rejected          |
#      | REJECTED       | CANCELLED      | Rejected          | Cancelled         |
#      | REJECTED       | COMPLETED      | Rejected          | Completed         |
#
#
#




