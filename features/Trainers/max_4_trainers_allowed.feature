@maximum_trainers
Feature: Maximum 4 trainers allowed per assessment request

  Background:

    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page

  @maximum1
  Scenario: Verify maximum number of 4 trainers allowed per assessment request for status Booked
    When I include one trainer from each course which include max four trainers in total
    And I click "Submit"
    And I see a message "The assessment has been Booked"
    Then I verify that all the four trainers are included in the assessment request
    And I check the status as Booked

  @maximum2
  Scenario: Verify maximum number of 4 trainers allowed per assessment request for status Requested
    When I include one trainer from each course which include max four trainers in total
    And I enter the mileage
    And I click "Submit"
    And I see a message "The assessment has been Requested"
    Then I verify that all the four trainers are included in the assessment request
    And I check the status as Requested

  @maximum3
  Scenario: Verify the validation message when more than 4 trainers are included per assessment request
    When I try to include more than 4 trainers in assessment request
    Then I see a message "You can only include a maximum of 4 trainers per assessment with a limit of 2 trainers per course and a maximum of 2 courses included ."

  @maximum4
  Scenario: Verify the validation message when more than 2 trainers are included per course
    When I try to include more than 2 trainers per course
    Then I see a message "You can only include a maximum of 4 trainers per assessment with a limit of 2 trainers per course and a maximum of 2 courses included ."

  @DR-396
  Scenario: Verify the validation when more than 2 courses are selected for an assessment
    When I try to include more than two courses per assessment
    Then I see a message "You can only include a maximum of 4 trainers per assessment with a limit of 2 trainers per course and a maximum of 2 courses included ."

  @DR-396
  Scenario: Assessment with 2 courses and 2 trainers within each course
    When I try to include two courses and two trainers within each course
    And I click "Submit"
    And I see a message "The assessment has been Booked"






