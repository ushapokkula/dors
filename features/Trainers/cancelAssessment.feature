@pass
@DR-15
Feature:DR-15
  Assessor Cancels an Assessment Session

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I request assessment as Booked
    And I navigate to "MY ASSESSMENTS" page
    And I click "View Details"
    And I see "Assessment Outcome" on the page

  @cancelassessment1
  Scenario: Assessor Cancels an assessment  when clicked 'Cancel Assessment' on confirmation message
    When I click "Cancel Assessment"
    Then The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see "Cancel Assessment" and "Back" buttons on the confirmation message box
    And I enter Cancellation Notes
    When I click "Cancel Assessment" button on confirmation message box
    Then I see the message "The assessment booking has been cancelled" after cancelling the assessment

  @cancelassessment2 @nologout
  Scenario: Verify Cancellation Notes as Mandatory
    And I click "Cancel Assessment"
    And The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see "Cancel Assessment" and "Back" buttons on the confirmation message box
    And I see Cancellation Notes
    When I click "Cancel Assessment" button on confirmation message box
    Then I see the message "Please provide a reason for cancelling the assessment." on the cancellation window

  @cancelassessment3
  Scenario: Availability of trainers on Request Assessment page after cancellation
    And I click "Cancel Assessment"
    And The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see "Cancel Assessment" and "Back" buttons on the confirmation message box
    And I enter Cancellation Notes
    And I click "Cancel Assessment" button on confirmation message box
    And I see the message "The assessment booking has been cancelled" after cancelling the assessment
    When I click "REQUEST ASSESSMENT"
    Then the trainer will be available for bookings for assessors

  @cancelassessment4
  Scenario: Verify the availability of Cancel Button for assessments with status Requested/Booked
    And I see "Cancel Assessment" button for assessments with status Booked or Requested

  @cancelassessment5
  Scenario: Verify the assessment cancellation  when clicked on 'Back'
    And I click "Cancel Assessment"
    And The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see "Cancel Assessment" and "Back" buttons on the confirmation message box
    When I click "Back" button on confirmation message box
    Then The confirmation message will close
    And The assessment will not be cancelled and I will remain on 'My Assessments' section

  @cancelassessment6
  Scenario: Verify the unavailability of Cancel Button for assessments with status Cancelled
    And I get the current URL
    When I click "Cancel Assessment"
    Then The confirmation message will be displayed as  "Are you sure you want to cancel this assessment?"
    And I see "Cancel Assessment" and "Back" buttons on the confirmation message box
    And I enter Cancellation Notes
    When I click "Cancel Assessment" button on confirmation message box
    And I see the message "The assessment booking has been cancelled" after cancelling the assessment
    And I see that the "Cancel Assessment" button is not available for Cancelled status






