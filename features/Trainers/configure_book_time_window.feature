@pass
@DR-31
Feature: DR-31
  As an NGU,
  I want to be able configure a time window until which the assessors can search trainers and request assessment booking,
  so that requests for too far in future can be avoided, authorisation workload on NGU can be managed and assessors be
  encouraged to assess near future expiry trainers.

  Background:

    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "ADMINISTRATION" page
    And I will be able to view the field "Assessment Window"

  @time_window1
  Scenario: Verify the assessment time window field visisbility
    And The system will be able to allow to set a time duration in number of days

  @time_window2
  Scenario: Verify the assessment time window field validation
    And The field will only take numbers as input
    And The value should be greater than zero
    When I enter a value in assessments booking window
    And I click "Save"
    Then The system will save the preferences
    And I see a message "Assessments booking time window has been successfully set"

  @time_window3
  Scenario Outline: Verify the ability to view trainer licenses expiring in selected time window
      When I set the assessment time window to  certain "<Days>"
      And I click "Save"
      And I logout
      And I login as an "Assessor"
      And I navigate to "REQUEST ASSESSMENT" page
      Then The Assessors will only be able to view trainers licenses expiring in "<Days>"time window

    Examples:
    |Days|
    |365 |
    #|120 |

  @time_window4
    Scenario Outline: Verify the ability to view trainer lilcenses expiring on summary page within time window
      When I set the assessment time window to  certain "<Days>"
      And I click "Save"
      And I login as an "Assessor"
      And I navigate to "REQUEST ASSESSMENT" page
      And I am on Pick a course page
      And I click Request assessmet button against trainer I want to book an assessment
      And I will be taken to Request Assessment Summary page
      Then I will able to view only those trainer licenses expiring in "<Days>" time window on summary page

      Examples:
      |Days|
      |365 |
      #|120 |

  @time_window5
    Scenario: Verify the field validation when characters and zero is entered in time window
      When I enter characters in the assessment time window
      Then The field will not accept the characters
      And When I enter the value as "0" in time window
      Then I see a message "Number of days must be greater than zero."








