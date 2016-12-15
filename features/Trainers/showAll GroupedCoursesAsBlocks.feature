@pass
@DR-240
Feature:DR-240
  Show all courses grouped under each assessment on My Asseessments page

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I request assessment as Booked

  @assessment_block
  Scenario: Verify each assessment is displayed as Blocks
    And I navigate to "MY ASSESSMENTS" page
    Then I will be shown list of all assessments i requested as seperate blocks

  @course_block
  Scenario: Verify that multiple courses are displayed as blocks under each assessment
    And I navigate to "MY ASSESSMENTS" page
    And I will be shown list of all assessments i requested as seperate blocks
    Then multiple courses under each assessment are displayed as blocks

  @display_trainers
  Scenario: Verify the display of trainers per course
    And I navigate to "MY ASSESSMENTS" page
    And I will be shown list of all assessments i requested as seperate blocks
    And multiple courses under each assessment are displayed as blocks
    Then One or two trainers are displayed under each course



