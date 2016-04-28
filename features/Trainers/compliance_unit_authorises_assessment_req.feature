@DR-305 @fail @pass
Feature:DR-305

  Background:
    #Given that I am logged into the system
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I have all assessments requested
    And I logout

   @Approve1 @pass
  Scenario: Verify the visibility of Approve button
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSMENT MANAGEMENT" page
    Then I see "Approve" button for each assessment request

  @Approve2 @fail @pass
  Scenario: Verify Approve button on My Assessments page
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    When I click "Approve" against one of the items on the list
    #Then The request will be accepted and status of assessment request will be updated to Booked
    And I see a message "has been marked Booked"

  @Approve3 @fail
  Scenario: Verify trainers visibility on request assessment page after Approving a request
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I click "Approve" against one of the items on the list
    And The request will be accepted and status of assessment request will be updated to Booked
    And I see a message "has been marked Booked"
    And I login as an "Assessor"
    When I navigate to "REQUEST ASSESSMENT" page
    Then The trainers on this request will not be available for further bookings





