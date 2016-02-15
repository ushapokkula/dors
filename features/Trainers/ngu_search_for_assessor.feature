
  Feature: As an NGU,
    I want to be able to search for an Assessor,
    so that I can view the assessor record I am interested in.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "Assessors"

    Scenario: Verify the visibility of assessor search field
      Then I see the search field on the page to search an assessor

     Scenario: Verify the auto-predict search

