@DR-28
Feature: NGU Adds a license to a trainer
  As an NGU/TrainingGovernance,
  I want to be able to add a license to a trainer record manually irrespective of assessments,
  so that they can continue delivering courses.

  Background:

    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"

  @add_license_button_visibility
  Scenario: Verify the Add license button visibility
    When I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    Then I see button "Add licence" available under the licenses section

  @add_license_button_notvisible
  Scenario: Add license button is not visible when maximum licenses added to a trainer
    When I search for "maximum" and "licenses" in the trainer search field
    And I have trainer record loaded in editable view
    Then The "Add licence" button  is not visible when maximum licenses are added to a trainer

  @add_new_license
  Scenario: Add new license to a trainer
    And I search for "bhavani" and "m" in the trainer search field
    And I have trainer record loaded in editable view
    And I see button "Add licence" available under the licenses section
    And I select course name, licence status and expiry date to add a new licence
    When I click "Add licence" button
    Then The system will add another row of licence entry below those already displayed
    And "Licence status" and "Expiry Date" fields are editable for added licenses
    And I see the following default Licence status in Licence status dropdown
      | Licence Status          |
      | ---Please select---     |
      | Provisional/Conditional |
      | Full                    |
      | Expired                 |
      | Suspended               |
      | Revoked                 |
      | Surrendered             |
    And Expiry Date will have a date picker calender
    When I enter past date in Expiry Date
    Then The user should get an error as "Sorry, the expiry date cannot be in the past." below "Expiry Date"

  @verify_default_days_license_Status
  Scenario Outline: verify the default no:of days when licence status is selected
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    And I select "<Course Name>" to add a licence
    When I select "<Licence Status>" to add a licence
    Then The Expiry Date will be defaulted to "<Days>"

    Examples:
      | Course Name     | Licence Status | Days |
      | Motorway Course | Full           | 730  |
      | Motorway Course | Provisional    | 183  |


  @removing_licences
  Scenario: verify the default no:of days when licence status is selected
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    And I select course name, licence status and expiry date to add a new licence
    When I click "Add licence" button
    And I see 'X' button for added new licence which is not saved to dataabase
    When I click X button
    Then The licence row will be deleted
    And Changes will be reflected on page
    And The X button will not be available for licences persisted in the DB

  @license_validation_fails
  Scenario Outline: Verify the validation message when the license fields are blank
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    When I click "<field_name>" without setting the data
    And I click "Update Trainer"
    Then I see "<validation_error_message>" against each "<field_name>"

  Examples:
  |field_name|validation_error_message|
  |Course name|Please select a course name.|
  |Licence status|Please select a license status.|
  |Expiry Date|Please select an expiry date.|

  @verify_duplicate_courses
  Scenario Outline: Verify adding duplicate courses to licences
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    And I select "<Course Name>" to add a licence
    When I select "<Licence Status>" to add a licence
    And I click "Add licence" button
    And The system will add another row of licence entry below those already displayed
    Then The "<Course Name>" is not available in the Course dropdown

  Examples:
  | Course Name     | Licence Status | Days |
  | Motorway Course | Full           | 730  |















