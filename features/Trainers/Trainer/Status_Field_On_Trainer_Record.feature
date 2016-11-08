@DR-897 @pass
Feature: Status Field On Trainer Record

  Scenario: Verify the fields displayed on create a trainer
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I see Trainer status set as 'Active' by default
    And status fields will be disabled
    Then I fill Mandatory fields with required details on create trainer form
    And I click on Create Trainer button
    Then a Success message will be displayed for Create Trainer "New trainer successfully created."
    And the Status fields will be shown enabled now

    @nologout
    Scenario: CCU/NGU sets a trainer record to inactive
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Compliance Manager"
      And I navigate to "TRAINERS" page
      And I search for "roopa" and "ramisetty" in the trainer search field
      Then the system will load the trainer form where I can edit or update
      And the Status fields will be shown enabled now
      When I set the status to "Inactive"
      And I click on Update Trainer
      Then I will see a Inactive Trainer message with text, "You are marking the trainer's licence agreement as Rejected which will also inactivate their account. This will invalidate their licences and they will lose access to DORS+ system. Are you sure you want to continue?"
      When I click on Cancel button
      Then the message will close and no further action will be taken
      And I click on Update Trainer
      Then I click Reject button
      And the system will show a success message, "Trainer record successfully updated."
      Then I see Trainer status set as 'Inactive'


   Scenario: Trainer views their Profile
     Given that I have licence.ndors.org.uk page opened
     And I login as an "Trainer1"
     When I navigate to "MY PROFILE" page
     Then I will not see 'Status' field on my profile page

  @nologout
  Scenario: Inactive trainer attempts login
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Trainer5"
    Then will get the standard invalid credentials login failure message
    And message will appear as: "Your login credentials are invalid. Please try again with correct login credentials."





