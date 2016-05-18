@submit_assessment_request @fail
Feature: submit assessment request feature
  As an assessor,
  I want to be able to view a summary of my assessment request with all details before I submit it,
  so that I can ensure all details are correct.


  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page

  @assessor_trainer_details @fsil
  Scenario: Verifying the Assessor and Trainer Details on Assessment Request Summary page
    Then The system will load Assessment Request Summary page with following Assessor details
    And The page will display with the following Trainer Details
      | Trainer Details  |
      | Trainer FullName |
      | Course Name      |
      | License          |
      | Expiry Date      |
      | Course Date      |
      | Course Time      |
      | Site ID          |
      | Site Address     |
      | Site Postcode    |
      | Phone            |

  @include_trainer  @fail
  Scenario: Verify the Include checkbox functionality
    Then I see that the primary trainer is included by default
    And I will be able to Include or Exclude other trainer
    When I check "Include this Trainer" for second trainer
    Then The system will include the selected trainer in the booking request
    And I uncheck "Include this Trainer"
    Then The system will not include the secondary trainer in the booking request

  @notes_mileage @pass
  Scenario: Mileage and Notes field validations
    And The mileage field will only take numbers
    And The notes field will take free text upto 1000 characters
    When I enter characters in the mileage field apart from numbers
    And more than 1000 characters in notes field
    Then I should not be able to enter Invalid or morethan 1000 characters in mileage and notes field respectively

  @submit_request_status
  Scenario: Verify the Submit request and its status in database
    And I fill Optional mileage and Notes fields
    When I click "Submit"
    Then The assessment request will be submitted and saved in the database
    And An assessment ID will be generated in the format 100xxx
    #And This ID will be assigned to the assessment request just created and saved in the database as its identifier
    And The status of the assessment request will be marked as Requested

  @assessment_status_message
  Scenario: Verify the Assessment request status message
    And I fill Optional mileage and Notes fields
    When I click "Submit"
    And I will be redirected to Request Assessment page
    And I see the success message "Your assessment request has been successfully submitted." on the page

  @cancel
  Scenario: Verify the Cancel functionality on Request Assessment Summary page
    When I click Cancel on this page without entering any data into mileage and notes field
    And I will be redirected back to the Pick a Slot page
    When I enter data into mileage and notes field
    And I click "Cancel"
    Then I will be redirected back to the Pick a Slot page







