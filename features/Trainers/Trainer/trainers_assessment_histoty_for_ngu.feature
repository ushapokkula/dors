@DR-836 @pass
Feature: As an NGU (TrainingGovernance)
  I want to be able to search a Trainer with Name or ID,
  so that I can filter the assessment records on Assessment
  management page.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    And I deleted the assessments from Database

  Scenario Outline: search for assessments  by trainer name
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    Examples:
         | Trainer Name|
         | bob         |
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

 Scenario Outline:  Verify the validation message for no trainer exists when searched with Trainer ID
   When I start typing invalid "<Trainer ID>" in the trainer search field
   Then I see the message "No such trainer exists."
   Examples:
   |Trainer ID|
   |123122222|
   |5487469221254|
   |00000000000  |


  Scenario Outline: Verify the format of displaying the list of names when trainer name is searched
    When I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    When I hit enter after typing first three characters of trainer name as "<Trainer Name>"
    And searched "<format>" trainers name includes trainer full name and trainer ID

    Examples:
      | Trainer Name |format       |
      | ali          | Ali Mashhadi (160001) |


  Scenario: Verify the validation message when no trainer exists for the search criteria entered
    When The search criteria does'nt match any trainer record on the database
    Then I see the message "No such trainer exists."


  Scenario Outline: Verify the trainer details by moving up and down arrow keys from auto-predict list
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    When I hit DOWN arrow key from the trainer auto predict list
    Then The second value will be selected from the auto predict list "<Down_Arrow>"
    When I hit UP arrow key from the trainer auto predict list
    Then The first name will be selected from the auto predict list "<UP_Arrow>"
    Examples:
      | Trainer Name | Down_Arrow | UP_Arrow |
      | ali          | Ali        | Ali   |


  Scenario: No assessments available
    When no assessment records are found in the database for selected filter criteria on the page
    Then this message will be displayed, "There are no assessments to display."




