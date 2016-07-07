@DR-596 @pass
Feature: Validation Improvements on Create Trainer Form

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then the system will load the trainer form where I can create a new trainer record

  Scenario Outline: Verify fields max and min characters allowed on create trainers page
    When I enter the <field> with <length> characters
    Then I should see maximum allowed characters in for <field> is <max length>
    Examples:
      | field                   | max length | length |
      | Username                | 70         | 80     |
      | First Name              | 50         | 90     |
      | Last Name               | 50         | 100    |
      | Known As                | 50         | 100    |
      | Primary Phone Number    | 50         | 100    |
      | Secondary Phone Number  | 10         | 100    |
      | Primary Email Address   | 255        | 300    |
      | Secondary Email Address | 255        | 300    |
      | Address                 | 255        | 300    |
      | Town                    | 60         | 300    |


  Scenario Outline: Verify Trainer field validations on create trainers page
    When I enter <field> to value <value>
    Then I should see "<validation requirements>" message against that field
    Examples:
      | field                   | value      | validation requirements                                                        |
#      | Username                |            | Please provide a username.                                                     |
      | Username                | Test       | Sorry, the username is already taken. Please try a different username.         |
      | Username                | ngu        | Sorry, the username must be at least 4 characters long.                        |
      | Username                | T$%@!      | Sorry, the username can only contain numbers, letters, dashes and underscores. |
      | Trainer Id              |            | Please provide a trainer id.                                                   |
      | Trainer Id              | 014578     | Sorry, the trainerId cannot start with zero.                                   |
      | Trainer Id              | 16789      | Sorry, the trainerId must be 6 numbers long.                                   |
      | Trainer Id              | @#*&%$     | Sorry, the trainerid must be a number.                                         |
      | First Name              |            | Please provide a first name.                                                   |
      | Last Name               |            | Please provide a last name.                                                    |
      | Primary Phone Number    |            | Please provide a phone number.                                                 |
      | Primary Phone Number    | T$%@!      | Sorry, the phone number must be at least 10 digits long.                       |
      | Secondary Phone Number  | 0788       | Sorry, the phone number must be at least 10 digits long.                       |
      | Primary Email Address   |            | Please provide an email address.                                               |
      | Primary Email Address   | test.com   | Please provide a valid email address.                                          |
      | Secondary Email Address | test+co&uk | Please provide a valid email address.                                          |
      | Address                 |            | Please provide an address.                                                     |
      | Town                    |            | Please provide a town.                                                         |
      | Postcode                |            | Please provide a postcode.                                                     |
      | Postcode                | ha9 445    | Please provide a valid postcode.                                               |


