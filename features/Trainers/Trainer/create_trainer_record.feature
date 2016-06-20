@DR-169 @pass
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
      | Primary Email Address  |
      | Secondary Email Address|
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
      |Primary Phone Number  | Please provide a phone number.   |
      |Primary Email Address | Please provide an email address. |
      | Address              | Please provide an address.       |
      | Town                 | Please provide a town.           |
      | Postcode             | Please provide a postcode.       |

  @create_trainer3
  Scenario Outline: Verify The optional fields
    Then I see the following fields as "<Optional>" on create trainer form
    Examples:
      | Optional               |
      | Known As               |
      | Secondary Phone Number |
      | Secondary Email Address|
      #| Is Instructor          |


  @DR-674 @Create_Trainer_Licences
    Scenario: Add Licences and Verify the Success message
      Then I fill Mandatory fields with required details on create trainer form
      And I have added licences for the trainer and all mandatory fields for every licence have a value
      And I click Add licence button
      And I click on Create Trainer button
      Then a Success message will be displayed for Create Trainer "New trainer successfully created."


     @Update_Trainer_Licences
     Scenario Outline: Generating License and Verifying licenses updating functionality
       Then I fill Mandatory fields with required details on create trainer form
       And I have added licences for the trainer and all mandatory fields for every licence have a value
       And I click Add licence button
       And I click on Create Trainer button
       Then a Success message will be displayed for Create Trainer "New trainer successfully created."
       And I will remain on the trainer's record page
       And I update existing licences for the trainer with new "<Licence status>" status
       And I click on Update Trainer
       Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
       Examples:
       |Licence status|
       |Full          |

     @DR-674 @Create_Trainer_Licences
       Scenario Outline: Licence Validation fails
       When I started searching existing "<Trainer Name>" in the trainer search field
       Then I should not see added course name in the course dropdown-menu
       And the Licence Status, Course Name or Expiry Date is not set
       And I click Add licence button
       And I click on Update Trainer
       Then I should see an error messages on trainers page
       Examples:
         |Trainer Name|
         |roopa trainer|











