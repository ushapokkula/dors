@DR-1110
Feature: In order to specify whether the license I have is a Theory or Practical License
  #2 practical
  #1 theory

  Scenario: Verify Course Names and Iocns in Course Name Dropdown
        Given that I have licence.ndors.org.uk page opened
        And I login as an "Compliance Manager"
        And I click "TRAINERS"
        When I am on create Trainers page
        Then I can see a Course Name label
        And The Course Name dropdown will be populated with current active schemes
        And the Icon shown before the Course Name in dropdown


  Scenario Outline: Course Types
             Given that I have licence.ndors.org.uk page opened
              And I login as an "Compliance Manager"
              And I click "TRAINERS"
              And the Course Type shown in the table after the Course Name in dropdown
        Examples:
         |Course Name                                                             |Course Type|
         |National Speed Awareness Course (NSAC)                                  |Theory      |
         |National Speed Awareness Course 20 (NSAC20)                             |Theory      |
         |RIDE (Rider Intervention & Developing Experience)                       |            |
         |What’s Driving Us? (WDU)                                                |Theory      |
         |Driving For Change (D4C)                                                |Practical   |
         |National Driver Alertness Course (NDAC)                                 |Theory      |
         |National Driver Alertness Course (NDAC)                                 |Practical   |



      Scenario Outline: verify the theory and Practical Courses
              Given that I have licence.ndors.org.uk page opened
               And I login as an "Compliance Manager"
               And I navigate to "Trainers" page
               Then I click on Course Name field
               When I select a "<Course Name>" from Course Name field
               Then I can see "<Type>" of the Course
        Examples:
        |Course Name|Type|
        |           |    |




        Scenario Outline: successfully added licence type shown as an added new entry
          Given that I have licence.ndors.org.uk page opened
          And I login as an "Compliance Manager"
          And I navigate to "Trainers" page
          Then I click on Course Name field
          And I select a "<Course Name>" from Course Name field
          And I select the "<Licence status>" as 'Full'
          Then the system will default the Expiry Date to 730 days from current date
          And I click "Add licence"
          Then I should see added licence type with "<Course Name>", "<Licence Status>", "<Expiry Date>"

          Examples:
          |Course Name|Licence status|Expiry Date|
          |           |              |           |
          |           |              |           |



          Scenario Outline: added scheme can't be available in the licence type dropdown
            Given that I have licence.ndors.org.uk page opened
            And I login as an "Compliance Manager"
            And I navigate to "Trainers" page
            Then I click on Course Name field
            And I select a "<Course Name>" from Course Name field
            And I select the "<Licence status>" as 'Provisional/Conditional'
            Then the system will default the Expiry Date to 183 days from current date
            And I click "Add licence"
            Then I click on Course Name field
            Then I can't see a selected Course Name in Course Name field
            Examples:
            |Course Name|Licence status|


  Scenario Outline: successfully added licence type can be removed
    Examples:

  Scenario Outline:  removed licence type can be visible in the Course Name list
   Examples:




        And i can see a Legend

        Scenario: Select a Licence Type



