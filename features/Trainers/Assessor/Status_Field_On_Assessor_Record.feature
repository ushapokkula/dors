@DR-738
Feature:Status Field on Assessor Record


  Scenario: NGU verifying status field while creating new Assessor
     Given that I have licence.ndors.org.uk page opened
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I fill all assessor fields on the create assessor form
     Then I see Assessor status set as 'Active' by default
     And status fields will be disabled

   Scenario: NGU can not create Assessor with 'Inactive' status
     Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I fill all assessor fields on the create assessor form
     Then I can not set status as 'Inactive'
     And 'Inactive' status field will be disabled

  Scenario Outline: When an NGU/CCU loads an existing Assessor record and verifying status field
    Given that I have licence.ndors.org.uk page opened
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I loads an existing "<Assessor>" record
     Then I should see the Assessor details
     Then status field will be editable
     And I update Assessor record
     Examples:
     |Assessor|
     |esx|

  @nologout
  Scenario Outline: When set to inactive by NGU/CCU; the Assessors cannot login to the system.
    Given that I have licence.ndors.org.uk page opened
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I loads an existing "<Assessor>" record
     Then I set status as 'Inactive'
     And I update Assessor record
     And I logout
     Then I login as an "Assessor5"
     Then will get the standard invalid credentials login failure message
     And message will appear as: "Your login credentials are invalid. Please try again with correct login credentials."
     Examples:
     |Assessor|
     |esx |

  @nologout
   Scenario Outline: When set to inactive by NGU/CCU; the Assessors cannot use the reset password function
     Given I have deleted all the emails in the test email inbox
    Given that I have licence.ndors.org.uk page opened
     Given I login as an "Assessor5"
     And I click "Forgot Your Password?"
     Then I will be re-directed to "Forgot your password?" page
     When I enter "<Matching Username>" as 'Username'
     Then I enter "<Matching Email>" as 'Email'
     And I click "Reset Password"
     And I will be re-directed to login page
     Then I should see the message as "If the details you entered are correct, you will receive an email shortly with instructions to reset your password. If you do not receive the email, try requesting a password reset again using the 'Forgot Your Password?' feature. Alternatively, you can contact your local administrator or Support Desk."
     And I should not see that the email generated and sent to the registered email address  with "<Subject>"
       Examples:
       | Matching Username | Matching Email            |Subject             |
       |  test738          | dors_test@outlook.com     |DORS+: Reset Password  |

  @nologout
    Scenario Outline: Edit assessor status
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      And I navigate to "ASSESSORS" page
      And I loads an existing "<Assessor>" record
      Then I set status as 'Active'
      And I update Assessor record
      And I logout
      Examples:
      |Assessor|
      |esx     |