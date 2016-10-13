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
    Then the system will load the page where I can create a new trainer record with required fields
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
      |Status                  |
      |Licence Agreement       |

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



  @DR-674 @Create_Trainer_Licences
    Scenario Outline: Add Licences and Verify the Success message
      Then I fill Mandatory fields with required details on create trainer form
      And I click on Course Name field
      And I select a "<Course Name>" from Course Name field for "<Course Type>"
      Then I can verify selected "<Course Name>" type is "<Course Type>"
      And I select the licences status as "<Licence status>"
      And I click Add licence button
      And I click on Create Trainer button
      Then a Success message will be displayed for Create Trainer "New trainer successfully created."
      Examples:
        |Course Name|Course Type|Licence status|
        |drive well |Theory Course|Full        |

     @Update_Trainer_Licences
     Scenario Outline: Generating Licence and Verifying licenses updating functionality
       Then I fill Mandatory fields with required details on create trainer form
       And I click on Course Name field
       And I select a "<Course Name>" from Course Name field for "<Course Type>"
       Then I can verify selected "<Course Name>" type is "<Course Type>"
       And I select the licences status as "<Licence status>"
       And I click Add licence button
       And I click on Create Trainer button
       Then a Success message will be displayed for Create Trainer "New trainer successfully created."
       And I will remain on the trainer's record page
       And I update existing licences for the trainer with new "<Licence status>" status
       And I click on Update Trainer
       Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
       Examples:
       |Licence status|Course Name|Course Type|
       |Full          |RiDE       |Theory Course|
  
  @DR-674 @Create_Trainer_Licences
  Scenario Outline: Licence Validation fails
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    Then I should see selected licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I click on Course Name field
    Then I see added Scheme "<Course Name>" no longer available in the dropdown for selection
    And the Licence Status, Course Name or Expiry Date is not set
    And I click Add licence button
    And I click on Update Trainer
    Then I should see an error messages on trainers page
    Examples:
      |trainer first name | trainer last name|Course Name           |Licence status|Expiry Date|
      |roopa2              |trainer2          |Driving For Change   |    Full      |04/10/2018 |


  @DR-584 @cancel_creation1
    Scenario: Verify the cancel button without filling any details on the create trainer form
    And The system will load the page where I can create a new trainer record
    When I click "Cancel"
    And I will be re-directed to "Assessments" page


  @DR-584 @cancel_creation2
  Scenario: Verify the cancel button with filling any details on the create trainer form
    And The system will load the page where I can create a new trainer record
    And I fill Mandatory fields with required details on create trainer form
    When I click "Cancel"
    And I will be re-directed to "Assessments" page
    Then Any unsaved changes will be lost











