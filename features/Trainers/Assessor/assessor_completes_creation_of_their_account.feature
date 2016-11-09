#@DR-45
#Feature: Assessor Creates Their Account
#  As an Assessor,
#  I want to be able to set a password for my new account and complete its creation,
#  so that I can login and use the system to perform my day to day operations.
#
#  Background:
#    Given I have deleted all the emails in the test email inbox
#    Given that I have licence.ndors.org.uk page opened
#
#  @verify_the_welcome_page @nologout
#  Scenario Outline: Verify the welcome page after clicking the password link
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"
#    When I click the link generated in the email to set password
#    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#
#
#    Examples:
#
#      | Subject                              | Email Body                                                                                                                                                                                                                              |
#      | New account created for you on DORS+ | A new account has been created for you on DORS+ system; the username for which will be communicated to you separately. Please use the link below to set a password for your account following which you will be able to use the system. |
#
#  @successfully_set_password @nologout
#  Scenario: Assessor successfully sets the password
#
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    When I enter Trainerlicencenumber
#    And  I enter Email
#    And I enter Password
#    And I enter Confirm Password
#    And When the password and confirm password both match
#    When I click "Create Account"
#    Then I see a success message displayed as "Password has been set on your account and you can now login to the system"
#
#
#  @username_does'nt_match @nologout
#  Scenario: Verify the validation message when the username does'nt match with assessor record created
#
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    When I enter the Username which does'nt match against the record created
#    And I enter Email
#    And I enter Password
#    And I enter Confirm Password
#    And When the password and confirm password both match
#    When I click "Create Account"
#    Then I see a validation message displayed as "Sorry, your username or email is incorrect."
#
#
#  @email_does'nt_match @nologout
#  Scenario: Verify the validation message when the email does'nt match with assessor record created
#
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    When I enter the Email which does'nt match against the record created
#    And I enter Password
#    And I enter Confirm Password
#    And When the password and confirm password both match
#    When I click "Create Account"
#    Then I see a validation message displayed as "Sorry, your username or email is incorrect."
#
#  @invalid_email @nologout
#  Scenario: Verify the validation message when the email format is Invalid
#
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    And I enter email which has invalid format
#    And I enter Password
#    And I enter Confirm Password
#    Then I see a validation message displayed as "Please provide a valid email address."
#
#  @password_mismatch @nologout
#  Scenario: Verify the validation message when the password and confirm password fields does'nt match
#
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    And  I enter Email
#    And I enter Password
#    When I enter confirm password which does'nt match with password
#    And I click "Create Account"
#    Then I see a validation message displayed as "Sorry, the passwords do not match. Please retype the password."
#
#  @password_does'nt_meet_policy @nologout
#  Scenario: Verify the validation message when the password  does'nt meet policy requirements
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#    And I enter Username
#    And  I enter Email
#    When I enter the password which does'nt meet password policy requirements
#    And I enter Confirm Password
#    Then I see a validation message displayed as "Sorry, the password does not meet the policy requirements."
#    #And I will be shown password policy requirements to set the password
#
#  @link_expiry @nologout
#  Scenario: Verify the link expiry
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
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
#
#  @blank_fields @nologout
#  Scenario Outline: Verify the validation messages when the fields are blank on signup page
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    And I click "Create Assessor"
#    And I see the message "New assessor successfully created" after assessor creation
#    And I see that the email is generated and sent to the registered email address
#    And I click the link generated in the email to set password
#    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk"
#    Then I set the mandatory field "<Mandatory>" as blank
#    Then I see a validation message displayed as "<Error Messages>"
#
#    Examples:
#      | Mandatory        | Error Messages                   |
#      | Username         | Please provide a username.       |
#      | Email            | Please provide an email address. |
#      | Password         | Please provide a password.       |
#      | Confirm Password | Please confirm the password.     |
#
#
#   @password_field_length_negative_validation @nologout
#   Scenario:  Verify the password field length validation
#     And I login as an "Compliance Manager"
#     And I navigate to "ASSESSORS" page
#     And I fill all assessor fields on the create assessor form
#     And I click "Create Assessor"
#     And I see the message "New assessor successfully created" after assessor creation
#     And I see that the email is generated and sent to the registered email address
#     And I click the link generated in the email to set password
#     When I enter the password less than minimum limit
#     Then I see a validation message displayed as "Sorry, the password does not meet the policy requirements."
#     And I refresh the page
#     When I enter the password more than than the maximum limit
#     Then The field is restricted to 26 characters
#
#
#   @password_containing_username @nologout
#   Scenario: Verify the validation when the password entered contains morethan 2 consecutive chrs of username
#     And I login as an "Compliance Manager"
#     And I navigate to "ASSESSORS" page
#     And I fill all assessor fields on the create assessor form
#     And I click "Create Assessor"
#     And I see the message "New assessor successfully created" after assessor creation
#     And I see that the email is generated and sent to the registered email address
#     And I click the link generated in the email to set password
#     And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing ndors.admin@ndors.co.uk."
#     When I enter the password containing more than two consecutive chars of Username
#     Then I see a validation message displayed as "Sorry, the password does not meet the policy requirements."
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
