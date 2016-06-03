@DR-26
Feature: NGU Edits a trainer(Except Liccenses)
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
#    Then I have trainer record loaded in editable view
#    And I see that Username and Trainer ID are not editable
#    And The following fields are editable
      | Editable Fields         |
      | First Name              |
      | Last Name               |
      | known AS                |
      | Primary Phone Number    |
      | Secondary Phone Number  |
      | Primary Email Address   |
      | Secondary Email Address |
      | Address                 |
      | Town                    |
      | Postcode                |


