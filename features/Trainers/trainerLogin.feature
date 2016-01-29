Feature:  Login
  As a User,
  I want to be able to login to the system,
  so that I can access system functionalities and carry out my job operations.

  @login1
  Scenario: Verify the login when assessor tries to login with valid credentials

    Given that I have logged into trainers.ndors.org.uk
    When I enter valid assessor username
    And I enter valid assessor password
    And click Sign in
    Then I will be granted access to the system

  @login2
  Scenario: Verify the login when assessor tries to login with valid credentials

    Given that I have logged into trainers.ndors.org.uk
    When I enter valid assessor username
    And I enter Invalid assessor password
    And click Sign in
    And I see a message "Your login credentials are invalid. Please try again with correct login credentials."
    Then I will not be granted access to the system

  @login3
  Scenario: Trainer with Invalid username/user does'nt exist and valid Password

    Given that I have logged into trainers.ndors.org.uk
    When I enter Invalid assessor username
    And I enter valid assessor password
    And click Sign in
    And I see a message "Your login credentials are invalid. Please try again with correct login credentials."
    Then I will not be granted access to the system

  @login4
   Scenario: Verify Login by entering only username

     Given that I have logged into trainers.ndors.org.uk
     When I enter only assessor username
     And click Sign in
     Then I see a message "Please provide a password."

  @login5
  Scenario: Verify Login by entering only password

    Given that I have logged into trainers.ndors.org.uk
    When I enter only assessor password
    And click Sign in
    Then I see a message "Please provide a username."

  @login6
  Scenario: Verify Login without entering username and password

    Given that I have logged into trainers.ndors.org.uk
    And click Sign in
    Then I see a message "Please provide a username."
    And I see a message "Please provide a password."

#  Scenario: Account locked for five unsuccessfull attempts
#
#   Given that I have logged into trainers.ndors.org.uk
#   When I make five failed login attempts
#   Then My account will be locked and I will be shown a message, "Your login credentials are invalid. Please try again with correct login credentials."


