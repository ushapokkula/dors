@DR-169 @DR-674
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
    #And

  @DR-674 @create_tainer_licences
    Scenario: Verify Licence validation
      Then I fill Mandatory fields with required details on create trainer form
      And I add Licences
      And I click on create trainer button
      Then I see success message

     @DR-674 @create_Licences_number
     Scenario Outline: Generating Licence Numbers and saving to database
       And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
       Then The system will start autopredicting it and the list of trainer appears
       When I hit enter after typing characters of trainer name
       And I add Licences
       And I click Add licence button
       And I click update Trainer
       Then I see update message
       Examples:
       |Trainer Name|
       |roopa|

     @DR-674 @create_Licences
    Scenario Outline: Licence Validation fails
       And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
       Then The system will start autopredicting it and the list of trainer appears
       When I hit enter after typing characters of trainer name
       Then I should not see added course
       When I click update Trainer
       Then I should see error message on trainers page
       Examples:
         |Trainer Name|
             |roopa |











