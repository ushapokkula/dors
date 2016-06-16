@pass
@DR-305
Feature:DR-305

  Background:

    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I have all assessments requested
    And I logout

   @Approve1
  Scenario: Verify the visibility of Approve button
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSMENT MANAGEMENT" page
    Then I see "Approve" button for each assessment request

  @Approve2
  Scenario: Verify Approve button on My Assessments page
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    When I click "Approve" against one of the items on the list
    And I see a message "has been marked Booked"
    Then The request will be accepted and status of assessment request will be updated to Booked

  @Approve3
  Scenario: Verify trainers visibility on request assessment page after Approving a request
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I click "Approve" against one of the items on the list
    And I see a message displaying that the assessment has been booked with assessment Id and date
    And The request will be accepted and status of assessment request will be updated to Booked
    And I logout
    And I login as an "Assessor"
    When I navigate to "REQUEST ASSESSMENT" page
    Then The trainers on this request will not be available for further bookings





