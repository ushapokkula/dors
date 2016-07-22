@pass
@DR-26
Feature: NGU Edits a trainer(Except Licenses)
  As an NGU,
  I want to able to edit/update the trainer record (personal details),
  so that the record can be kept up to date.

  Background:
    Given that I have licence.ndors.org.uk page opened

  Scenario: Verify editable and non-editable fields on trainer form
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    When I click "Create Trainer"
    Then I have trainer record loaded in editable view
    And I see that "Username" and "Trainer Id" are not editable
    And The following fields are editable
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

  Scenario: Remove force area for a trainer
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I search for "Bob" and "Thorton_Auto" in the trainer search field
    And I have trainer record loaded in editable view
    And I will be shown "2" force areas linked to trainer "Bob"
    When I remove the first force area from the list
    Then I see the force area is removed
    And I will be shown "1" force areas linked to trainer "Bob"

  Scenario: Negative field validation
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I search for "Bob" and "Thorton_Auto" in the trainer search field
    And I have trainer record loaded in editable view
    Then I will see the error messages for missing mandatory fields as per the below table
      | First Name            | Please provide a first name.     |
      | Last Name             | Please provide a last name.      |
      | Primary Phone Number  | Please provide a phone number.   |
      | Primary Email Address | Please provide an email address. |
      | Address               | Please provide an address.       |
      | Town                  | Please provide a town.           |
      | Postcode              | Please provide a postcode.       |


  Scenario: Verify saving changes to database
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I search for "Bob" and "Thorton_Auto" in the trainer search field
    And I have trainer record loaded in editable view
    When I edit "Primary Phone Number"
    And I click "Update Trainer"
    Then I see message "Trainer record successfully updated" after updating the trainer
    And I see the updated phone number in database












