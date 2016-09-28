@DR-1110
Feature: In order to specify whether the license I have is a Theory or Practical License
         As a Trainer administrator
         I want to select a license type when adding a license to a trainer
  #2 practical
  #1 theory

  Scenario Outline: Verify Course Names and Iocns in Course Name Dropdown
        Given that I have licence.ndors.org.uk page opened
        And I login as an "Compliance Manager"
        And I click "TRAINERS"
        Then I am on create Trainers page
        And I am in Licences section
        Then I can see Legend shown with "<Icon>" Icon
        And I can see a Course Name label
        When I click on Course Name field
        And the Icon shown before the Course Name in dropdown
        Examples:
        |Icon|
        |Practical Course |
        |Theory Course |


  Scenario: Verify Active schemes under Course Dropdown
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I am in Licences section
    Then I click on Course Name field
    And The Course Name dropdown will be populated with current active schemes
#          Examples:
#         |Course Name                                                             |Course Type|
#         |National Speed Awareness Course (NSAC)                                  |Theory      |
#         |National Speed Awareness Course 20 (NSAC20)                             |Theory      |
#         |RIDE (Rider Intervention & Developing Experience)                       |            |
#         |What’s Driving Us? (WDU)                                                |Theory      |
#         |Driving For Change (D4C)                                                |Practical   |
#         |National Driver Alertness Course (NDAC)                                 |Theory      |
#         |National Driver Alertness Course (NDAC)                                 |Practical   |
#


  Scenario Outline: Verify the theory and Practical Courses
              Given that I have licence.ndors.org.uk page opened
               And I login as an "Compliance Manager"
               And I navigate to "Trainers" page
               Then I click on Course Name field
               And I select a "<Course Name>" from Course Name field
               Then I can see "<Type>" of the Course
        Examples:
        |Course Name                       |Type            |
        | Driving 4 Change                 |Practical Course|
        |What's Driving Us?                |Theory Course   |
        |National Driver Alertness Course  | Theory Course   |
        |National Driver Alertness Course  | Practical Course |




        Scenario Outline: successfully added licence type shown as an added new entry
          Given that I have licence.ndors.org.uk page opened
          And I login as an "Compliance Manager"
          And I navigate to "Trainers" page
          Then I click on Course Name field
          And I select a "<Course Name>" from Course Name field
          And I select the "<Licence status>" as 'Provisional or Conditional'
          Then the system will default the Expiry Date to 730 days from current date
          And I click "Add licence" button
          And I see 'X' button for added new licence which is not saved to database
          Then I should see added licence type with "<Course Name>", "<Licence status>", "<Expiry Date>"

          Examples:
          |Course Name|Licence status               |Expiry Date|
          |           | Provisional or Conditional  |           |
          |           |                             |           |



          Scenario Outline: added scheme can't be available in the licence type dropdown
            Given that I have licence.ndors.org.uk page opened
            And I login as an "Compliance Manager"
            And I navigate to "Trainers" page
            Then I click on Course Name field
            And I select a "<Course Name>" from Course Name field
            And I select the "<Licence status>" as 'Provisional/Conditional'
            Then the system will default the Expiry Date to 183 days from current date
            And I click "Add licence" button
            Then I click on Course Name field
            And  added Scheme no longer available in the dropdown for selection
            Examples:
            |Course Name|Licence status|


  Scenario Outline: successfully added licence type can be removed
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "Trainers" page
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    And I select the "<Licence status>" as 'Provisional/Conditional'
    And I click "Add licence" button
    Then I should see added licence type with "<Course Name>", "<Licence Status>", "<Expiry Date>"
    And I see 'X' button for added new licence which is not saved to database
    When I click X button
    Then The licence row will be deleted
    Then I should not see added licence type with "<Course Name>", "<Licence status>", "<Expiry Date>"
    Examples:
      |Course Name|Licence status|Expiry Date|
      |           |              |           |
      |           |              |           |




  Scenario Outline:  removed licence type can be visible in the Course Name list
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "Trainers" page
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    And I select the "<Licence status>" as 'Provisional/Conditional'
    And I click "Add licence"
    Then I should see added licence type with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I click remove licence button
    Then I should not see added licence type with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I click on Course Name field
    Then I should see added "<Course Name>" will be available in the Course Name List
   Examples:
     |Course Name|Licence status|Expiry Date|
     |           |              |           |
     |           |              |           |









