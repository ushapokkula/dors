@DR-261 @DR-827 @DR-645 @pass
Feature: Show Assessment ID
   As an 'Assessor' or 'NGU' User
   Verify the 'Assessment ID'
     On Summary View and Detailed View of Assessment Requests

  Background:
    Given that I have licence.ndors.org.uk page opened
       When I login as an "Assessor3"
       And I navigate to "REQUEST ASSESSMENT" page
       Then I request assessment

  Scenario: The summary view of assessment requests on My Assessments page should show the Assessment ID.
    And I navigate to "MY ASSESSMENTS" page
    Then I select 'Requested' status from 'Assessment Status' dropdown
    And I see "Requested" assessments on 'My Assessments' page
    Then I should see the "Assessment ID" on summary view of assessment on 'My assessment' page

  Scenario: The detailed view of an assessment request should show Assessment ID.
    And I navigate to "MY ASSESSMENTS" page
    Then I select 'Requested' status from 'Assessment Status' dropdown
    And I click on "View Details" button on 'My assessments' page
    And I should see "Assessment ID" on detailed view of assessment request

  Scenario: The summary view of assessment requests on Manage Assessments page should show the Assessment ID.
    And I logout
    Then I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    Then I should see "Assessment ID" on summary view of assessment on 'Manage Assessments' page

  Scenario: The detailed view of an assessment request should show Assessment ID.
    And I logout
    Then I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I click on "View Details" button on 'Assessment management' page
    Then I should see "Assessment ID" on detailed view of an assessment request

