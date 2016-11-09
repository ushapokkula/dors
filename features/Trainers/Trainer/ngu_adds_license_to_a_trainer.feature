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
    Then I see button "Add licence" available under the licences section

  @add_license_button_notvisible
  Scenario: Add license button is not visible when maximum licenses added to a trainer
    When I search for "maximum" and "licenses" in the trainer search field
    And I have trainer record loaded in editable view
    Then The "Add licence" button  is not visible when maximum licenses are added to a trainer

  @add_new_license
  Scenario Outline: Add new license to a trainer
    And I search for "licence" and "auto" in the trainer search field
    And I have trainer record loaded in editable view
    And I see button "Add licence" available under the licences section
    And I click on Course Name field
    And I select "<Course Name>", licence status and expiry date to add a new licence
    When I click "Add licence" button
    Then The system will add another row of licence entry below those already displayed
    And "Licence status" and "Expiry Date" fields are editable for added licenses
    And Expiry Date will have a date picker calender
    When I enter past date in Expiry Date
    Then The user should get an error as "Sorry, the expiry date cannot be in the past." below "Expiry Date"
    Examples:
      |Course Name    |
      |Motorway Course|


  @verify_default_days_license_Status
  Scenario Outline: verify the default no:of days when licence status is selected
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    And I click on Course Name field
    And I select Course "<Course Name>" to add a licence
    When I select licence as "<Licence Status>" to add a licence
    Then The Expiry Date will be defaulted to "<Days>"

    Examples:
      | Course Name     | Licence Status | Days |
      | Motorway Course | Full           | 730  |
      | Motorway Course | Provisional    | 183  |


  @removing_licences  @DR-677
  Scenario Outline: verify the default no:of days when licence status is selected
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    And I click on Course Name field
    And I select "<Course Name>", licence status and expiry date to add a new licence
    When I click "Add licence" button
    And I see 'X' button for added new licence which is not saved to database
    When I click X button
    Then The licence row will be deleted
    And I click on Course Name field
    Then I see added Scheme "<Course Name>" available in the dropdown for selection
    And The X button will not be available for licences persisted in the DB
    Examples:
    |Course Name|
    |RiDE       |

  @license_validation_fails
  Scenario Outline: Verify the validation message when the license fields are blank
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    When I click "<field_name>" without setting the data
    And I click "Update Trainer"
    Then I see "<validation_error_message>" against each "<field_name>"

    Examples:
      | field_name     | validation_error_message        |
      | Course name    | Please select a course name.    |
      | Licence status | Please select a licence status. |
      | Expiry Date    | Please select an expiry date.   |

  @verify_duplicate_courses
  Scenario Outline: Verify adding duplicate courses to licences
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    And I select Course "<Course Name>" to add a licence
    When I select licence as "<Licence Status>" to add a licence
    And I click "Add licence" button
    And The system will add another row of licence entry below those already displayed
    Then The "<Course Name>" is not available in the Course dropdown to select for another licence

    Examples:
      | Course Name     | Licence Status |
      | Motorway Course | Full           |


  @generating_licence
  Scenario: Generating licence numbers and saving to database and verify the success message
    And I fill Mandatory fields with required details on create trainer form
    And I click "Create Trainer"
    And a Success message will be displayed for Create Trainer "New trainer successfully created."
    And I will be redirected to the Update trainer page
    And I add two licences to the trainer with "Berks-Scheme" and "Motorway Course" with status as "Full"
    And I click "Add licence"
    And I see there are no multiple licences for "Berks Scheme" and "Motorway Course"
    When I click "Update Trainer"
    And The system will update the Trainer record in the database and add licenses against it
    And licence Id will be generated in this format "YYXXXX/CCC"
    And the system will show a success message, "Trainer record successfully updated."
    And I will be redirected to the Update trainer page


  @DR-678 @verify_licences_for_same_course
  Scenario Outline: Verify the licences for the same course
    And I search for "Bob" and "Thorton" in the trainer search field
    And I have trainer record loaded in editable view
    And I select Course "<Course Name1>" to add a licence
    When I select licence as "<Licence Status1>" to add a licence
    And I click "Add licence" button
    And I select Course "<Course Name2>" to add a licence
    When I select licence as "<Licence Status2>" to add a licence
    When I click "Add licence" button
    Then I see that there no licences for the same course

    Examples:
      | Course Name1    | Licence Status1 | Course Name2 | Licence Status2 |
      | Motorway Course | Full            | RiDE         | Full            |


    @DR-584 @default_page_view
      Scenario: Verify the default page view
      And The system will load the page where I can create a new trainer record
      And I will be able to add licences to the trainer record as i create them
      And Licence section will by default include one licence row with these fields
       |Licence_section_fields|
       |Course name           |
       |Licence status        |
       |Expiry Date           |
      And The Course Name dropdown will be populated with current active schemes
      And I see the following default Licence status in Licence status dropdown
        | Licence Status          |
        | ---Please select---     |
        | Provisional/Conditional |
        | Full                    |
        | Expired                 |
        | Suspended               |
        | Revoked                 |
        | Surrendered             |
      And I see button "Add licence" available under the licences section


    @DR-672  @add_licence_button_disabled/enabled
      Scenario: Verify the Add licence button disabled/enabled when maximum licences are reached
      When I search for "test_button" and "add_licence" in the trainer search field
      And I have trainer record loaded in editable view
      And I have not reached the limit of maximum licences possible
      And I add a new licence with "Speed Awareness" course and licence status as "Full"
      And I click "Add licence"
      Then The "Add licence" button  is not visible when maximum licenses are added to a trainer
      And I see the message "You have reached the maximum number of licences" under licences section
      When I click X button
      Then The "Add licence" button is enabled






























