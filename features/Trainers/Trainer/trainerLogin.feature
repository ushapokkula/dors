@pass
Feature:  Login
  As a User,
  I want to be able to login to the system,
  so that I can access system functionalities and carry out my job operations.

  @login1
  Scenario: Verify the login when assessor tries to login with valid credentials

    Given that I have licence.ndors.org.uk page opened
    When I enter valid "Assessor" username
    And I enter valid "Assessor" password
    And click Sign in
    Then I will be granted access to the system

  @login2 @nologout
  Scenario: Verify the login when assessor tries to login with valid credentials

    Given that I have licence.ndors.org.uk page opened
    When I enter valid "Assessor" username
    And I enter Invalid assessor password
    And click Sign in
    And I see this message "Your login credentials are invalid. Please try again with correct login credentials." on the page
    Then I will not be granted access to the system

  @login3 @nologout
  Scenario: Trainer with Invalid username and valid Password

    Given that I have licence.ndors.org.uk page opened
    When I enter Invalid assessor username
    And I enter valid "Assessor" password
    And click Sign in
    And I see a message "Your login credentials are invalid. Please try again with correct login credentials."
    Then I will not be granted access to the system

  @login4 @nologout
  Scenario: Verify Login by entering only username

    Given that I have licence.ndors.org.uk page opened
    When I enter valid "Assessor" username
    And click Sign in
    Then I see a message "Please provide a password."

  @login5 @nologout
  Scenario: Verify Login by entering only password

    Given that I have licence.ndors.org.uk page opened
    And I enter valid "Assessor" password
    And click Sign in
    Then I see a message "Please provide a trainer licence number."

  @login6 @nologout
  Scenario: Verify Login without entering username and password

    Given that I have licence.ndors.org.uk page opened
    And click Sign in
    Then I see a message "Please provide a trainer licence number."
    And I see a message "Please provide a password."

#  @login7 @manual
#  Scenario: Account locked for five unsuccessfull attempts
#
#    Given that I have licence.ndors.org.uk page opened
#    When I make five failed login attempts as "Assessor"
#    And I enter valid "Assessor" credentials
#    Then My account will be locked and I will be shown a message, "Your login credentials are invalid. Please try again with correct login credentials."

  @login8 @DR-551
  Scenario Outline: Verify the logged in name is displayed with fullname
    Given that I have licence.ndors.org.uk page opened
    When I login as an "<user>"
    Then I see that the "<user>" full name is displayed as "You are logged in as" and first and last name

    Examples:
      | user     |
      | Assessor |
      | Trainer2 |














