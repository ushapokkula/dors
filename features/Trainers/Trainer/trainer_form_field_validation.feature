@DR-596
Feature: Validation Improvements on Create and Update Trainer Forms

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance manager"
    And I navigate to "TRAINERS" page
    Then the system will load the trainer form where I can create a new trainer record

    Scenario Outline: verify fields max and min characters allowed on create trainers page
      When I enter the "<field>" with "<length>" characters
      Then I should see "<field>" field allowed maximum "<count>" chars
      #Then I should see minimum length of the <field>

      Examples:
         |field                 |length  |count |
         |Username              |70      |      |
         |Username              |  4     |      |
         |First Name            |  50    |      |
         |Last Name             |  50    |      |
         |Known As              |   50   |      |
         |primary phone number  |  50    |      |
         |secondary phone number| 10     |      |
         |primary email address |255     |      |
         |secondary email address| 255   |      |
         |Address                | 256   |      |
#        |Town                   | 60    |      |              //* Letters, space and - , . ; ' & / . ( )
#        |Postcode               | 10    |      |                  //*[a-z], [A-Z], [0-9] and spaces*/



  Scenario Outline: verify Trainer field validations on create trainers page
    When I set "<field>" to value "<value>"
    Then I should see "<validation requirements>" message against that field
    Examples:
        |field                 | value              |validation requirements                                                       |
        |Username              | empty              |Please provide a username.                                                    |
        |Username              | Test               |Sorry, the username is already taken. Please try a different username.        |
        |Username              | a1@                |Sorry, the username must be at least 4 characters long.                       |
        |Username              |!"£$%^&*({@:~#;']=?>|Sorry, the username can only contain numbers, letters, dashes and underscores.|
        |Trainer Id            | empty              |Please provide a trainer id.                                                  |
        |Trainer Id            | 014578             |Sorry, the trainerId cannot start with zero.                                  |
        |Trainer Id            | 16789              |Sorry, the trainerId must be 6 numbers long.                                  |
        |Trainer Id            | @#*&%$             |Sorry, the trainerid must be a number.                                        |
        |First Name            | empty              |Please provide a first name.                                                  |
        |Last Name             | empty              |Please provide a last name.                                                   |
        |Primary Phone Number  | empty              |Please provide a phone number.                                                |
        |Primary Phone Number  | !"£$%^&*(          |Sorry, the phone number must be at least 10 digits long.                      |
        |Secondary Phone Number|0788                |Sorry, the phone number must be at least 10 digits long.                      |
        |Primary Email Address  | empty             |Please provide an email address.                                              |
        |Primary Email Address  |test.com           |Please provide a valid email address.                                         |
        |Secondary Email Address|test+co&uk         |Please provide a valid email address.                                         |
        |Address                | empty             |Please provide an address.                                                    |
        |Town                   | empty             |Please provide a town.                                                        |
        |Postcode               | empty             |Please provide a postcode.                                                    |
        |Postcode               | ha9 445           |Please provide a valid postcode.                                              |


