@DR-42
Feature: As an NGU,
  I want to be able to create an assessment record for an assessor irrespective of date of training session,
  so that unusual scenarios and errors can be catered for.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    Then I see "BOOK ASSESSMENT" button on assessment management page
    And I click "BOOK ASSESSMENT"
    Then I will be redirected to "Book Assessment" page

    Scenario: NGU creates assessment record for an assessor
      When I 'pick a course'
      Then I will be redirected back to the Pick a course page
      And I click on "Book Assessment"
      Then I will be redirected to Book Assessment page

      Then I can select the trainer for which an assessment needs to be added (same as for an Assessor)


      Scenario:
