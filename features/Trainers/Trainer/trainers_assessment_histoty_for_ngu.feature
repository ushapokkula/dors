@DR-836 @pas
Feature: As an NGU (TrainingGovernance)
  I want to be able to search a Trainer with Name or ID,
  so that I can filter the assessment records on Assessment
  management page.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page

  Scenario Outline: search for assessments  by trainer name
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    Examples:
         | Trainer Name|
         | use         |
         | tes         |
         | roo         |

  Scenario Outline: Verify the auto-predict search for trainer when searched with Trainer ID
    When I start typing six digits as "<Trainer ID>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears

    Examples:
      | Trainer ID |
      | 111111     |
      | 333333     |
      | 555555     |

  Scenario Outline: Verify the format of displaying the list of names when trainer name is searched
    When I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    Then The auto predicted dropdown list will display the names in the format "<Format>"

    Examples:
      | Trainer Name | Format                |
      | ali          | Ali Mashhadi (160001) |

  Scenario Outline: Verify the default search Trainer
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    When I hit enter after typing first three characters of trainer name as "<Trainer Name>"
    Then The first trainer name will be selected from the drop down list by default "<First Name>"
    Examples:
      | Trainer Name | First Name |
      | zar          | Zara       |


  Scenario: Verify the validation message when no record does'nt match the search criteria
    When The search criteria does'nt match any trainer record on the database
    Then I see the message "No Trainers with this name exist."

  Scenario Outline: Verify the trainer details by moving up and down arrow keys from auto-predict list
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    When I hit DOWN arrow key from the trainer auto predict list
    Then The second value will be selected from the auto predict list "<Down_Arrow>"
    When I hit UP arrow key from the trainer auto predict list
    Then The first name will be selected from the auto predict list "<UP_Arrow>"
    Examples:
      | Trainer Name | Down_Arrow | UP_Arrow |
      | swa          | Swapna     | Swapna   |


