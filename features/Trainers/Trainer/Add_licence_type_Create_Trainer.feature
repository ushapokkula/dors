@DR-1110
Feature: In order to specify whether the license I have is a Theory or Practical License


    Background:
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Compliance Manager"
      And I click "TRAINERS"

      Scenario Outline: Select a Licence Type
        When I am on create Trainers page
        Then I can see a Course Name Label
        And The Course Name dropdown will be populated with current active schemes
        And the icon shown before the Course Name in dropdown
        And the Course Type shown in the table after the Course Name in dropdown
        Examples:
         |Course Name                                                            | Course Type|
         |National Speed Awareness Course (NSAC)                                  | Theory     |
         |National Speed Awareness Course 20 (NSAC20)                             |Theory      |
        |RIDE (Rider Intervention & Developing Experience) What’s Driving Us? (WDU)|Theory       |
        |Driving For Change (D4C)                                                  |Practical    |
        |National Driver Alertness Course (NDAC)                                   |Theory       |
        |National Driver Alertness Course (NDAC)                                   |Practical    |


      Scenario:
        And I verify the theory and Practical
        And successfully added licence type shown as an added new entry
        And added scheme can't be available in the licence type dropdown
        And i can see a Legend



