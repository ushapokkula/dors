@DR-333 @pass
Feature: Cancel OR Reject Assessment
  As an 'Assessor' can cancel an assessment which they requested but have to fill in a mandatory Cancellation Notes field.
  an 'NGU' can reject any assessment which is awaiting authorisation
  from them but have to fill in a mandatory Rejection Notes field.

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    Then I request assessment

  Scenario: As an Assessor can Cancel 'Requested' assessment but have to fill in mandatory 'Cancellation Notes' field
    And I navigate to "MY ASSESSMENTS" page
    Then I select 'Requested' status from 'Assessment Status' dropdown
    And I 'Cancel' the 'Requested' Assessment
    Then I select 'Cancelled' status from 'Assessments Status' dropdown
    And I click "View Details"
    And I should see the 'Cancellation Notes' on My Assessment details page

  Scenario: As an NGU I can Reject 'Requested' assessment but I should fill in mandatory 'Rejection Notes' field
    And I logout
    Then I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    Then I am on the Assessments Management page
    When I click 'Assessment Status' dropdown button
    Then I see 'Requested' status is in selected status
    And I click "View Details" link
    And I 'Reject' the 'Requested' Assessment
    Then I select 'Rejected' status from 'Assessments Status' dropdown
    And I click "View Details" link
    And I should see the 'Rejection Notes' on Assessment Outcome page

 Scenario: As an NGU I can Cancel any Assessment but should fill in mandatory 'Cancellation Notes' field
    And I logout
    When I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    Then I am on the Assessments Management page
   When I click 'Assessment Status' dropdown button
   Then I see 'Requested' status is in selected status
    And I click "Approve" button
   And I click "Assessment Status"
    And I select 'Approved' status from 'Assessment Status' dropdown
   And I click "View Details" link
    And I 'Cancel' the 'Approved' Assessment
    Then I select 'Cancelled' status from 'Assessments Status' dropdown
    And I click "View Details" link
    And I should see the 'Cancellation Notes' on Assessment Outcome page







