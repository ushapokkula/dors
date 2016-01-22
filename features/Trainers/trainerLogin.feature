Feature: Trainer Login
  As a Trainer,
  I want to be able to login to the system,
  so that I can access system functionalities and carry out my job operations.

  Scenario 1: Trainer with valid Login Details

    Given that I have logged into trainers.ndors.org.uk
    When I enter my username and password
    And click Login
    And my login credentials are valid
    Then I will be granted access to the system
    And the homepage for Trainers will be displayed

  Scenario 2: Trainer with valid Username and Invalid Password

    Given that I have logged into trainers.ndors.org.uk
    When I enter my valid username and invalid password
    And click Login
    And my login credentials are invalid or the username does not exist
    Then I will not be granted access to the system
    And and error message will be displayed, "Your login credentials are invalid. Please try again with correct login credentials."

  Scenario: Trainer with Invalid username and valid Password

    Given that I have logged into trainers.ndors.org.uk
    When I enter my Invalid username and valid password
    And click Login
    And my login credentials are invalid or the username does not exist
    Then I will not be granted access to the system
    And and error message will be displayed, "Your login credentials are invalid. Please try again with correct login credentials."

    Scenario: Account locked for three unsuccessfull attempts

      Given that I have logged into trainers.ndors.org.uk

      When I make three failed login attempts
    Then my account will be locked and I will be shown a message, "Please contact Service Desk for assistance"