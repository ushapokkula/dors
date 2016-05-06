@DR-261
Feature:
   As an Assessor or NGU User
   Verify the Assessment ID
     on Summary and Detailed View of Assessment Requests

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I click on "REQUEST ASSESSMENT" page
    Then default view of the request assessments page is loaded
    And I request assessments

   Scenario: The summary view of assessment requests on My Assessments page should show the Assessment ID.
    And I navigate to "MY ASSESSMENTS" page
    When I select "Requested" status from Assessment Status dropdown
    And I see requested assessments on My Assessments page
    Then I should see the "Assessment ID" on summary view of request assessments


   Scenario: The detailed view of an assessment request should show Assessment ID.
    And I navigate to "MY ASSESSMENTS" page
    When I select "Requested" status from Assessment Status dropdown
    And I click on "View Details" button on My assessments page
    #Then I should see "My assessment details" page
    And I should see "Assessment ID" on detailed view of request assessment

    Scenario: The summary view of assessment requests on Manage Assessments page should show the Assessment ID.
     Then I login as an "Compliance Manager"
      And I click "ASSESSMENT MANAGEMENT"
      Then I will see list of all Assessments Requests with status requested
      And I should see "Assessment ID" on summary view of assessment requests on Manage Assessments page

     Scenario: The detailed view of an assessment request should show Assessment ID.
      Then I login as an "Compliance Manager"
      And I click "ASSESSMENT MANAGEMENT"
      Then I will see list of all Assessments Requests with status requested
      And I click on "View Details" button on Assessment management page
      Then I should see "Assessment ID" on detailed view of an assessment request
