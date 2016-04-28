@DR-517
Feature: As an NGU (TrainingGovernance),
  I want to be able to search a Trainer record,
  so that I can manage their account.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"

  @trainer_field_visibility
  Scenario: Verify the visibility of assessor search field
    Then I see the search field is visible on the page to search a trainer
    And The input field will include a placeholder info text

  @trainer_auto_predict1
  Scenario Outline: Verify the auto-predict search for trainer when searched with Trainer ID
    When I start typing six digits as "<Trainer ID>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears

    Examples:
      | Trainer ID |
      | 111111     |
      | 333333     |
      | 555555     |

  @trainer_auto_predict2
  Scenario Outline: Verify the auto-predict search for trainer when searched with Firstname or lastname
    When I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears

    Examples:
      | Trainer Name |
      | bob          |
      | ton          |
      | pil          |

  @trainer_auto_predict3
  Scenario Outline: Verify the format of displaying the list of names when assessor name is searched
    When I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    Then The system will start autopredicting it and the list of trainer appears
    Then The auto predicted dropdown list will display the names in the format "<Format>"

    Examples:
      | Trainer Name | Format               |
      | zar          | Zara Turner (666666) |

  @trainer_auto_predict4
  Scenario Outline: Verify the default search assessor
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    When I hit enter after typing first three characters of trainer name as "<Trainer Name>"
    Then The first trainer name will be selected from the drop down list by default "<First Name>"


    Examples:
      | Trainer Name | First Name |
      | zar          | Zara       |

  @trainer_auto_predict5
  Scenario: Verify the validation message when no record does'nt match the search criteria
    When The search criteria does'nt match any trainer record on the database
    Then I see a message "No Trainers with this name exist."


  @trainer_auto_predict6
  Scenario Outline: Verify the default search assessor
    And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    When I hit DOWN arrow key from the trainer auto predict list
    Then The second value will be selected from the auto predict list "<Down_Arrow>"
    When I hit UP arrow key from the trainer auto predict list
    Then The first name will be selected from the auto predict list "<UP_Arrow>"
    Examples:
      | Trainer Name | Down_Arrow              | UP_Arrow                 |
      | ani          | AnitaWTGTEST Hegde (11) | AnitaTest1 WTGtest1 (10) |






