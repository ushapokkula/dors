@pass
@submit_assessment_request

Feature: submit assessment request feature
  As an assessor,
  I want to be able to view a summary of my assessment request with all details before I submit it,
  so that I can ensure all details are correct.

  @assessor_trainer_details
  Scenario: Verifying the Assessor and Trainer Details on Assessment Request Summary page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    Then The system will load Assessment Request Summary page with following Assessor details
    And The page will display with the following Trainer Details
      | Trainer Details |
      | Trainer(s)      |
      | Trainer ID      |
      | Expiry Date     |
      | Date            |
      | Time            |
      | Venue           |
      | Scheme          |
      | Phone           |

  @include_trainer
  Scenario: Verify the Include checkbox functionality
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    Then I see that the primary trainer is included by default
    And I will be able to Include or Exclude other trainer
    When I check "Include this trainer" for second trainer
    Then The system will include the selected trainer in the booking request
    And I uncheck "Include this trainer" for second trainer
    Then The system will not include the secondary trainer in the booking request

  @notes_mileage @pass
  Scenario: Mileage and Notes field validations
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    And The mileage field will only take numbers
    And The notes field will take free text upto 1000 characters
    When I enter characters in the mileage field apart from numbers
    And more than 1000 characters in notes field
    Then I should not be able to enter Invalid or morethan 1000 characters in mileage and notes field respectively

  @submit_request_status
  Scenario: Verify the Submit request and its status in database
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    And I fill Optional mileage and Notes fields
    When I click "Submit"
    Then The assessment request will be submitted and saved in the database
    And An assessment ID will be generated in the format 100xxx
    And The status of the assessment request will be marked as Requested

  @assessment_status_message
  Scenario: Verify the Assessment request status message
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    And I fill Optional mileage and Notes fields
    When I click "Submit"
    And I will be re-directed to "Request Assessment" page
    Then I see a message displaying that the assessment has been requested with assessment Id and date

  @cancel
  Scenario: Verify the Cancel functionality on Request Assessment Summary page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    When I click Cancel on this page without entering any data into mileage and notes field
    And I will be redirected back to the Pick a Slot page
    When I enter data into mileage and notes field
    And I click "Cancel"
    Then I will be redirected back to the Pick a Slot page

  @DR-927 @replace_licence_code_trainerid
  Scenario: licence code is replaced by trainer id
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    Then I see that the primary trainer is included by default
    And I see that licence code is replaced by "Trainer ID" on summary page

  @DR-927  @primary_trainer_chcekbox_ticked
  Scenario: Verify the primary trainer checkbox is ticked and disbaled on summary page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page
    Then the primary trainer will be shown with "Include this trainer" checkbox on summary page
    And the primary trainer by default it will be checked and disabled

  @DR-927 @show_assessment_id_under_main_trainer
  Scenario: Verify the display of assessment id against the trainer when the trainer is in request assessment
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I navigate to "REQUEST ASSESSMENT" page
    When I click 'Pick a slot' on Request Assessment Page against a Trainer i want to assess
    Then I will be taken to "Pick a Course" page
    And I click Request assessment button against trainer I want to book an assessment
    And the primary trainer will be shown with "Include this trainer" checkbox on summary page
    And the primary trainer by default it will be checked and disabled
    And I click "Submit"
    And I see the success message for requested assessment with date and assessment ID
    When I Pick a slot against the trainer which has same scheme as the trainer who is in requested assessment
    Then the assessment id is displayed under main trainer details against the trainer who is already in assessment

  @DR-927 @show_assessment_id_under_nearby_trainers
  Scenario: Verify the display of assessment id against the trainer when the trainer is in request assessment1
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I navigate to "REQUEST ASSESSMENT" page
    When I click 'Pick a slot' on Request Assessment Page against a Trainer i want to assess
    Then I will be taken to "Pick a Course" page
    And I click Request assessment button against trainer I want to book an assessment
    And the primary trainer will be shown with "Include this trainer" checkbox on summary page
    And the primary trainer by default it will be checked and disabled
    And I include trainer in near by course
    And I click "Submit"
    And I see the success message for requested assessment with date and assessment ID
    When I Pick a slot against the trainer which has same scheme as the trainer who is in booked assessment
    Then the assessment id is displayed under nearby trainer details against the trainer who is already in assessment

  @DR-927 @hide_course
    Scenario: Hide courses on summary page when all the trainers in the course are in assessment
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I deleted the assessments from Database
    And I navigate to "REQUEST ASSESSMENT" page
    When I click 'Pick a slot' on Request Assessment Page against a Trainer i want to assess
    Then I will be taken to "Pick a Course" page
    And I click Request assessment button against trainer I want to book an assessment
    And the primary trainer will be shown with "Include this trainer" checkbox on summary page
    And the primary trainer by default it will be checked and disabled
    And I click "Submit"
    And I see the success message for requested assessment with date and assessment ID
    And I Pick first slot
    And I click Request assessment button against trainer I want to book an assessment
    And I include all the trainers from "Speed Control" scheme as the trainer who is in assessment
    And I click "Submit"
    When I Pick first slot
    And I click Request assessment button against trainer I want to book an assessment
    Then the "Speed Control" scheme courses are hidden as all the trainers from that scheme are in assessment

   @DR_1136
   Scenario: Request Assessment Summary Page Shows Licence Types and Expiry date for diff trainers
     Given that I have licence.ndors.org.uk page opened
     When I login as an "Assessor"
     And I deleted the assessments from Database
     Then I navigate to "REQUEST ASSESSMENT" page
     When I click 'Pick a slot' on Request Assessment Page against a Trainer i want to assess
     Then I will be taken to "Pick a Course" page
     And I click Request assessment button against trainer I want to book an assessment
     Then I can see the Scheme Name for main trainer
     And I can see the Scheme Name for nearBy trainer
     And I should see License Type for main trainer
     And I should see License Type for nearBy trainer
     And I should see Expiry Date for main trainer
     And I should see Expiry Date for nearBy trainer


     @DR_1136
     Scenario Outline: Request Assessment Summary Page Shows Practical and Theory Licence Types
       Given that I have licence.ndors.org.uk page opened
       When I login as an "Assessor"
       Then I deleted the assessments from Database
       And I navigate to "REQUEST ASSESSMENT" page
       Then I 'Pick a slot' on Request Assessment Page for "<trainer_name>"
       And I will be taken to "Pick a Course" page
       And I click Request assessment button against trainer I want to book an assessment
       Then I can see "<trainer_name>" has "<Course_name>" course on summary page
       And I can see "<trainer_name>" has "<Licence Type>" type licence on summary page
       Examples:
       |Licence Type|trainer_name          |Course_name|
       |Theory      | Heather Mcqueen_Auto |Speed Control|
       |Practical   | Chris_Auto           |National Driver Alertness Course|

















