@DR-113 @pass
#Note: due to this feature assessment widow keep changing
Feature: DR-113 and DR-118
  As an assessor,
  I want to be able to view trainers whose license is expiring soon,
  so that I can request and carry out assessments.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "ADMINISTRATION"
    When I configure the assessment time window to "365" days
    And I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page

  @DR-373
  Scenario: Verify the message on request assessment page when no trainer is available
    And I will be shown a list of trainers who have their license expiring within time window of "365" days
    And I set the time window to "2" days
    And I login as an "Assessor"
    When I navigate to "REQUEST ASSESSMENT" page
    Then I see a message "No assessments available to book."


  @Expiry_Within_365_days
  Scenario: Displaying Trainer license details for which licenses are expiring in configured time window
    Then I will be shown a list of trainers who have their license expiring within time window of "365" days
    And Trainer Name,license number, Expiry Date, Scheme name, course type will be displayed in trainer listing view for each trainer
    And the license expiring soon will be shown at top

  @Expiry_outof_365_days
  Scenario: NO Trainer License details are displayed for which licenses are expiring out of configured time window and before current date
    Then I will not be shown a list of trainers who have their license expiring outside of configured time window
    And I will not be shown a list of trainers for previous dates already expired

  @multiple_trainer_details
  Scenario: Trainer with multiple licenses are displayed multiple times in seperate entry
    And Trainers who have multiple licenses expiring will be shown multiple times as a separate entry

  @unique_licenses
  Scenario: Validating unique licenses to a scheme
    And I will see that the licenses are unique to the scheme

  @verify_date_format
    Scenario: Verify the Expiry Date format in dd-mmm-yyyy
     Then I see the Expiry Date is in dd-Mmm-YYYY format

  @Pick_A_Slot1
  Scenario: Display list of courses delivering in future
    When I click 'Pick a slot' on Request Assessment Page against a Trainer i want to assess
    Then The system will display a list of courses the selected trainer is delivering in future
    And The system will display the following details on Pick slot page
    |Display_Items        |
    |Venue                |
    |Date & Time          |
    |License Expiry date:  |
    |Trainer              |
    |License              |
    |Scheme               |
    And The page will also show primary trainers Full Name,secondary trainer fullname

  @Pick_A_Slot2
  Scenario: Verify the course dates are of future dates only
    When I click 'Pick a slot' on Request Assessment Page
    Then I validate the course dates delivered by trainer are of future dates only
















