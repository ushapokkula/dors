@DR-116 @pass
Feature: Filter Trainers by course on Request assessment page


  @course_filter_visibility
  Scenario: Verify the visibility of course filter and no courses selected on Request assessment page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    When I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    And no course filters are selected
    And no course filters are applied

  @apply_one_course
  Scenario Outline: Verify the results after applying single course from the filter without other filters
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    And no course filters are applied
    When I select one "<Course>" from the dropdown
    Then the results are displayed showing only those trainers who fall under the selected course "<Course>"

    Examples:
      | Course       |
      | Berks-Scheme |

  @apply_multiple_course
  Scenario Outline: Verify the results after applying multiple courses from the filter without other filters
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    And no course filters are applied
    When I select  multiple courses "<Course1>", "<Course2>","<Course3>" from the dropdown
    And no other filters are applied
    Then the results are displayed showing only those trainers who fall under the selected course "<Course1>", "<Course2>","<Course3>"

    Examples:
      | Course1      | Course2 | Course3       |
      | Berks-Scheme | RiDE    | Speed Control |


  @apply_course_and_trainer_filter
  Scenario Outline: Verify the results after applying course and trainer filter
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    When I select  multiple courses "<Course1>", "<Course2>","<Course3>" from the dropdown
    And also apply trainer filter for trainer id "<Trainer_ID>"
    Then the results are displayed based on filters applied for courses "<Course1>", "<Course2>" and trainer "<Trainer_ID>"


    Examples:
      | Course1      | Course2 | Course3       | Trainer_ID |
      | Berks-Scheme | RiDE    | Speed Control | 111555     |

  @apply_course_and_force_filter
  Scenario Outline: Verify the results after applying course and force filter
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    When I select  multiple courses "<Course1>", "<Course2>","<Course3>" from the dropdown
    And also apply force filter for force "<Force1>" and "<Force2>"
    Then the results are displayed based on filters applied for courses "<Course1>", "<Course2>","<Course3>" and forces "<Force1>","<Force2>"

    Examples:
      | Course1      | Course2 | Course3       | Force1   | Force2              |
      | Berks-Scheme | RiDE    | Speed Control | CHESHIRE | BEDFORDSHIRE POLICE |


  @apply_all_3_filters
  Scenario Outline: Verify the results after applying all three filters
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    When I select one "<Course>" from the dropdown
    And also apply force filter for force "<Force1>" and "<Force2>"
    And also apply trainer filter for trainer id "<Trainer_ID>"
    Then the results are displayed based on filters applied for course "<Course>" ,forces "<Force1>","<Force2>" and trainer "<Trainer_ID>"

    Examples:
      | Course       | Force1   | Force2              | Trainer_ID |
      | Berks-Scheme | CHESHIRE | BEDFORDSHIRE POLICE | 989898     |

  @reset
  Scenario Outline: Verify the reset button when all the filters are applied
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    When I select one "<Course>" from the dropdown
    And also apply force filter for force "<Force1>" and "<Force2>"
    And also apply trainer filter for trainer id "<Trainer_ID>"
    Then the results are displayed based on filters applied for course "<Course>" ,forces "<Force1>","<Force2>" and trainer "<Trainer_ID>"
    When I click "Reset"
    Then all the filters should be cleared

    Examples:
      | Course       | Force1   | Force2              | Trainer_ID |
      | Berks-Scheme | CHESHIRE | BEDFORDSHIRE POLICE | 989898     |


  @Verify_message_with_trainer_filter
  Scenario Outline: Verify the message after applying course which doesn't have any data related to the course
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    And no course filters are applied
    When I select one "<Course>" from the dropdown
    Then I see message "No assessments available to book" on request assessment page

    Examples:
      | Course    |
      | New Trend |


  @verify_message_on_combination_filter
  Scenario Outline: Verify the message after applying combination of all filters which doesn't have any data related
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    And the option to filter the list by courses is displayed
    When I select one "<Course>" from the dropdown
    And also apply force filter for force "<Force1>" and "<Force2>"
    And also apply trainer filter for trainer id "<Trainer_ID>"
    Then I see message "No assessments available to book" on request assessment page

    Examples:
      | Course       | Force1   | Force2              | Trainer_ID |
      | Berks-Scheme | CHESHIRE | BEDFORDSHIRE POLICE | 654321     |


  @DR-1204 @Verify_legends
  Scenario: Verify the legends dor filter by course filter
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    When I click "REQUEST ASSESSMENT"
    And the option to filter the list by courses is displayed
    Then I can see icons for practical and theory course are visible
    And also labels "Practical Course" and "Theory Course" for practical and theory icons


  @DR-1204 @verify_icons_scheme_names
  Scenario Outline: Verify the visibility of icons against scheme names
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    And the option to filter the list by courses is displayed
    And I can see icons for practical and theory course are visible
    And also labels "Practical Course" and "Theory Course" for practical and theory icons
    When I select "<Course Name>" from course filter of "<Course Type>"
    Then I can verify selected "<Course Name>" type is "<Course Type>"

    Examples:
      | Course Name                      | Course Type      |
      | Driving For Change               | Practical Course |
      | What's Driving Us?               | Theory Course    |
      | National Driver Alertness Course | Theory Course    |
      | National Driver Alertness Course | Practical Course |
      | Speed Awareness                  | Theory Course    |
      | National Speed Awareness         | Theory Course    |
      | RiDE                             | Theory Course    |
      | Motorway Course                  | Theory Course    |

  @DR_1204
  Scenario Outline: Verify the trainers listing when respective course types are selected
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    And the option to filter the list by courses is displayed
    And I can see icons for practical and theory course are visible
    And also labels "Practical Course" and "Theory Course" for practical and theory icons
    When I select "<Course Name>" from course filter of "<Course Type>"
    Then the results are displayed showing only those trainers who fall under the selected course "<Course Name>"
    And the licences are of type "<Course Type>"

    Examples:
      | Course Name                      | Course Type |
      | National Driver Alertness Course | Theory      |
      | National Driver Alertness Course | Practical   |

  @DR_1204
  Scenario Outline: Verify the trainers listing when respective course types are selected along with force filter
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    When I select  multiple courses "<Course1>", "<Course2>" from the dropdown
    And I select "<Course3>" from course filter of "<Course Type>"
    And also apply force filter for force "<Force1>" and "<Force2>"
    Then the results are displayed based on filters applied for courses "<Course1>", "<Course2>","<Course3>" and forces "<Force1>","<Force2>"
    And "<Course3>" will be displayed of "<Course Type>" part of trainer licence

    Examples:
      | Course1      | Course2 | Course3                          | Course Type | Force1   | Force2              |
      | Berks-Scheme | RiDE    | National Driver Alertness Course | Theory      | CHESHIRE | BEDFORDSHIRE POLICE |
      | Berks-Scheme | RiDE    | National Driver Alertness Course | Practical   | CHESHIRE | BEDFORDSHIRE POLICE |


  @DR_1204
  Scenario Outline: Verify the trainers listing when respective course types are selected along with trainer filter
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I click "REQUEST ASSESSMENT"
    Then the option to filter the list by courses is displayed
    When I select  multiple courses "<Course1>", "<Course2>" from the dropdown
    And I select "<Course3>" from course filter of "<Course Type>"
    And also apply trainer filter for trainer id "<Trainer_ID>"
    Then the results are displayed based on filters applied for courses "<Course1>", "<Course2>", "<Course3>" of "<Course Type>" for  trainer "<Trainer_ID>"

    Examples:
      | Course1      | Course2 | Course3                          | Course Type | Trainer_ID |
      | Berks-Scheme | RiDE    | National Driver Alertness Course | Theory      | 111222     |
      | Berks-Scheme | RiDE    | National Driver Alertness Course | Practical   | 111999     |


















