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
    Then I see a validation message displayed "Please provide a valid email address." against the field
    And I will remain on the same page

  @username_does'nt_match
  Scenario Outline: Verify the message when the entered email does'nt match against the record
    And I click "Forgot Your Password?"
    And I will be directed to "Forgot your password?" page
    When I enter "<Matching Username>" as "Username"
    And I enter "<Non Matching Email>" as "Email"
    And I click "Reset Password"
    And I will be re-directed to login page
    Then I should see the message as "If the details you entered are correct, you will receive an email shortly with instructions to reset your password. If you do not receive the email, try requesting a password reset again using the 'Forgot Your Password?' feature. Alternatively, you can contact your local administrator or Support Desk."

    Examples:
      | Matching Username | Non Matching Email |
      | sudiv             | swapna@gmail.com   |

  @email_does'nt_match
  Scenario Outline: Verify the message when the entered username  does'nt match against the record
    And I click "Forgot Your Password?"
    And I will be directed to "Forgot your password?" page
    When I enter "<Non Matching Username>" as "Username"
    And I enter "<Matching Email>" as "Email"
    And I click "Reset Password"
    And I will be re-directed to login page
    Then I should see the message as "If the details you entered are correct, you will receive an email shortly with instructions to reset your password. If you do not receive the email, try requesting a password reset again using the 'Forgot Your Password?' feature. Alternatively, you can contact your local administrator or Support Desk."

    Examples:
      | Non Matching Username | Matching Email        |
      | swap_xxx              | swapna.gopu@wtg.co.uk |

  @success_reset_pwd
  Scenario Outline: Verify the message after successfully requesting reset password with valid details
    And I click "Forgot Your Password?"
    And I will be directed to "Forgot your password?" page
    When I enter "<Matching Username>" as "Username"
    And I enter "<Matching Email>" as "Email"
    And I click "Reset Password"
    And I will be re-directed to login page
    Then I should see the message as "If the details you entered are correct, you will receive an email shortly with instructions to reset your password. If you do not receive the email, try requesting a password reset again using the 'Forgot Your Password?' feature. Alternatively, you can contact your local administrator or Support Desk."

    Examples:
      | Matching Username | Matching Email        |
      | sudiv             | swapna.gopu@wtg.co.uk |

  @verify_email_subject_body
  Scenario Outline: Verify the email subject and body after clicking reset password button
    And I click "Forgot Your Password?"
    And I will be directed to "Forgot your password?" page
    When I enter "<Matching Username>" as "Username"
    And I enter "<Matching Email>" as "Email"
    When I click "Reset Password"
    And I will be re-directed to login page
    And I should see the message as "If the details you entered are correct, you will receive an email shortly with instructions to reset your password. If you do not receive the email, try requesting a password reset again using the 'Forgot Your Password?' feature. Alternatively, you can contact your local administrator or Support Desk."
    Then I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"

    Examples:

      | Matching Username | Matching Email        | Subject               | Email Body                                                                                                                                                                                                                                     |
      | sudiv             | swapna.gopu@wtg.co.uk | DORS+: Reset Password | You requested to reset the password for your account on the DORS+ system. Please follow the link below to set a new password and gain access to the system. Please note that this link is only valid for 60 minutes and can only be used once. |







  @changed_pwd_within_24_hrs
  Scenario: Verify the message when password is changed within 24 hours
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address
    And I click the link generated in the email to set password
    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    And I enter Username
    And  I enter Email
    And I enter Password
    And I enter Confirm Password
    And When the password and confirm password both match
    And I click "Create Account"
    And I see a success message displayed as "Password has been set on your account and you can now login to the system"
    And I click "Forgot Your Password?"
    And I enter Username
    And  I enter Email
    When I click "Reset Password"
    Then I should see the message as "If the details you entered are correct, you will receive an email shortly with instructions to reset your password. If you do not receive the email, try requesting a password reset again using the 'Forgot Your Password?' feature. Alternatively, you can contact your local administrator or Support Desk."











