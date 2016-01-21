#Feature: DR-305
#
#  Background:
#    Given that I am logged into the system
#    And I navigate to "ASSESSMENT MANAGEMENT" page
#
#   @Approve1
#  Scenario: Verify the visibility of Approve button
#    Then I see "Approve" button for each assessment request
#
#  @Approve2
#  Scenario: Verify Approve button on My Assessments page
#    When I click "Approve" against one of the items on the list
#    Then The request will be accepted and status of assessment request will be updated to "Booked"
#    And I see a message "has been marked Booked"
#
#  @Approve3
#  Scenario: Verify trainers visibility on request assessment page after Approving a request
#    And I click "Approve" against one of the items on the list
#    And The request will be accepted and status of assessment request will be updated to "Booked"
#    And I see a message "has been marked Booked"
#    When I navigate to "REQUEST ASSESSMENT" page
#    Then The trainers on this request will not be available for further bookings
#
#
#
