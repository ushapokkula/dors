Feature: DR-171
  As an user,
  I want to be able to create a new Assessor,
  so that they can use the system to manage assessments.

  Background:
    Given that I am logged into the system
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
  Scenario: Verify The mandatory and optional fields
    Then I see the following fields as Mandatory
      | Mandatory            |
      | Username             |
      | First Name           |
      | Last Name             |
      | Primary Phone Number |
      | Email                |
      | Address              |
      | Postcode             |
      | Force Areas          |
    And I see the following fields as optional
      | Optional               |
      | Assessor Number        |
      | Secondary Phone Number |

  @create_assessor3
    Scenario: Verify the Cancel and Create Assessor buttons
      And I see that the page includes "Create Assessor" and "Cancel" buttons

