@DR-9
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
    When I fill fields with empty "<value>"
    Then I see the following fields as "<Mandatory_field>" with "<Error Messages>" on trainer profile page
     Examples:
      | Mandatory_field      | Error Messages                   |value|
      |Primary Phone Number  | Please provide a phone number.   |     |
      |Primary Email Address | Please provide an email address. |     |
      | Address              | Please provide an address.       |     |
      | Town                 | Please provide a town.           |     |
      | Postcode             | Please provide a postcode.       |     |


  Scenario Outline: Verify The optional fields
    Then I see the following fields as "<Optional>" on create trainer form
    Examples:
      | Optional               |
      | Known As               |
      | Secondary Phone Number |
      | Secondary Email Address|
      #| Is Instructor          |


  Scenario Outline: Verify fields max and min characters allowed on trainer profile page
    When I enter the <field> with <length> characters
    Then I should see maximum allowed characters in for <field> is <length>
    Examples:
      | field                   |length|
      | Username                | 70 |
      | First Name              | 50 |
      | Last Name               | 50 |
      | Known As                | 50 |
      | Primary Phone Number    | 50 |
      | Secondary Phone Number  | 10 |
      | Primary Email Address   | 255|
      | Secondary Email Address | 255|
      | Address                 | 255|
      |Town                     | 60 |


  Scenario Outline: Verify Trainer field validations on trainer profile page
    When I set "<field>" to value "<value>"
    Then I should see "<validation requirements>" message against that field
    Examples:
      | field                    | value               | validation requirements                                                        |
      | Username                 |                     | Please provide a username.                                                     |
      | Username                 |Test                 | Sorry, the username is already taken. Please try a different username.         |
      | Username                 |ngu                  | Sorry, the username must be at least 4 characters long.                        |
      | Username                 |T$%@!                | Sorry, the username can only contain numbers, letters, dashes and underscores. |
      | Trainer Id               |                     | Please provide a trainer id.                                                   |
      | Trainer Id               |014578               | Sorry, the trainerId cannot start with zero.                                   |
      | Trainer Id               | 16789               | Sorry, the trainerId must be 6 numbers long.                                   |
      | Trainer Id               | @#*&%$              | Sorry, the trainerid must be a number.                                         |
      | First Name               |                     | Please provide a first name.                                                   |
      | Last Name                |                     | Please provide a last name.                                                    |
      | Primary Phone Number     |                     | Please provide a phone number.                                                 |
      | Primary Phone Number     | T$%@!               | Sorry, the phone number must be at least 10 digits long.                       |
      | Secondary Phone Number   | 0788                | Sorry, the phone number must be at least 10 digits long.                       |
      | Primary Email Address    |                     | Please provide an email address.                                               |
      | Primary Email Address    | test.com            | Please provide a valid email address.                                          |
      | Secondary Email Address  | test+co&uk          | Please provide a valid email address.                                          |
      | Address                  |                     | Please provide an address.                                                     |
      | Town                     |                     | Please provide a town.                                                         |
      | Postcode                 |                     | Please provide a postcode.                                                     |
      | Postcode                 | ha9 445             | Please provide a valid postcode.                                               |








