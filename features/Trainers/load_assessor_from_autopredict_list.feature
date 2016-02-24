@DR-513
Feature: As an NGU user (Compliance Manager/TrainingGovernance),
  I want to be able to load an Assessor record to view or to edit,
  so that their details can be maintained up to date.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "ASSESSORS"

  @load_assessor1
  Scenario Outline: Verify the assessor record after selecting assessor item from auto-predicted list
    And I start typing atleast three characters as an "<Assessor Name>" in the search field
    And The system will start autopredicting it and the list appears
    When I click on the assessor item from the list which i want to edit
    Then The system will load the assessor record with "<Username>"

    Examples:
      | Assessor Name | Username |
      | zar           | zara     |

  @load_assessor2
  Scenario Outline: Verify the Assessor Input fields visibility

    And I start typing atleast three characters as an "<Assessor Name>" in the search field
    And The system will start autopredicting it and the list appears
    When I click on the assessor item from the list which i want to edit
    Then The system will load the assessor record with "<Username>"
    Then The following fields with full details are displayed in the editable mode

      | Assessor Input Fields  |
      | Assessor Number        |
      | First Name             |
      | Last Name              |
      | Primary Phone Number   |
      | Secondary Phone Number |
      | Email                  |
      | Address                |
      | Town                   |
      | Postcode               |
      | Force Areas            |
    And The username will not be editable

    Examples:
      | Assessor Name | Username |
      | zar           | zara     |

  @load_assessor3
  Scenario Outline: Verify the oder of Assessor Input fields display when assessor is loaded from search
    And I start typing atleast three characters as an "<Assessor Name>" in the search field
    And The system will start autopredicting it and the list appears
    When I click on the assessor item from the list which i want to edit
    And The system will load the assessor record with "<Username>"
    Then The following fields are displayed in this below mentioned order

      | Assessor Input Fields  |
      | Username               |
      | Assessor Number        |
      | First Name             |
      | Last Name              |
      | Primary Phone Number   |
      | Secondary Phone Number |
      | Email                  |
      | Address                |
      | Town                   |
      | Postcode               |
      | Force Areas            |

    Examples:
      | Assessor Name | Username |
      | zar           | zara     |




