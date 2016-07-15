@DR-894 @DR-788 @DR-893 @DR-892 @pass
  Feature:Trainer NDORS Licence Agreement

    @DR-894
    Scenario: CCU/NGU Verifys Trainer Licence Agreement default option (Unspecified)
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      And I will see a 'Licence Agreement' field on the trainer form

    @DR-894
    Scenario: CCU/NGU Verifys Trainer record 'Licence Agreement' field (Unspecified)readonly status
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      And I see 'Licence Agreement' field will be set to Unspecified by default
      And 'Licence Agreement' field will be disabled or read-only

    @DR-788
    Scenario: CCU/NGU Verifys Trainer 'Licence Agreement' options
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      Then I fill Mandatory fields with required details on create trainer form
      And I click on Create Trainer button
      Then a Success message will be displayed for Create Trainer "New trainer successfully created."
      And the 'Licence Agreement' will be shown as Unspecified
      And 'Licence Agreement' field will have three possible options
        |Accepted   |
        |Rejected   |
        |Unspecified|

    @DR-788
    Scenario: CCU/NGU loads the Licence Agreement on a trainer record
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      And search for trainer "123458"
      Then the system will load the trainer record in edit or update mode
      And the 'Licence Agreement' will be shown as Unspecified
      And 'Licence Agreement' field will have three possible options
        |Accepted   |
        |Rejected   |
        |Unspecified|


    @DR-892 @DR-894
    Scenario: Trainer's first logon to Licence Portal,keep Licence Agreement as Unspecified and Accepts agreement
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      Then I see 'Status' field default value set to 'Active'
      And the 'Licence Agreement' will be shown as Unspecified
      And search for trainer "888889"
      When I see 'Licence Agreement' field
      And I change 'Licence Agreement' to 'Unspecified'
      And I click "Update Trainer"
      Then I logout
      And I login as an "Trainer4"
      Then I see licence agreement text with an option to Accept or Reject
      And I will not have access to any other system resources
      When I click "Accept"
      Then I will be redirected to My Licences page


    @DR-892 @DR-894
    @nologout
    Scenario:  Trainer's first logon to Licence Portal,keep Licence Agreement as Unspecified and close the browser
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      Then I see 'Status' field default value set to 'Active'
      And the 'Licence Agreement' will be shown as Unspecified
      And search for trainer "888889"
      When I see 'Licence Agreement' field
      And I change 'Licence Agreement' to 'Unspecified'
      And I click "Update Trainer"
      Then I logout
      And I login as an "Trainer4"
      Then I see licence agreement text with an option to Accept or Reject
      And I close the browser window
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Trainer4"
      Then I see licence agreement text with an option to Accept or Reject


    @DR-892 @DR-894
    @nologout
    Scenario:  Trainer's first logon to Licence Portal,keep Licence Agreement as Unspecified and access any URL
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      Then I see 'Status' field default value set to 'Active'
      And the 'Licence Agreement' will be shown as Unspecified
      And search for trainer "888889"
      When I see 'Licence Agreement' field
      And I change 'Licence Agreement' to 'Unspecified'
      And I click "Update Trainer"
      Then I logout
      And I login as an "Trainer4"
      Then I see licence agreement text with an option to Accept or Reject
      When I access any other system resource(using URL)
      Then I will be redirected to Licence Agreement screen

    @DR-894
    Scenario: Trainer does not see Licence Agreement on their Trainer Profile
      Given that I have licence.ndors.org.uk page opened
       When I login as an "Trainer1"
       Then I navigate to "MY PROFILE" page
       And I will not see 'Licence Agreement' field on my profile page

    @DR-894
    Scenario Outline: CCU/NGU updates the Licence Agreement on a trainer record
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      When search for trainer "888889"
      Then the system will load the trainer record in edit or update mode
      When I set trainer Licence Agreement to <agreement_status> value
      And I set Status field to Inactive value
      And I click "Update Trainer"
      Then I will see a Inactive Trainer message with text, "<confirmation_message>"
      When I click "Yes"
      Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
      And I can see Status field value changes to Inactive
      And I can see updated Licence Agreement as "<agreement_status>"
      Then I will remain on Update Trainers form
       Examples:
      |agreement_status| confirmation_message                             |
      |Accepted        |Setting the status of this trainer to Inactive will invalidate their licences and they will lose access to DORS+ system.|
      |Unspecified     |Setting the status of this trainer to Inactive will invalidate their licences and they will lose access to DORS+ system.|


    @DR-788
    Scenario Outline: CCU/NGU updates the Licence Agreement on a trainer record as Accepted or Unspecified
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      And search for trainer "123987"
      When I set trainer Licence Agreement to <agreement_status> value
      Then I see the Status field will be in enabled
      And I click "Update Trainer"
      Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
      And I can see updated Licence Agreement as "<agreement_status>"
      And I can see the last changed details with user fullname and updated date
      Examples:
      |agreement_status|
      |Accepted   |
      |Unspecified|


      @DR-788
      Scenario Outline: CCU/NGU updates the Licence Agreement on a trainer record as Rejected
        Given that I have licence.ndors.org.uk page opened
        When I login as an "Compliance Manager"
        Given I have licence agreement as "Unspecified" for trainer Id "821578"
        #Then I navigate to "TRAINERS" page
        #And search for trainer "821578"
        When I set trainer Licence Agreement to <agreement_status> value
        Then the Status field will be set to Inactive and disabled on the UI
        And I click "Update Trainer"
        Then I will see a Inactive Trainer message with text, "<confirmation_message>"
        When I click "No"
        Then the message will close and no further action will be taken
        And I click "Update Trainer"
        Then I will see a Inactive Trainer message with text, "<confirmation_message>"
        When I click "Yes"
        Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
        And I can see updated Licence Agreement as "<agreement_status>"
        And I can see the last changed details with user fullname and updated date
        Examples:
         |agreement_status|confirmation_message|
         |Rejected        |You are marking the trainer's licence agreement as Rejected which will also inactivate their account. This will invalidate their licences and they will lose access to DORS+ system. Are you sure you want to continue?|


      @DR-893
      Scenario Outline: CCU marks a Trainer's Licence Agreement as Rejected
        Given that I have licence.ndors.org.uk page opened
        When I login as an "Compliance Manager"
        #Given I have licence agreement as "Unspecified" for trainer Id "888889"
        Then I navigate to "TRAINERS" page
        And search for trainer "888889"
        Then the system will load the trainer record in edit or update mode
        When I set trainer Licence Agreement to <agreement_status> value
        Then the Status field will be set to Inactive and disabled on the UI
        And I click "Update Trainer"
        Then I will see a Inactive Trainer message with text, "<confirmation_message>"
        When I click "Yes"
        Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
        And the status of every "<Licences>" changed to 'Surrendered'
        And the expiry date of every licence changed to 'system date'
        Examples:
        |agreement_status|Licences               |confirmation_message|
        |Rejected        | Provisional/Conditional|You are marking the trainer's licence agreement as Rejected which will also inactivate their account. This will invalidate their licences and they will lose access to DORS+ system. Are you sure you want to continue?|


    @DR-893
    Scenario Outline: Trainer's rejects licence agreement
      Given that I have licence.ndors.org.uk page opened
       When I login as an "Compliance Manager"
       Then I navigate to "TRAINERS" page
       And search for trainer "888889"
       Then the system will load the trainer record in edit or update mode
       When I see 'Licence Agreement' field
       And I change 'Licence Agreement' to 'Unspecified'
      And I set Status field to Active value
       And I click "Update Trainer"
       And I logout
       When I login as an "Trainer4"
       When I see licence agreement text with an option to Accept or Reject
       Then I click "Reject"
       Then I see a Reject Licence Agreement "<Message>"
       When I click "Yes"
       And I will be logged out
       Then I will be redirected to login page
       When I login as an "Compliance Manager"
       Then I navigate to "TRAINERS" page
       And search for trainer "888889"
       Then the Status field will be set to Inactive and disabled on the UI
       And I can see updated Licence Agreement as "<agreement_status>"
       And the status of every "<Licences>" changed to 'Surrendered'
       And the expiry date of every licence changed to 'system date'
      Examples:
        |agreement_status|Licences                 |Message|
        |Rejected        | Provisional/Conditional |Rejecting this Licence Agreement will invalidate your licences, deactivate your account and you won't be able to access the DORS+ Licence Portal. Are you sure you want to continue?|


