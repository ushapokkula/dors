@DR-28
  Feature: NGU Adds a license to a trainer
    As an NGU/TrainingGovernance,
    I want to be able to add a license to a trainer record manually irrespective of assessments,
    so that they can continue delivering courses.

  Background:
    Given that I have licence.ndors.org.uk page opened

    Scenario: Verify the Add license button visibility
      Given I login as an "Compliance Manager"
      And I click "Trainers"
      And I search for "Bob" and "Thorton" in the trainer search field
      And I see the
