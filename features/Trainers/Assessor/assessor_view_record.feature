@DR-12 @pass
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
      | Username                 |
      | Assessor Number          |
      | Force Areas              |
      | First Name               |
      | Last Name                |

  Scenario Outline: Verify the editable fields on My Profile page
    Then I will be shown my record with below editable "<Assessor Editable Fields>" fields

    Examples:
      | Assessor Editable Fields |
      | Primary Phone Number     |
      | Secondary Phone Number   |
      | Primary Email Address    |
      | Secondary Email Address  |
      | Town                     |
      | Address                  |
      | Postcode                 |
      | Force Areas              |

  Scenario Outline: Verify The optional fields
    Then I see Assessor "<Optional>" field is an optional field
    Examples:
      | Optional               |
      | Assessor Number        |
      | Secondary Phone Number |
      | Force Areas            |


