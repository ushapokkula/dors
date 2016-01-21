Feature:DR-15
  Assessor Cancels an Assessment Session

  Background:
    Given that I am logged into the system
    And I have assessments with Booked status
    And I navigate to "MY ASSESSMENTS" page
    And I click "View Details"
    And I see "My assessment details" on the page


  @cancelassessment1
  Scenario: Assessor Cancels an assessment  when clicked 'Yes' on confirmation message
    When I click "Cancel Request"
    Then The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see 'Yes' and 'No' buttons on the confirmation message box
    And I enter Cancellation Notes
    When I click "Yes"
    And I see a message "The assessment booking has been cancelled"

  @cancelassessment2
  Scenario: Verify Cancellation Notes as Mandatory
    And I click "Cancel Request"
    And The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see 'Yes' and 'No' buttons on the confirmation message box
    And I see Cancellation Notes
    When I click "Yes"
    Then I see a message "Please provide a reason for cancelling the assessment."

  @cancelassessment3
  Scenario: Availability of trainers on Request Assessment page after cancellation
    When I click "Cancel Request"
    Then The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see 'Yes' and 'No' buttons on the confirmation message box
    And I enter Cancellation Notes
    When I click "Yes"
    And I see a message "The assessment booking has been cancelled"
    When I click "REQUEST ASSESSMENT"
    Then the trainer will be available for bookings for assessors

  @cancelassessment4
  Scenario: Verify the availability of Cancel Button for assessments with status Requested/Booked
    And I see "Cancel Request" button for assessments with status Booked or Requested

  @cancelassessment5
  Scenario: Verify the assessment cancellation  when clicked on 'NO'
    When I click "Cancel Request"
    Then The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see 'Yes' and 'No' buttons on the confirmation message box
    When I click "No"
    Then The confirmation message will close
    And The assessment will not be cancelled and I will remain on 'My Assessments' section

  @cancelassessment6
  Scenario: Verify the unavailability of Cancel Button for assessments with status Cancelled
    And I get the current URL
    When I click "Cancel Request"
    Then The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see 'Yes' and 'No' buttons on the confirmation message box
    And I enter Cancellation Notes
    When I click "Yes"
    And I see a message "The assessment booking has been cancelled"
    And I see that the "Cancel Request" button is not available for Cancelled status






