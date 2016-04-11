@DR-253
Feature: DR-253
  Fill Assessment Form and Fill their details

  Background:
    #Given that I am logged into the system
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I have received assessment form from the Assessor with details of their assessment results
    And I type the Booked Assessment ID in the Assessment search field
    When I click "Search"
    And The system will load the detailed information for assessment record in view mode

  @assessmentform1
  Scenario: Validating the message when clicked on 'Mark Complete button
    And I select possible outcome against each trainer
    And The button Mark Complete will be activated and displayed
    When I click "Mark Complete"
    Then The status of the assessment will be updated to Completed
    And I will be re-directed to "ASSESSMENT MANAGEMENT"
    And I see a message "has been successfully marked completed"

  @assessmentform2
  Scenario Outline:Verify the license status when the outcome of the trainer is Absent/Cancelled
    When I select "<Outcomes>" as outcome
    When I click "Mark Complete"
    Then the license of the trainer will not be changed
    And I login as an "Assessor"
    And The trainer will be available for bookings on Request Assessment page

    Examples:
    |Outcomes|
    |Absent  |
    |Cancelled|

#  @assessmentform3
#  Scenario:Verify the license status when the outcome of the trainer is Compliannce Note
#    When I select "Compliance Note" as outcome
#    When I click "Mark Complete"
#    Then the license of the trainer will be renewed for 180 days from the date of assessment
#    And The status of the license will be updated to Provisional
#    And The trainer will be available for bookings on Request Assessment page
#
#  @assessmentform4
#  Scenario Outline:Verify the license status when the outcome of the trainer is Action note/Competent
#    When I select "<Outcomes>" as outcome
#    Then the license of the trainer will be renewed for two years from the date of assessment
#    And The status of the license will be updated to Full valid
#    And The trainer will be available for bookings on Request Assessment page
#
#    Examples:
#    |Outcomes|
#    |Action Note|
#    |Competent|

