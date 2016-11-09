#@DR-380
#  Feature: DR-380 Trainer recieves an email after creating an account
#    As a Trainer user of Licence Portal,
#    I want to receive an email after an account has been created for me,
#    so that I can set a password and complete creation of their account.
#
#    Background:
#      Given I have deleted all the emails in the test email inbox
#      Given that I have licence.ndors.org.uk page opened
#      And I login as an "Compliance Manager"
#      And I navigate to "TRAINERS" page
#      And I fill Mandatory fields with required details on create trainer form
#      When I click "Create Trainer"
#      Then I see the message "New trainer successfully created" after assessor creation
#
#    @auto_email_trainer @nologout
#    Scenario Outline: Verify the auto email genereation after creating an assessor
#      And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"
#      And I come back to Trainers portal and I logout
#
#      Examples:
#
#        | Subject                              | Email Body                                                                                                                                                                                                                              |
#        | New account created for you on DORS+ | A new account has been created for you on DORS+ system; the username for which will be communicated to you separately. Please use the link below to set a password for your account following which you will be able to use the system. |
#
#    @link_validity_trainer @nologout
#    Scenario Outline:  Verify the validity of the link generated following assessor account creation
#      And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"
#      And The link will include a crypt nonce making it difficult to guess
#      And The link will be  valid for 48 hours from the point of email send timestamp
#      And I come back to Trainers portal and I logout
#
#      Examples:
#
#        | Subject                              | Email Body                                                                                                                                                                                                                              |
#        | New account created for you on DORS+ | A new account has been created for you on DORS+ system; the username for which will be communicated to you separately. Please use the link below to set a password for your account following which you will be able to use the system. |
#
