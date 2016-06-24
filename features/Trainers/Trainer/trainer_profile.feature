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
    Then I will be shown these fields of my record
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
    When I click Cancel button on trainer profile page
    And I will be redirected to "Licences" page
    Then unsaved changes will be lost

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


  Scenario Outline: Verify The optional fields
    Then I see the following fields as "<Optional>" on create trainer form
    Examples:
      | Optional               |
      | Known As               |
      | Secondary Phone Number |
      | Secondary Email Address|
      #| Is Instructor          |










