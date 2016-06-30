@DR-9 @pass
Feature: Trainer Profile
  As a Trainer user of Licence Portal,
  I want to be able to update my profile on the system,
  so that all my contact details remain updated.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Trainer1"
    And I navigate to "MY PROFILE" page

  Scenario: Trainer loads their profile page with pre-populated data
    Then I will be shown below fields of trainer record
      | Update Trainer Fields  |
      | Username               |
      | Trainer Id             |
      | First Name             |
      | Last Name              |
      | Known As               |
      | Primary Phone Number   |
      | Secondary Phone Number |
      | Primary Email Address  |
      |Secondary Email Address |
      | Address                |
      | Town                   |
      | Postcode               |
      |Is Instructor           |
      | Force Areas            |

  Scenario: Verify Cancel button functionality on Trainer Profile Page
    Then the system will load the page where I can update trainer record
    And I change Primary Phone Number details
    When I click Cancel button on trainer profile page
    And I will be redirected to "My Licences" page
    And I navigate to "MY PROFILE" page
    Then unsaved changes on trainer profile will be lost


  Scenario Outline: Verify The mandatory fields
    When I set below Mandatory "<fields>" with empty "<value>"
    And I click "Update" button
    Then I see the following fields with "<Error Messages>" on trainer profile page
     Examples:
      | fields               | Error Messages                    |value|
      |Primary Phone Number  | Please provide a phone number.    |     |
      |Primary Email Address | Please provide an email address.  |     |
      | Address              | Please provide an address.        |     |
      | Town                 | Please provide a town.            |     |
      | Postcode             | Please provide a postcode.        |     |


  Scenario Outline: Verify The optional fields
    Then I see Trainer "<Optional>" field is an optional field
    Examples:
      | Optional               |
      | Known As               |
      | Secondary Phone Number |
      | Secondary Email Address|
      | Force Areas            |


  Scenario Outline: Verify the read-only and disabled fields on Trainer Profile page
    Then I will be shown trainer "<Trainer Readonly Fields>" field as read only field
    Examples:
      | Trainer Readonly Fields |
      | Username        |
      | Trainer Id      |
      |First Name       |
      |Last Name        |
      |Is Instructor    |
      | Force Areas     |

   @DR-912
  Scenario Outline: Verify fields max and min characters allowed on trainer profile page
    When I enter the <field> with <length> characters
    Then I should see maximum allowed characters in for <field> is <length>
    Examples:
      | field                   |length|
      | Known As                | 50 |
      | Primary Phone Number    | 50 |
      | Secondary Phone Number  | 10 |
      | Primary Email Address   | 255|
      | Secondary Email Address | 255|
      | Address                 | 255|
      |Town                     | 60 |

  @DR-912
  Scenario Outline: Verify Trainer field validations on trainer profile page
    When I enter "<field>" to value "<value>"
    Then the system will highlight those trainer profile fields
    Then I should see "<validation requirements>" message against that field
    And I click "Update" button
    And record will not be updated
    And I will remain on the trainer's profile page
    Examples:
      | field                    | value                          | validation requirements                                  |
      | Primary Phone Number     |                                | Please provide a phone number.                           |
      | Primary Phone Number     | T$%@!                          | Sorry, the phone number must be at least 10 digits long. |
      | Secondary Phone Number   | 0788                           | Sorry, the phone number must be at least 10 digits long. |
      | Primary Email Address    |                                | Please provide an email address.                         |
      | Primary Email Address    | test!#%&'@t.com                | Please provide a valid email address.                    |
      | Primary Email Address    | a!#$%&*+-/=?^_{}~.b@gmail.com | Please provide a valid email address.                     |
      | Secondary Email Address  | test+co&'uk                   | Please provide a valid email address.                     |
      | Secondary Email Address  | a!#$%&*+-/=?^_{}~.b@gmail.com| Please provide a valid email address.                      |
      | Address                  |                              | Please provide an address.                                 |
      | Town                     |                              | Please provide a town.                                     |
      | Postcode                 |                              | Please provide a postcode.                                 |
      | Postcode                 | ha9 445                      | Please provide a valid postcode.                           |








