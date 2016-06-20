@DR-596
Feature: Validation Improvements on Create and Update Trainer Forms

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance manager"
    And I navigate to "TRAINERS" page
    Then the system will load the trainer form where I can create a new trainer record

  @username_validations
  Scenario Outline: verify username field validation on create trainers page
    When I enter the "<field>" with "<length>" characters
    Then I should not get the error message as "Please provide a username."
    When I enter the "<field>" with "<length>" characters
    Then I should not get the error message as "Sorry, the username must be at least 4 characters long."
    When I set "<field>" to value "<value>"
    Then I should not get the error message as "Sorry, the username can only contain numbers, letters, dashes and underscores."
    When I set "<field>" to value "<value>"
    Then I should not get the error message as "Sorry, the username can only contain numbers, letters, dashes and underscores."
    Examples:
       |field|value |length|
       |username|-  | 70   |
       |username|  _|  4   |

  @trainerid_validations
  Scenario Outline: verify Trainer ID field validation on create trainers page
     When I set <field> to value "<value>"
     Then I get the error message as "Sorry, the trainerId cannot start with zero."
      When I set <field> to value "<value>"
      Then I get the error message as "Sorry, the trainerId must be 6 numbers long."
      When I set <field> to value "<value>"
      Then I get the error message as "Sorry, the trainerid must be a number."
      Examples:
        |field    | value|
        |trainerId| 014578|
        |trainerId| 16789 |
        |trainerId| @#*&%$|

  @first_last_knownas_validations
  Scenario Outline: verify firstname,lastname,knownas field validation msg for max chars allowed
    When I enter the "<field>" with "<length>" characters
    Then I should see "<field>" maximum allowed characters
    And I should not get the error message as "Please provide a first name."
    When I enter the "<field>" with "<length>" characters
    Then I should see "<field>" maximum allowed characters
    And I should not get the error message as "Please provide a last name."
    When I enter the "<field>" with "<length>" characters
    Then I should see "<field>" maximum allowed characters
    Examples:
      |field     |length|
      |first name|   50 |
      |last name |  50  |
      |knownas   | 50   |


  @phone_field_validations
    Scenario Outline: verify (Primary and Secondary) phone number fields validations msg for max and min chars allowed
    When I enter the "<field>" with "<length>" characters
    Then I should see "<field>" maximum allowed characters
    And I should not get the error message as "Please provide a first name."
    When I enter the "<field>" with "<length>" characters
    Then I should see "<field>" minimum allowed characters
    And I should not get the error message as "Sorry, the phone number must be at least 10 digits long."
    When I enter the "<field>" with "<length>" characters
    Then I should see "<field>" maximum allowed characters
    And I should not get the error message as "Please provide a last name."
    When I enter the "<field>" with "<length>" characters
    Then I should see "<field>" minimum allowed characters
    And I should not get the error message as "Sorry, the phone number must be at least 10 digits long."
    Examples:
      |field              |length|
      |primary phone number|  50  |
      |primary phone number|  10  |
      |secondary phone number| 50 |
      |secondary phone number| 10 |

    @email_field_validations
    Scenario Outline: verify Primary and Secondary email fields validations msg on create trainer page
      When I enter the "<field>" with "<length>" characters allowed
      Then I should see "<field>" maximum allowed characters
      When I set <field> to value "<value>"
      Then I get the error message as "Please provide a valid email address."
      Examples:
       |field                |value        | length|
       |primary email address|test.com     |255   |
       |secondary email address|test@~co.uk| 255  |


      @address_field_validations
      Scenario Outline: verify address field validations msg on create trainer page
        When I enter the "<field>" with "<length>" characters
        Then I should see "<field>" maximum allowed characters
        Examples:
          |field|length|
          |address|255 |


        @town_field_validations
        Scenario Outline: verify Town field validations msg on create trainer page
          When I enter the "<field>" with "<length>" characters allowed
         #Letters, space and - , . ; ' & / . ( )#
          Then I should see "<field>" maximum allowed characters
          When I set <field> to value "<value>"
          Then I get the error message as "Please provide a town."
          Examples:
            |field|length|value|
            |postcode| 60 |    |


          @postcode_field_validation
          Scenario Outline: verify postcode field validations msg on create trainer page
            When I enter the "<field>" with "<length>" characters
            # [a-z], [A-Z], [0-9] and spaces#
            Then I should see "<field>" maximum allowed characters
            When I set <field> to value "<value>"
            Then I get the error message as "Please provide a postcode."
            And field should auto capitalize all alphabets entered
            Examples:
              |field|length|value|
              |postcode| 10 |    |
              |postcode|6 |ha0 3pb|

