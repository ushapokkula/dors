@DR-26
Feature: NGU Edits a trainer(Except Liccenses)
  As an NGU,
  I want to able to edit/update the trainer record (personal details),
  so that the record can be kept up to date.

  Background:
    Given that I have licence.ndors.org.uk page opened

  @verify_editable_non_editable_fields
  Scenario: Verify editable and non-editable fields on trainer form
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    When I click "Create Trainer"
    Then I have trainer record loaded in editable view
    And I see that "Username" and "Trainer Id" are not editable
    And The following fields are editable
      | Editable Fields         |
      | First Name              |
      | Last Name               |
      | Known As                |
      | Primary Phone Number    |
      | Secondary Phone Number  |
      | Primary Email Address   |
      | Secondary Email Address |
      | Address                 |
      | Town                    |
      | Postcode                |

  @removing_force_areas
  Scenario: Removing Forece areas
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I search for "Bob" and "Thorton_Auto" in the trainer search field
    And I have trainer record loaded in editable view
    And Force Areas linked to Trainer record will be displayed
    When I click the cross on one of the assigned force areas from the list
    Then The force will be removed from the list of assigned Force Areas

  @verify_negative_field_validation
  Scenario Outline: Negative field validation

    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I search for "Bob" and "Thorton_Auto" in the trainer search field
    And I have trainer record loaded in editable view
    When I leave the mandatory fields "<Mandatory>" blank
    And I click "Update Trainer"
    Then I see the error message "<Error Messages>" against the field
  Examples:
  | Mandatory            | Error Messages                   |
  | First Name           | Please provide a first name.     |
  | Last Name            | Please provide a last name.      |
  |Primary Phone Number  | Please provide a phone number.   |
  |Primary Email Address | Please provide an email address. |
  | Address              | Please provide an address.       |
  | Town                 | Please provide a town.           |
  | Postcode             | Please provide a postcode.       |

  @saving_changes_to_database
  Scenario: Verify saving changes to database

    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I search for "Bob" and "Thorton_Auto" in the trainer search field
    And I have trainer record loaded in editable view
    When I edit "Primary Phone Number"
    And I click "Update Trainer"
    Then I see message "Trainer record successfully updated" after updating the trainer
    And I see the updated phone number in database

   @negative_field_validation
    Scenario: Verify negative field validation on editing
     And I login as an "Compliance Manager"
     And I click "TRAINERS"
     And I search for "Bob" and "Thorton_Auto" in the trainer search field
     And I have trainer record loaded in editable view
     And I edit primary telephone number
     And I edit Postcode
     And I edit the Primary Email Address










