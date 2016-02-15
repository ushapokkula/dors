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
    When I start typing atleast 3 characters as an assessor name in the search field
    Then The system will start autopredicting it

    Scenario: Verify the format to dis
    And Displays the first name, last name, and assessor number on the the predicted drop downlist

  Scenario: Verify the validation message when no record does'nt match the search criteria
    When The search criteria does'nt match any record on the database
    Then I see a message "No Assessor with this name exists"

