@DR-169
Feature: As an an NGU (TrainingGovernance),
  I want to be able to create new Trainer records,
  so that they can be added onto courses by suppliers and have a visibility on the system.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"

  @create_trainer1
  Scenario: Verify the fields displayed to create a trainer
    Then the system will load the page where I can create a new trainer record with the following fields
      | Input Details          |
      | Username               |
      | Trainer Id             |
      | First Name             |
      | Last Name              |
      | Known As               |
      | Primary Phone Number   |
      | Secondary Phone Number |
      | Email                  |
      | Address                |
      | Postcode               |
      | Town                   |
      | Is Instructor          |

  @create_trainer2
  Scenario Outline: Verify The mandatory fields

    Then I see the following fields as "<Mandatory>" with "<Error Messages>" on create trainer form

    Examples:
      | Mandatory            | Error Messages                   |
      | Username             | Please provide a username.       |
      | Trainer Id           | Please provide a trainer id.     |
      | First Name           | Please provide a first name.     |
      | Last Name            | Please provide a last name.      |
      | Primary Phone Number | Please provide a phone number.   |
      | Email                | Please provide an email address. |
      | Address              | Please provide an address.       |
      | Town                 | Please provide a town.           |
      | Postcode             | Please provide a postcode.       |

  @create_trainer3
  Scenario Outline: Verify The  optional fields

    Then I see the following fields as "<Optional>" on create trainer form

    Examples:
      | Optional               |
      | Known As               |
      | Secondary Phone Number |
     # | Is Instructor          |


  #Scenario: Verify the validation for username field length and uniqueness



  @DR-39 @NGU-manually-editing-licences
  Scenario Outline: NGU edits a trainer's license details
    When I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    When I hit DOWN arrow key from the trainer auto predict list
    Then The second value will be selected from the auto predict list "<Down_Arrow>"
    And I should able to edit exisiting licences status and expiry date
    And I click update licences
    Then I should see updated licence details

    Examples:
    |Trainer Name |Down_Arrow|
    |roo          |roopa test|


  @DR-39 @Editable_fields
   Scenario Outline: Verify the Editable Licence Fields
    Then I see the following fields as "<Editable Licence Fields>" on  trainer form

    Examples:
      | Editable Licence Fields |
      |  License Status         |
      |  License Expiry Date    |




    Scenario Outline: verify the Licence status values which I can select
      Then I see the following fields as "<Licence Status>" on trainer record
     Examples:

       |Licence Status|
    |Provisional/Conditional|
    |     Full                  |
    |Expired                    |
    |Suspended                  |
    |Revoked                    |
    |Surrendered                |

