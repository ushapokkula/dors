#@manual
#@DR-44
#Feature: Trainer completes the creation of their account
#  As a Trainer,
#  I want to be able to set a password for my newly created account and complete its creation,
#  so that I can login and use the system to perform my day to day operations.
#
#  Background:
#    Given I have deleted all the emails in the test email inbox
#
#  @verify_the_welcome_page @nologout
#  Scenario Outline: Verify the welcome page after clicking the password link
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"
#    When I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I have deleted all the emails in the test email inbox
#    Examples:
#      | Subject                              | Email Body                                                                                                                                                                                                                              |
#      | New account created for you on DORS+ | A new account has been created for you on DORS+ system; the username for which will be communicated to you separately. Please use the link below to set a password for your account following which you will be able to use the system. |
#
#  @successfully_set_password @nologout
#  Scenario: Trainer successfully sets the password
#    Given that I have licence.ndors.org.uk page opened
#    When I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    When I enter Username
#    # change the step to When I enter the Username of the trainer created. same for email
#    And  I enter Email
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Password
#    And I enter Confirm Password
#    And When the password and confirm password both match
#    When I click "Create Account"
#    Then I see a success message displayed as "Password has been set on your account and you can now login to the system"
#    And I have deleted all the emails in the test email inbox
#
#  @username_does'nt_match @nologout
#  Scenario: Verify the validation message when the username doesn't match with trainer record created
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    When I enter the Username which does'nt match against the record created
#    And I enter Email
#    And I enter Password
#    And I enter Confirm Password
#    And When the password and confirm password both match
#    When I click "Create Account"
#    Then I see a validation message displayed as "Sorry, your username or email is incorrect."
#    And I have deleted all the emails in the test email inbox
#
#  @email_does'nt_match @nologout
#  Scenario: Verify the validation message when the email doesn't match with trainer record created
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    When I enter the Email which does'nt match against the record created
#    And I enter Password
#    And I enter Confirm Password
#    And When the password and confirm password both match
#    When I click "Create Account"
#    Then I see a validation message displayed as "Sorry, your username or email is incorrect."
#    And I have deleted all the emails in the test email inbox
#
#  @invalid_email @nologout
#  Scenario: Verify the validation message when the email format is Invalid
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    And I enter email which has invalid format
#    And I enter Password
#    And I enter Confirm Password
#    Then I see a validation message displayed as "Please provide a valid email address."
#    And I have deleted all the emails in the test email inbox
#
#  @password_mismatch @nologout
#  Scenario: Verify the validation message when the password and confirm password fields does'nt match
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    And  I enter Email
#    And I enter Password
#    When I enter confirm password which does'nt match with password
#    And I click "Create Account"
#    Then I see a validation message displayed as "Sorry, the passwords do not match. Please retype the password."
#    And I have deleted all the emails in the test email inbox
#
#  @password_does'nt_meet_policy @nologout
#  Scenario: Verify the validation message when the password  does'nt meet policy requirements
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    And  I enter Email
#    When I enter the password which does'nt meet password policy requirements
#    And I enter Confirm Password
#    Then I see a validation message displayed as "Sorry, the password does not meet the policy requirements."
#    #And I will be shown password policy requirements to set the password
#    And I have deleted all the emails in the test email inbox
#
#  @link_expiry @nologout
#  Scenario: Verify the link expiry
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    When I enter Username
#    And  I enter Email
#    And I enter Password
#    And I enter Confirm Password
#    And When the password and confirm password both match
#    And I click "Create Account"
#    And I see a success message displayed as "Password has been set on your account and you can now login to the system"
#    And I navigate to outlook web email
#    And I open the email which i have already used to set the password successfully
#    When I try to access the link again
#    Then I see this message on the page "This link has now expired and is not available. You can try to reset the password following the 'Forgot your password?' feature. If you are unable to access your account, please contact your Administrator or Service Desk for support."
#    And I have deleted all the emails in the test email inbox
#
#  @blank_fields @nologout
#  Scenario Outline: Verify the validation messages when the fields are blank on sign up page
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    Then I set the mandatory field "<Mandatory>" as blank
#    Then I see a validation message displayed as "<Error Messages>"
#    And I have deleted all the emails in the test email inbox
#    Examples:
#      | Mandatory        | Error Messages                   |
#      | Username         | Please provide a username.       |
#      | Email            | Please provide an email address. |
#      | Password         | Please provide a password.       |
#      | Confirm Password | Please confirm the password.     |
#
#  @password_field_length_negative_validation @nologout
#  Scenario:  Verify the password field length validation
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    When I enter the password less than minimum limit
#    Then I see a validation message displayed as "Sorry, the password does not meet the policy requirements."
#    And I refresh the page
#    When I enter the password more than than the maximum limit
#    Then The field is restricted to 26 characters
#    And I have deleted all the emails in the test email inbox
#
#  @password_containing_username @nologout
#  Scenario: Verify the validation when the password entered contains morethan 2 consecutive chrs of username
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "TRAINERS" page
#    And I fill Mandatory fields with required details on create trainer form
#    And I click "Create Trainer"
#    And I see the message "New trainer successfully created" after creating trainer
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    When I enter the password containing more than two consecutive chars of Username
#    Then I see a validation message displayed as "Sorry, the password does not meet the policy requirements."
#    And I have deleted all the emails in the test email inbox