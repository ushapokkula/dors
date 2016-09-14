@DR-894 @DR-788 @DR-893 @DR-892 @pass
Feature:Trainer NDORS Licence Agreement

  @DR-894
  Scenario: CCU/NGU can see Licence Agreement on the trainer form
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I will see a 'Licence Agreement' field on the trainer form

  @DR-894
  Scenario: Licence Agreement field is disabled and unspecified by default for CCU/NGU
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I see 'Licence Agreement' field will be set to Unspecified by default
    And 'Licence Agreement' field will be disabled or read-only

  @DR-788
  Scenario: Newly created trainer's licence agreement is enabled and has 3 options to select and default is unspecified

    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I navigate to "TRAINERS" page
    Then I fill Mandatory fields with required details on create trainer form
    And I click on Create Trainer button
    Then a Success message will be displayed for Create Trainer "New trainer successfully created."
    And the 'Licence Agreement' will be shown as Unspecified
    And 'Licence Agreement' field will have three possible options
      | Accepted    |
      | Rejected    |
      | Unspecified |

  @DR-788
  Scenario: Search an existing trainer and verify it is editable by CCU/NGU user
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I navigate to "TRAINERS" page
    And search for trainer "123458"
    Then the system will load the trainer record in edit or update mode
    And the 'Licence Agreement' will be shown as Unspecified
    And 'Licence Agreement' field will have three possible options
      | Accepted    |
      | Rejected    |
      | Unspecified |


  @DR-892 @DR-894
  Scenario: Accept a trainer's licence agreement
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I navigate to "TRAINERS" page
    Then I see the "Status" field is set to "Active"
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
  Scenario:  Trainer sees the same licence agreement when he closes the browser when he doesn't accept or reject
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I navigate to "TRAINERS" page
    Then I see the "Status" field is set to "Active"
    And the 'Licence Agreement' will be shown as Unspecified
    And search for trainer "888889"
    When I see 'Licence Agreement' field
    And I change 'Licence Agreement' to 'Unspecified'
    And I click "Update Trainer"
    Then I logout
    And I login as an "Trainer4"
    Then I see licence agreement text with an option to Accept or Reject
    And I reset cookies
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Trainer4"
    Then I see licence agreement text with an option to Accept or Reject


  @DR-892 @DR-894 @nologout
  Scenario:  Trainer is redirected to the same licence agreement screen when he tries to access any other
  system resource url with out accepting or reject the agreement
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I navigate to "TRAINERS" page
    Then I see the "Status" field is set to "Active"
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
  Scenario Outline: CCU/NGU updates the Licence Agreement to Accepted and in-active status
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    And search for trainer "888889"
    And the system will load the trainer record in edit or update mode
    And I set trainer Licence Agreement to <agreement_status> value
    And I set Status field to Inactive value
    And I click "Update Trainer"
    Then I will see a Inactive Trainer message with text, "<confirmation_message>"
    When I click "Reject"
    Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I can see Status field value changes to Inactive
    And I can see updated Licence Agreement as "<agreement_status>"
    And I will remain on Update Trainers form
    Examples:
      | agreement_status | confirmation_message                                                                                                     |
      | Accepted         | Setting the status of this trainer to Inactive will invalidate their licences and they will lose access to DORS+ system. |
      | Unspecified      | Setting the status of this trainer to Inactive will invalidate their licences and they will lose access to DORS+ system. |


  @DR-788
  Scenario Outline: Verify the status of trainer is active by default when Licence agreement is set to Accepted
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    And search for trainer "123987"
    When I set trainer Licence Agreement to <agreement_status> value
    Then I see the Status field will be enabled
    When I click "Update Trainer"
    Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I can see updated Licence Agreement as "<agreement_status>"
    And I can see the last changed details with user fullname and updated date
    Examples:
      | agreement_status |
      | Accepted         |
      | Unspecified      |


  @DR-788 @nologout
  Scenario: CCU/NGU updates the Licence Agreement on a trainer record as Rejected
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I have licence agreement as "Unspecified" for trainer Id "123987"
    When I set trainer Licence Agreement to Rejected value
    Then the Status field will be set to Inactive and disabled on the UI
    And I click "Update Trainer"
    Then I will see a Inactive Trainer message with text, "You are marking the trainer's licence agreement as Rejected which will also inactivate their account. This will invalidate their licences and they will lose access to DORS+ system. Are you sure you want to continue?"
    When I click "Cancel" button on confirmation message box
    Then the message will close and no further action will be taken
    And I click "Update Trainer"
    Then I will see a Inactive Trainer message with text, "You are marking the trainer's licence agreement as Rejected which will also inactivate their account. This will invalidate their licences and they will lose access to DORS+ system. Are you sure you want to continue?"
    When I click "Reject" button on confirmation message box
    Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I can see updated Licence Agreement as "Rejected"
    And I can see the last changed details with user fullname and updated date


  @DR-893
  Scenario Outline: When a trainer's licence is changed to rejected by NGU, all the licences under the trainer
  are changed to surrendered and expiry date is changed to today's date

    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I navigate to "TRAINERS" page
    And search for trainer "888889"
    Then the system will load the trainer record in edit or update mode
    When I set trainer Licence Agreement to <agreement_status> value
    Then the Status field will be set to Inactive and disabled on the UI
    And I click "Update Trainer"
    Then I will see a Inactive Trainer message with text, "<confirmation_message>"
    When I click "Reject" button on confirmation message box
    Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And the status of every "<Licences>" changed to 'Surrendered'
    And the expiry date of every licence changed to 'system date'
    Examples:
      | agreement_status | Licences                | confirmation_message                                                                                                                                                                                                    |
      | Rejected         | Provisional/Conditional | You are marking the trainer's licence agreement as Rejected which will also inactivate their account. This will invalidate their licences and they will lose access to DORS+ system. Are you sure you want to continue? |


  @DR-893
  Scenario Outline: When a trainer himself rejects a licence agreement, all the licences under the trainer are
  set to surrendered status and the expiry date is set to today's date

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
    And I click "Reject"
    Then Reject Licence Agreement "<Licence text>" will display
    When I click "Reject" button from popup menu
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
      | agreement_status | Licences                | Licence text                                                                                      |
      | Rejected         | Provisional/Conditional |Please be aware that if you Reject the licence agreement terms: You will not be granted a licence certificate If you already hold a licence to deliver NDORS courses, such licence will terminate with immediate effect You will have no right to deliver the NDORS courses Your login to the DORS+ system will be disabled with immediate effect Are you sure you wish to reject the licence agreement?|

    @DR-925
    Scenario: Change the text on NDORS-Trainers Licence Agreement page
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      And search for trainer "676767"
      Then the system will load the trainer record in edit or update mode
      When I see 'Licence Agreement' field
      And I change 'Licence Agreement' to 'Unspecified'
      And I set Status field to Active value
      And I click "Update Trainer"
      And I logout
      When I login as an "Trainer2"
      Then I see licence agreement text with an option to Accept or Reject
      And I click "Reject"
      Then




