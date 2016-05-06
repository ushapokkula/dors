@DR-261
Feature:
   As an Assessor or NGU User
   Verify the Assessment ID
  on Summary and Detailed View of Assessment Requests

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    When I navigate to "REQUEST ASSESSMENT" page

  Scenario: The summary view of assessment requests on My Assessments page should show the Assessment ID.
    Then I request assessments
     And I navigate to "MY ASSESSMENTS" page
     And I should see the requested assessments
