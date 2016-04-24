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



    @DR-39 @NGU-manually-editing-licences @bug-story
    Scenario Outline: Display error message when exisiting licences Full or Provisional status have expiry date in past
      Then I see "Trainers management" page
      When I start searching for existing "<Trainer Name>" in the trainer search field
      Then I should see existing trainer details on trainer management page
      And I change "<Expiry date>" in past for trainer which has Licence state of 'Full or Provisional'
      Then the system will trigger the user with an error message "Sorry, the license has expired, please amend the status accordingly" on trainer page
      Examples:
       |Trainer Name |Expiry date|
       |roopa trainer|04/04/2016|




  @DR-39 @Editable_fields
   Scenario: Verify the Editable Licence Fields
    When the default view of the trainer page loaded
    Then I see the following default Licence status fields
      |Licence Status|
      |---Please select---|
      |Provisional/Conditional|
      |Full                   |
      |Expired                |
      |Suspended              |
      |Revoked                |
      |Surrendered            |




