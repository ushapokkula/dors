#@DR-170
#Feature: DR-170 ,DR-520
#
#  As an NGU (Compliance Manager/TrainingGovernance),
#  I want an email to be sent to the Assessor once I have created their account,
#  so that they can set a password and complete creation of their account.
#
#  Background:
#    Given I have deleted all the emails in the test email inbox
#    And that I have licence.ndors.org.uk page opened
#    And I login as an "Compliance Manager"
#    And I navigate to "ASSESSORS" page
#    And I fill all assessor fields on the create assessor form
#    When I click "Create Assessor"
#    Then I see the message "New assessor successfully created" after assessor creation
#
#  @auto_email_assessor @nologout
#  Scenario Outline: Verify the auto email genereation after creating an assessor
#    And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"
#
#
#    Examples:
#
#      | Subject                              | Email Body                                                                                                                                                                                                                              |
#      | New account created for you on DORS+ | A new account has been created for you on DORS+ system; the username for which will be communicated to you separately. Please use the link below to set a password for your account following which you will be able to use the system. |
#
#  @link_validity_assessor @nologout
#  Scenario Outline:  Verify the validity of the link generated following assessor account creation
#      And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>"
#      And The link will include a crypt nonce making it difficult to guess
#      And The link will be  valid for 48 hours from the point of email send timestamp
#
#
#    Examples:
#
#    | Subject                              | Email Body                                                                                                                                                                                                                              |
#    | New account created for you on DORS+ | A new account has been created for you on DORS+ system; the username for which will be communicated to you separately. Please use the link below to set a password for your account following which you will be able to use the system. |
#
#
