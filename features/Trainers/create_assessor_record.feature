@DR-171
Feature: DR-171
  As an user,
  I want to be able to create a new Assessor,
  so that they can use the system to manage assessments.

  Background:
    #Given that I am logged into the system
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page

  @create_assessor1
  Scenario: Verify the fields displayed to create an assessor
    Then the system will load the page where I can create a new assessor record with the following fields
      | Input Details          |
      | Username               |
      | Assessor Number        |
      | First Name             |
      | Last Name              |
      | Primary Phone Number   |
      | Secondary Phone Number |
      | Email                  |
      | Address                |
      | Postcode               |
      | Force Areas            |

  @create_assessor2
  Scenario Outline: Verify The mandatory and optional fields

    Then I see the following fields as "<Mandatory>" with "<Error Messages>"

    Examples:
      | Mandatory            | Error Messages                   |
      | Username             | Please provide a username.       |
      | First Name           | Please provide a first name.     |
      | Last Name            | Please provide a last name.      |
      | Primary Phone Number | Please provide a phone number.   |
      | Email                | Please provide an email address. |
      | Address              | Please provide an address.       |
      | Postcode             | Please provide a postcode.       |

  @create_assessor3
  Scenario Outline: Verify The mandatory and optional fields

    Then I see the following fields as "<Optional>"

    Examples:
      | Optional               |
      | Assessor Number        |
      | Secondary Phone Number |
      | Force Areas            |

  @create_assessor4
  Scenario: Verify the Cancel and Create Assessor buttons
    And I see that the page includes "Create Assessor" and "Cancel" buttons

