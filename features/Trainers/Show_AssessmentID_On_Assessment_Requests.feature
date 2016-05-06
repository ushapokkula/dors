@DR-261
Feature:
   As an 'Assessor' or 'NGU' User
   Verify the 'Assessment ID'
     On Summary View and Detailed View of Assessment Requests

  Background:
    Given that I have licence.ndors.org.uk page opened
       And I login as an "Assessor3"
       And I click on "REQUEST ASSESSMENT"
       Then default view of the request assessments page is loaded
       And I request assessment

  Scenario: The summary view of assessment requests on My Assessments page should show the Assessment ID.
    And I click "MY ASSESSMENTS" link
    When I select 'Requested' status from 'Assessment Status' dropdown
    And I see 'Requested' assessments on 'My Assessments' page
    Then I should see the "Assessment ID" on summary view of assessment requests on 'My assessment' page

  Scenario: The detailed view of an assessment request should show Assessment ID.
    And I navigate to "MY ASSESSMENTS" page
    When I select 'Requested' status from 'Assessment Status' dropdown
    And I click on "View Details" button on 'My assessments' page
    Then I should see "My assessment details" page
    And I should see "Assessment ID" on detailed view of assessment request

  Scenario: The summary view of assessment requests on Manage Assessments page should show the Assessment ID.
    Then I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT"
    And I should see "Assessment ID" on summary view of assessment requests on 'Manage Assessments' page

  Scenario: The detailed view of an assessment request should show Assessment ID.
    Then I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT" link
    And I click on "View Details" button on 'Assessment management' page
    Then I should see "Assessment ID" on detailed view of an assessment request
