Feature:
  As an assessor,
  I want to be able to view a summary of my assessment request with all details before I submit it,
  so that I can ensure all details are correct.


  Background:
    Given that I am logged into the system
    And I am on Assessment Request Summary page
   Given I am on Pick a Slot Page
#    And I navigate to Pick a Course Page by clicking on PIck a slot against a trainer
#    When I click Request Assessment button against a slot i have choosen


  Scenario: Verifying the Assessor and Trainer Details on Assessment Request Summary page
    Then The system will load Assessment Request Summary page with following Assessor details
    And The page will display with the following Trainer Details
      | Trainer Details      |
      | Trainer FullName     |
      | Course Name          |
      | License Number       |
      | License Expiry Date  |
      | Course Date          |
      | Course Time          |
      | Site ID              |
      | Site Address         |
      | Site Postcode        |
      | Trainer Phone Number |



  Scenario: Verify the Include checkbox functionality
    Then I see that the primary trainer is included by default
#    And I will be able to Include or Exclude other trainer
#    When I check "Include this Trainer" for second trainer
#    Then The system will include the selected trainer in the booking request
#    And I uncheck "Include this Trainer"
#    Then The system will not include the secondary trainer in the booking request


  Scenario: Mileage and Notes field validations
    And The mileage field will only take numbers
    And The notes field will take free text upto 1000 characters
    When I enter characters apart from numbers and more than 1000 characters in notes field
    Then I should not be able to enter Invalid or morethan 1000  characters in mileage and notes field respectively


  Scenario: Verify the Submit request and its status in database
    And I fill Optional mileage and Notes fields
    When I click "Submit"
    Then The assessment request will be submitted and saved in the database
    And An assessment ID will be generated in teh format 100xxx
    And This ID will be assigned to the assessment request just created and saved in the database as its identifier
    And the status of the assessment request will be marked as Requested


  Scenario: Verify the Assessment request status message
    And I filled Optional mileage and Notes fiels
    When I click "Submit"
    And I will be redirected to Request Assessment page
    And I see a message "Your assessment request has been successfully submitted."


  Scenario: Verify the Cancel functionality on Request Assessment Summary page
    When I click Cancel on this page without entering any data into mileage and notes field
    Then I will be redirected back to the Pick a Slot page
    When I enter data into mileage and notes field
    And I click "Cancel"
    Then I will be redirected back to the Pick a Slot page







