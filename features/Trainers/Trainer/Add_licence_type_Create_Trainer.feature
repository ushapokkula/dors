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



