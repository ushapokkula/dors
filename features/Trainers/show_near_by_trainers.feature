@DR-165
Feature: As an assessor,
  I want to be able to see a list of nearby trainers on the assessment request summary page while I am booking assessment for a trainer,
  so that I can maximise efficiency of assessment bookings.

  Background:
    Given that I am logged into the system
    And I am on Pick a course page
    When I click Request assessmet button against trainer I want to book an assessment
    Then I will be taken to Request Assessment Summary page


  Scenario: Show near by trainers with same postcode
    And I will be shown trainers delivering courses nearby with same postcode whose licenses are expirying soon
  @near_by_trainers
  Scenario: Verify the display of trainer details in near by courses
    And The following information will be shown for each of these trainers
      | Trainer Details |
      | Phone           |
      | License         |
      | Expiry Date     |
      | Date            |
      | Time            |
      | Venue           |
      | Scheme          |
    And I see Trainer Full name and site address

  Scenario: Verify the @Include this Trainer' checkbox
    When I check Inclkude this Trainer for a trainer
    Then The system will include the selected trainer in the booking request




