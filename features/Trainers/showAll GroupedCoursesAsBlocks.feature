
Feature:DR-240
  Show all courses grouped under each assessment on My Asseessments page

  Background:
    Given that I am logged into the system
    And I navigate to "MY ASSESSMENTS" page

  @assessment_block
  Scenario: Verify each assessment is displayed as Blocks
    Then I will be shown list of all assessments i requested as seperate blocks

  @course_block
  Scenario: Verify that multiple courses are displayed as blocks under each assessment
    And I will be shown list of all assessments i requested as seperate blocks
    Then multiple courses under each assessment are displayed as blocks

  Scenario: Verify the display of trainers per course
    And I will be shown list of all assessments i requested as seperate blocks
    And multiple courses under each assessment are displayed as blocks
    Then One or two trainers are displayed under each course



