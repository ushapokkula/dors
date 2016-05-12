Feature: DR-257

  @my_assessment_link
  Scenario: Verify the visibility of My Assessments Link before Request Assessments on header navbar

    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    Then I verify that the My Assessments link is before Request Assessment in the navbar




