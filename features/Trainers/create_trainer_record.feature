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
  Scenario Outline: Verify The optional fields
    Then I see the following fields as "<Optional>" on create trainer form
    Examples:
      | Optional               |
      | Known As               |
      | Secondary Phone Number |
     # | Is Instructor          |

  @DR-39 @NGU-manually-editing-licences @bug-story
    Scenario Outline: Display error message when existing licences Full or Provisional status have expiry date in past
      Then I see "Trainers management" page
      When I start searching for existing "<Trainer Name>" in the trainer search field
      Then I should see existing trainer details on trainer management page
      And I change "<Expiry date>" in past for trainer which has Licence state of 'Full' or 'Provisional'
      Then the system will trigger the user with an error message "Sorry, the license has expired, please amend the status accordingly" on trainer page
      Examples:
       |Trainer Name |Expiry date|
       |roopa trainer|04/04/2016|

  @DR-39 @Editable_fields
   Scenario: Verify the Editable Licence Fields
    Then I see "Trainers management" page
    And I see the following default Licence status fields
      |Licence Status|
      |---Please select---|
      |Provisional/Conditional|
      |Full                   |
      |Expired                |
      |Suspended              |
      |Revoked                |
      |Surrendered            |


  @DR-39 @NGU-manually-editing-licences
  Scenario Outline: NGU edits a trainer's license details
    Then I see "Trainers management" page
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see existing trainer details on trainer management page
    When I select the "<Licence status>" as 'Expired' or 'Suspended'
    Then the system will default the Expiry Date to today's date
    And I can change today's date to any other "<date>" not in past
    Examples:
    |Trainer Name|Licence status |date      |
    |roopa trainer|Expired       |17/04/2017|
    |roopa trainer|Suspended     |17/04/2017|


  Scenario Outline: NGU edits a trainer's license detail
    Then I see "Trainers management" page
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see existing trainer details on trainer management page
    When I select the status as to 'Full' from any other value
    Then the system will default the Expiry Date to 730 days from current date
    And I can change Expiry Date value to any other "<date>" not in past
    Examples:
      |Trainer Name|date|
      |roopa trainer|17/04/2017|

  Scenario Outline: Verify Expiry date for Provisional status
    Then I see "Trainers management" page
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see existing trainer details on trainer management page
    When I select the "<Licence status>" as 'Provisional or Conditional'
    Then the system will default the Expiry Date to 183 days from current date
    And I can change Expiry Date to any other "<date>" as well not in past
    Examples:
     |Trainer Name|Licence status          |date|
     |roopa trainer|Provisional/Conditional|22/04/2017|

  Scenario Outline: Verify warning-message when expiry date more than 730 days
    Then I see "Trainers management" page
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see existing trainer details on trainer management page
   When I manually set the "<Expiry Date>" to more than 730 days from system or current date
   Then the system will show a soft warning message, "You are setting the validity of this licence for more than 2 years. Please ensure your date selection is correct."
   Examples:
   |Trainer Name|Expiry Date|
   |roopa trainer|26/04/2019|

  Scenario Outline: Verify the 'updated message' after few changes
    Then I see "Trainers management" page
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see existing trainer details on trainer management page
    When I have made desired changes as "<Postcode>" and click 'Save'
    #Then the system will save the changes to the license record in the database
    And the system will show a success message, "Trainer record successfully updated."
    And I will remain on the trainer's record page
    Examples:
    |Trainer Name|Postcode|
    |roopa trainer|HA9 7lm|

