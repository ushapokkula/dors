@DR-45
Feature:
  As an Assessor,
  I want to be able to set a password for my new account and complete its creation,
  so that I can login and use the system to perform my day to day operations.

  Background:
    Given that I have licence.ndors.org.uk page opened

  @verify_the_welcome_page
  Scenario Outline: Verify the welcome page after clicking the password link
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"
    And The link will include a crypt nonce making it difficult to guess
    And The link will be  valid for 48 hours from the point of email send timestamp
    When I click the link generated in the email to set password
    Then I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."

    Examples:

      | Subject                              | Email Body                                                                                                                                                                                                                              |
      | New account created for you on DORS+ | A new account has been created for you on DORS+ system; the username for which will be communicated to you separately. Please use the link below to set a password for your account following which you will be able to use the system. |

  @successfully_set_password
  Scenario: Assessor sucessfully sets the password

    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address
    And The link will include a crypt nonce making it difficult to guess
    And The link will be  valid for 48 hours from the point of email send timestamp
    And I click the link generated in the email to set password
    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    When I enter Username
    And  I enter Email
    And  Enter Password and Confirm Password
    And When the password and confirm password both match
    When I click "Create Account"
    Then I see a success message displayed as "Password has been set on your account and you can now login to the system"

  @username_does'nt_match
  Scenario: Verify the validation message when the username does'nt match with assessor record created

    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address
    And I click the link generated in the email to set password
    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    When I enter the Username which does'nt match against the record created
    And I enter Email
    And  Enter Password and Confirm Password
    And When the password and confirm password both match
    When I click "Create Account"
    Then I see a valiadation message displayed as "Sorry, your username or email is incorrect."

  @email_does'nt_match
  Scenario: Verify the validation message when the email does'nt match with assessor record created

    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address
    And I click the link generated in the email to set password
    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    And I enter Username
    When I enter the Email which does'nt match against the record created
    And  Enter Password and Confirm Password
    And When the password and confirm password both match
    When I click "Create Account"
    Then I see a valiadation message displayed as "Sorry, your username or email is incorrect."

  @invalid_email
  Scenario: Verify the validation message when the email format is Invalid

    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address
    And I click the link generated in the email to set password
    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    And I enter Username
    And I enter email which has invalid format
    Then I see a valiadation message displayed as "Please provide a valid email address."

  @password_mismatch
  Scenario: Verify the validation message when the password and confirm password fields does'nt match

    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address
    And The link will include a crypt nonce making it difficult to guess
    And The link will be  valid for 48 hours from the point of email send timestamp
    And I click the link generated in the email to set password
    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    And I enter Username
    And  I enter Email
    When I enter password and confirm password which does'nt match
    And I click "Create Account"
    Then I see a valiadation message displayed as "Sorry, the passwords do not match. Please retype the password."

  @password_does'nt_meet_policy
  Scenario: Verify the validation message when the password  does'nt meet policy requirements
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And I fill all assessor fields on the create assessor form
    And I click "Create Assessor"
    And I see the message "New assessor successfully created" after assessor creation
    And I see that the email is generated and sent to the registered email address
    And The link will include a crypt nonce making it difficult to guess
    And The link will be  valid for 48 hours from the point of email send timestamp
    And I click the link generated in the email to set password
    And I will be shown a welcome page with the message "Please enter the username provided to you, the email address linked to your account and set a password to complete your profile. If you have any issues with this, please contact NDORS Compliance Unit by emailing corporate.compliance@ndors.co.uk."
    And I enter Username
    And  I enter Email
    When I enter the password which does'nt meet password policy requirements
    Then I see a valiadation message displayed as "Sorry, the password does not meet the policy requirements."
    #And I will be shown password policy requirements to set the password

















