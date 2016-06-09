@DR-738
Feature: Status Field on Assessor Record

  Background:
    #Given that I have licence.ndors.org.uk page opened

   Scenario: NGU verifying status field while creating new Assessor
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I fill all assessor fields on the create assessor form
     Then status set as 'Active' by default
     And status field will be disabled

   Scenario: NGU can not create Assessor with 'Inactive' status
    When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I fill all assessor fields on the create assessor form
     Then I can not set status as 'Inactive'
     And status field will be disabled

  Scenario Outline: When an NGU/CCU loads an existing Assessor record and verifying status field
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I loads an existing Assessor "<user>" record
     Then status field will be editable
    Examples:
     |user|
     |esx|

  Scenario Outline: When set to inactive by NGU/CCU; the Assessors cannot login to the system.
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSORS" page
     And I loads an existing Assessor "<user>" record
     Then I set status as 'Inactive'
     And I update Assessor record
     And I logout
     Then I login as an "Assessor5"
     Then will get the standard invalid credentials login failure message
     And message will appear as: "Your login credentials are invalid. Please try again with correct login credentials."
     Examples:
     |user|
     |esx |

   #Scenario Outline : When set to inactive by NGU/CCU; the Assessors cannot use the reset password function
