@DR-167 @pass
Feature: Filter on My Assessment page

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"

  @my_assessment_status_filter1
  Scenario: Verify the assessment status filter visibility on My Assessments page and default view
    And I am on the My Assessments page
    When The default view of the page of My Assessments is loaded
    Then I can see the assessment status filter with these following options on My Assessments page
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |

  @my_assessment_status_filter2
  Scenario: Verify the default option selected as 'Booked' from the status filter
    And I am on the My Assessments page
    When I can see the assessment status filter with these following options on My Assessments page
      | Expected Status Filters |
      | Requested               |
      | Approved                |
      | Rejected                |
      | Cancelled               |
      | Completed               |
    Then I see that the "Approved" option is selected by default on My Assessments page


#  @my_assessment_status_filter3
#  Scenario Outline: Verify the visibility of assessments when respective status filter is choosen
#    And I am on the My Assessments page
#    When I select "<Status Filter>" on My Assessments page
#    Then Only those assessments will be shown with status as "<Status Assertion>" on My Assessments page
#
#    Examples:
#      | Status Filter | Status Assertion |
#      | REQUESTED     | Requested        |
#      | APPROVED      | Approved         |
#      | REJECTED      | Rejected         |
#      | CANCELLED     | Cancelled        |
#      | COMPLETED     | Completed        |

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


  @DR_385 @pass
  Scenario: Verify the scheme filter visibility on my assessements page
    Given I am on the My Assessments page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied

  @DR_385 @pass
  Scenario Outline: Verify the assessments list after applying single course from course filter
    Given I deleted the assessments from Database
    And I request assessment as "<Type>"
    When I navigate to "MY ASSESSMENTS" page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied
    And I select assessment status depending on "<Type>" on my assessments page
    When I select one "<Course>" from the dropdown
    And I click "Apply"
    Then I see assessments matching with that course filter are displayed
    And I click "View Details"
    Then I see that the "<Type>" assessments are displayed which belong to the selected "<Course>"

    Examples:
      | Type      | Course        |
      | Requested | Speed Control |
      | Approved  | Speed Control |

  @DR_385  @pass
  Scenario Outline: Verify the results after applying multiple courses from the filter without other filters
    Given I deleted the assessments from Database
    And I request assessment as "<Type>"
    When I navigate to "MY ASSESSMENTS" page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied
    And I select assessment status depending on "<Type>" on my assessments page
    When I select  multiple courses "<Course1>", "<Course2>","<Course3>" from the dropdown
    And I click "Apply"
    Then I see assessments matching with that course filter are displayed
    And I click "View Details"
    Then I see that the "<Type>" assessments are displayed which belong to the selected "<Course1>","<Course2>" and "<Course3>"
    Examples:
      | Type      | Course1       | Course2 | Course3                          |
      | Requested | Speed Control | RiDE    | National Driver Alertness Course |
      | Approved   | Speed Control | RiDE    | National Driver Alertness Course |

  @DR_385  @pass
  Scenario Outline: Verify the message when there are no assessments matching course filter
    Given I deleted the assessments from Database
    And I request assessment as "<Type>"
    When I navigate to "MY ASSESSMENTS" page
    And I can see "Filters" section on My assessments page
    And I can see course filter under "Filters" section with label "Courses"
    And no course filters are selected
    And  no course filters are applied
    And I select assessment status depending on "<Type>" on my assessments page
    When I select one "<Course>" from the dropdown
    And I click "Apply"
    Then I see the message "There are no assessments to display" on my assessments page

    Examples:
      | Type      | Course |
      | Requested | Motorway Course   |
      | Approved  | Motorway Course   |


  @DR_384
  Scenario: Verify the visibility of force filter on my assessments page
    Given I am on the My Assessments page
    And I can see "Filters" section on My assessments page
    And the option to filter the list by "Force Areas" is Displayed
    And The option to "Include All" force areas is available with "Yes" and "No" buttons

  @DR_384
  Scenario Outline: Verify the visibility of pre-selected force area in the force filter and its results
    Given I deleted the assessments from Database
    And I request assessment as "<Type>"
    When I navigate to "MY ASSESSMENTS" page
    And I can see "Filters" section on My assessments page
    And the option to filter the list by "Force Areas" is Displayed
    And The option to "Include All" force areas is available with "Yes" and "No" buttons
    And I can see "<Selected-Force>" as default force in the force filter
    And the results are displayed based on selected force force

    Examples:
      | Selected-Force | Type     |
      | ESSEX POLICE   | Approved |

  @DR_384
  Scenario Outline: Verify the assessments listing after apply single force without other filters
    Given I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    And I request assessment as "<Type>" for trainers under "<Force>"
    And I click "MY ASSESSMENTS"
    And I can see "Filters" section on My assessments page
    And the option to filter the list by "Force Areas" is Displayed
    When I apply single force "<Force>" in the force filter
    And no others filters are applied
    And I click "Apply"
    Then The results listing will be updated showing only those assessments who fall under the selected force area

    Examples:
      | Force    | Type     |
      | CHESHIRE | Approved   |

  @DR_384
  Scenario Outline: Verify the assessments listing after apply multiple forces without other filters
    Given I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    And I request assessment as "<Type>" for trainers under "<Force2>"
    And I click "MY ASSESSMENTS"
    And I can see "Filters" section on My assessments page
    And the option to filter the list by "Force Areas" is Displayed
    When I apply multiple forces like "<Force1>" and "<Force2>"in the force filter
    And no others filters are applied
    And I click "Apply"
    Then The results listing will be updated showing only those assessments who fall under cheshire and british transport police force area

    Examples:
      | Force1   | Type     | Force2                   |
      | CHESHIRE | Approved | BRITISH TRANSPORT POLICE |

  @DR_384
  Scenario Outline: Verify the assessments listing when 'All' force areas are included
    Given I deleted the assessments from Database
    And I request assessment as "<Type>"
    And I request assessment as "<Type>" for trainers under "<Force>"
    And I click "MY ASSESSMENTS"
    And I can see "Filters" section on My assessments page
    And the option to filter the list by "Force Areas" is Displayed
    And The option to "Include All" force areas is available with "Yes" and "No" buttons
    When I include all force areas by clicking "Yes" button
    And I click "Apply"
    Then the assessments listing are displayed without applying any force area filters to the results

    Examples:
      | Force    | Type    |
      | CHESHIRE | Approved |

  @DR_384
  Scenario Outline:  Verify the assessments listing when 'No' force areas are included
    Given I deleted the assessments from Database
    And I request assessment as "<Type>"
    And I request assessment as "<Type>" for trainers under "<Force>"
    And I click "MY ASSESSMENTS"
    And I can see "Filters" section on My assessments page
    And the option to filter the list by "Force Areas" is Displayed
    And the option to include all force areas is available with "Yes" and "No" buttons
    And I include all force areas by clicking "Yes" button
    And I click "Apply"
    When no force areas are included by clicking "No" button
    And I click "Apply"
    Then no force area filters are applied to the results
    And only default force area assessments are displayed on my assessments page

    Examples:
      | Force    | Type     |
      | CHESHIRE | Approved |







