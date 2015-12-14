Feature:@DR-252
  Load Editable Assessment Form For Marking Outcome

  Background:
    Given that I am logged into the system
    And I have received assessment form from the Assessor with details of their assessment results
    And I type the Booked Assessment ID in the Assessment search field
    When I click "Search"
    Then The system will load the detailed information for assessment record in view mode

  @markoutcome1
  Scenario: NGU Marks outcome for a booked assessment
    And I will be shown editable mode to mark outcomes against each trainer


  Scenario: Verify the ability to mark outcomes against each trainer
    And I will be able to mark outcomes as below for each trainer:
      | Outcomes `       |
      | Absent          |
      | Action Note     |
      | Cancelled       |
      | Competent       |
      | Compliance Note |

  Scenario: Verify the optional field Compliance Notes against each trainer
    And I will be to view "Compliance Notes" against each trainer


  Scenario: Verify the ability to display of Mark Complete button
    When I select possible outcome against each trainer
    Then The button Mark Complete will be activated and displayed


