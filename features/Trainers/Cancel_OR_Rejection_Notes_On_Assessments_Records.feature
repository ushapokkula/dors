@DR-333
Feature:
  As an 'Assessor' or 'NGU' User
  Verify the 'Assessment ID'
  On Summary View and Detailed View of Assessment Requests

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessment

Scenario: As an assessor I should see Cancellation Notes
  And I navigate to "MY ASSESSMENTS" page
  Then I select 'Requested' status from 'Assessment Status' dropdown
  And I cancel the 'Requested' Assessment
  Then I select 'Cancelled' status from 'Assessments Status' dropdown
  And I should see The "Cancellation Notes"

  Scenario:




