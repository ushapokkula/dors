Feature: Trainer Login
  As a Trainer,
  I want to be able to login to the system,
  so that I can access system functionalities and carry out my job operations.

  Scenario 1: Trainer with valid Login Details

    Given that I have logged into trainers.ndors.org.uk
    When I enter valid username
    And I enter valid password
    And click Login
    Then I will be granted access to the system

  Scenario 2: Trainer with valid Username and Invalid Password

    Given that I have logged into trainers.ndors.org.uk
    When I enter valid username
    And I enter Invalid password
    And click Login
    And I see a message "Your login credentials are invalid. Please try again with correct login credentials."
    Then I will not be granted access to the system

  Scenario: Trainer with Invalid username/user does'nt exist and valid Password

    Given that I have logged into trainers.ndors.org.uk
    When I enter Invalid username
    And I enter valid password
    And click Login
    And I see a message "Your login credentials are invalid. Please try again with correct login credentials."
    Then I will not be granted access to the system

   Scenario: Verify Login by entering only username
     Given that I have logged into trainers.ndors.org.uk
     When I enter only username
     And click Login
     Then I see a message "Please provide a password."

  Scenario: Verify Login by entering only password
    Given that I have logged into trainers.ndors.org.uk
    When I enter only password
    And click Login
    Then I see a message "Please provide a username."

  Scenario: Verify Login without entering username and password
    Given that I have logged into trainers.ndors.org.uk
    And click Login
    Then I see a message "Please provide a username."
    And I see a message "Please provide a password."

  Scenario: Account locked for five unsuccessfull attempts

   Given that I have logged into trainers.ndors.org.uk
   When I make three failed login attempts
   Then my account will be locked and I will be shown a message, "Your login credentials are invalid. Please try again with correct login credentials."


