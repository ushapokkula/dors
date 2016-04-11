@DR-12 @pass
Feature: As an assessor,
  I want to be able to view my record,
  so that I can ensure my details are correct and up to date.

  Scenario Outline: Verify the read-only fields on My Profile page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I click "MY PROFILE"
    Then I will be shown my record with below read only "<Assessor Readonly Fields>" fields
    #Then I should see "Username", "Acessor Number", "Forces Areas" as read only fields

  Examples:
      | Assessor Readonly Fields |
      | Username        |
      | Assessor Number |
      | Force Areas     |
      #/* this field should only display when we have added forces to that user*/

  Scenario Outline: Verify the editable fields on My Profile page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I click "MY PROFILE"
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
      | Status                 |


