@DR-135
Feature: Request Password Reset (Forgot Password)
  As a user,
  I want to be able to request a password reset/change,
  so that I can gain access to system when I have forgotten my password.

  Background:
    Given that I have licence.ndors.org.uk page opened
    Given I am on the login page
    And I see "Forgot Your Password" link  on the login page

  @forgot_password_page
  Scenario: Verify the Forgot password page and info text when requested for password reset
    When I click "Forgot Your Password?"
    Then I will be directed to "Forgot your password?" page
    And I should see the message as "Please enter your username and email address linked to your account to request a password reset. If you have any issues with this, please contact your local administrator, Service Desk or the NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    And I click Logo to come out from that page

  @verify_blank_fields
  Scenario Outline: Verify the validation messages when the fields are blank one at a time
    And I click "Forgot Your Password?"
    And I will be directed to "Forgot your password?" page
    When I leave the "<field>" blank
    And Enter remaining field leaving the "<field>"
    When I click "Reset Password"
    Then I see a valiadation message displayed "<Validation Message>" against the field
    And I will remain on the same page

    Examples:
      | field    | Validation Message               |
      | Username | Please provide a username.       |
      | Email    | Please provide an email address. |

  @invalid_email_format
  Scenario: Verify the validation message when invalid email address is entered
    And I click "Forgot Your Password?"
    And I will be directed to "Forgot your password?" page
    When I enter valid "Username"
    And I enter Invalid "Email" format
    And I click "Reset Password"
    Then I see a valiadation message displayed "Please provide a valid email address." against the field
    And I will remain on the same page

  @record_does'nt_match
  Scenario: Verify the message when the entered user details does'nt match against the record
    And I click "Forgot Your Password?"
    And I will be directed to "Forgot your password?" page
    When I enter "<field>" which does'nt match
    And Enter remaining field with valid matching record
    When I lcick "Reset Password"
    Then I should see the message as "If the details you entered are correct, you will receive an email shortly with instructions to reset your password. If you do not receive the email, try requesting a password reset again using the 'Forgot Your Password?' feature. Alternatively, you can contact your local administrator or Support Desk."









