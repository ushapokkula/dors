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
      | Course1      | Course2 | Course3                          |
      | Berks-Scheme | RiDE    | National Driver Alertness Course |


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
      | Course1      | Course2 | Course3                          | Trainer_ID |
      | Berks-Scheme | RiDE    | National Driver Alertness Course | 111555     |

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
      | Course1      | Course2 | Course3                          | Force1   | Force2              |
      | Berks-Scheme | RiDE    | National Driver Alertness Course | CHESHIRE | BEDFORDSHIRE POLICE |

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















