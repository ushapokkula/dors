Feature:
  As an assessor,
  I want to be able to view trainers whose license is expiring soon,
  so that I can request and carry out assessments.

  Background:
    Given that I am logged into the system
    When I navigate to "REQUEST ASSESSMENT" page
    And I will see "Trainer licenses expiring within the next 30 days:" on the page

  @Expiry_Within_30_days
  Scenario: Displaying Trainer license details for which licenses are expiring in next 30 days
    Then I will be shown a list of trainers who have their license expiring in the next thirty calendar days
    And Trainer Name, number of days to license expiry, course name, course type and license number will be displayed in trainer listing view for each trainer
    And  the license expiring soon will be shown at top

  @Expiry_outof_30_days
  Scenario: NO Trainer License details are displayed for which licenses are expiring out of 30 days and before current date
    Then I will not be shown a list of trainers who have their license expiring out of thirty calender days

  @multiple_trainer_details
  Scenario: Trainer with multiple licenses are displayed multiple times in seperate entry
    And Trainers who have multiple licenses expiring will be shown multiple times as a separate entry

  @unique_licenses
  Scenario: Validating unique licenses to a scheme
    And I will see that the licenses are unique to the scheme

  @Pick_A_Slot1
  Scenario: Display list of courses delivering in future

    When I click 'Pick a slot' on Request Assessment Page against a Trainer i want to assess
    Then The system will display a list of courses the selected trainer is delivering in future with course, site address and secondary trainer details
    And The page will also show Primary Trainers Full Name, License Number, Scheme Name and days in which their license expires

  @Pick_A_Slot2
  Scenario: Verify the course dates are of future dates only
    When I click 'Pick a slot' on Request Assessment Page
    Then I validate the course dates delivered by trainer are of future dates only











