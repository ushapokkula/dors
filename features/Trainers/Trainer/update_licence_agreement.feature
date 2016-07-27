@pass
@DR-900

Feature: Record User's identity and date-time stamp when licence agreement is set/updated by trainer or CCU


  @trainer_accept
  Scenario: Verify user's identity and date-time stamp when licence agreement is set to accepted by trainer
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    Given I have licence agreement as "Unspecified" for trainer Id "123987"
    And I logout
    And I login as an "TrainerLicence"
    When I click "Accept"
    And I will be redirected to "My Licenses" page
    And I logout
    When I login as an "Compliance Manager"
    And I click "TRAINERS"
    And search for trainer "123987"
    And I can see "Accepted" as Licence Agreement
    And I can see the last changed details with user fullname and updated date

  @trainer_reject
  Scenario: Verify user's identity and date-time stamp when licence agreement is set to rejected by trainer
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    Given I have licence agreement as "Unspecified" for trainer Id "123987"
    And I logout
    And I login as an "TrainerLicence"
    When I click "Reject"
    And I click "Yes"
    Then I will be logged out
    When I login as an "Compliance Manager"
    And I click "TRAINERS"
    And search for trainer "123987"
    And I can see "Rejected" as Licence Agreement
    And I can see the last changed details with user fullname and updated date

  @ccu_accept
  Scenario: Verify user's identity and date-time stamp when licence agreement is set to accepted by CCU
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    Given I have licence agreement as "Unspecified" for trainer Id "123987"
    When I select "Accepted" as licence agreement
    And I click "Update Trainer"
    And I can see "Accepted" as Licence Agreement
    And I can see the last changed details with user fullname and updated date

  @ccu_reject
  Scenario: Verify user's identity and date-time stamp when licence agreement is set to rejected by CCU
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    Given I have licence agreement as "Unspecified" for trainer Id "123987"
    When I select "Rejected" as licence agreement
    And I click "Update Trainer"
    And I see the popup with 'Yes' or 'No'
    And I click "Yes"
    And a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I can see "Rejected" as Licence Agreement
    And I can see the last changed details with user fullname and updated date

















