@DR-12 @DR-817
Feature: As an assessor,
  I want to be able to view my record,
  so that I can ensure my details are correct and up to date.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I navigate to "MY PROFILE" page

  Scenario Outline: Verify the read-only fields on My Profile page
    Then I will be shown my record with below read only "<Assessor Readonly Fields>" fields
    Examples:
      | Assessor Readonly Fields |
      | Username        |
      | Assessor Number |
      | Force Areas     |

  Scenario Outline: Verify the editable fields on My Profile page
    Then I will be shown my record with below editable "<Assessor Editable Fields>" fields
    Examples:
      | Assessor Editable Fields |
      | First Name             |
      | Last Name              |
      | Primary Phone Number   |
      | Secondary Phone Number |
      | Email                  |
      | Town                   |
      | Address                |
      | Postcode               |
      | Force Areas            |

  Scenario Outline: Verify The optional fields
    Then I see the following fields are "<Optional>"
    Examples:
      | Optional               |
      | Assessor Number        |
      | Secondary Phone Number |
      | Force Areas            |


