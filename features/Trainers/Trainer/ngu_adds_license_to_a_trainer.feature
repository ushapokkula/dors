   @DR-28
   Feature: NGU Adds a license to a trainer
   As an NGU/TrainingGovernance,
   I want to be able to add a license to a trainer record manually irrespective of assessments,
   so that they can continue delivering courses.

    Background:

      Given that I have licence.ndors.org.uk page opened
      And I login as an "Compliance Manager"
      And I click "TRAINERS"

    @add_license_button_visibility
    Scenario: Verify the Add license button visibility
      When I search for "Bob" and "Thorton" in the trainer search field
      And I have trainer record loaded in editable view
      Then I see button "Add licence" available under the licenses section

    @add_license_button_notvisible
      Scenario: Add license button is not visible when maximum licenses added to a trainer
      When I search for "maximum" and "licenses" in the trainer search field
      And I have trainer record loaded in editable view
      Then The "Add licence" button  is not visible when maximum licenses are added to a trainer