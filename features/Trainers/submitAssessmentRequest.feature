@pass
@submit_assessment_request

Feature: submit assessment request feature
  As an assessor,
  I want to be able to view a summary of my assessment request with all details before I submit it,
  so that I can ensure all details are correct.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page

  @assessor_trainer_details
  Scenario: Verifying the Assessor and Trainer Details on Assessment Request Summary page
    Then The system will load Assessment Request Summary page with following Assessor details
    And The page will display with the following Trainer Details
      | Trainer Details |
      | Trainer(s)      |
      | License         |
      | Expiry Date     |
      | Date            |
      | Time            |
      | Venue           |
      | Scheme          |
      | Phone           |

  @include_trainer
  Scenario: Verify the Include checkbox functionality
    Then I see that the primary trainer is included by default
    And I will be able to Include or Exclude other trainer
    When I check "Include this trainer" for second trainer
    Then The system will include the selected trainer in the booking request
    And I uncheck "Include this trainer" for second trainer
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
    And The status of the assessment request will be marked as Requested

  @assessment_status_message
  Scenario: Verify the Assessment request status message
    And I fill Optional mileage and Notes fields
    When I click "Submit"
    And I will be re-directed to "Request Assessment" page
    Then I see a message displaying that the assessment has been requested with assessment Id and date

  @cancel
  Scenario: Verify the Cancel functionality on Request Assessment Summary page
    When I click Cancel on this page without entering any data into mileage and notes field
    And I will be redirected back to the Pick a Slot page
    When I enter data into mileage and notes field
    And I click "Cancel"
    Then I will be redirected back to the Pick a Slot page

  @DR-927 @replace_licence_code_trainerid
  Scenario: licence code is replaced by trainer id
    Then I see that the primary trainer is included by default
    And I see that licence code is replaced by "Trainer ID" on summary page

  @DR-927  @primary_trainer_chcekbox_ticked
    Scenario: Verify the primary trainer checkbox is ticked and disbaled on summary page
    Then the primary trainer will be shown with "Include this trainer" checkbox on summary page
    And the primary trainer by default it will be checked and disabled

  @DR-927 @show_assessment_id_under_main_trainer
    Scenario: Verify the display of assessment id against the trainer when the trainer is in request assessment
    And the primary trainer will be shown with "Include this trainer" checkbox on summary page
    And the primary trainer by default it will be checked and disabled
    And I click "Submit"
    And I see the success message for requested assessment with date and assessment ID
    When I Pick a slot against the trainer which has same scheme as the trainer who is in assessment















