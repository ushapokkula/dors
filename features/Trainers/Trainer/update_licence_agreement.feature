@DR-90

  Feature: Record User's identity and date-time stamp when licence agreement is set/updated by trainer or CCU

    @trainer_accept
    Scenario: Verify user's identity and date-time stamp when licence agreement is set to accepted by trainer
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Complaince Manager"
      Given I have licence agreement as "Unspecified" for trainer Id "123987"
      And I logout
      And I login as an "Trainer Licence"
      When I click "Accept"
      And I will be redirected to "My Licences" page
      When I login as an "Complaince Manager"
      And search for trainer "123987"
      And I can see "Accepted" as Licence Agreement
      And I can see the last changed details with user fullname and updated date


    @trainer_reject
    Scenario: Verify user's identity and date-time stamp when licence agreement is set to rejected by trainer
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Complaince Manager"
      Given I have licence agreement as "Unspecified" for trainer Id "123987"
      And I logout
      And I login as an "Trainer Licence"
      When I click "Reject"
      And I will be redirected to "My Licences" page
      When I login as an "Complaince Manager"
      And search for trainer "123987"
      And I can see "Rejected" as Licence Agreement
      And I can see the last changed details with user fullname and updated date


    @ccu_accept
    Scenario: Verify user's identity and date-time stamp when licence agreement is set to accepted by trainer
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Complaince Manager"
      Given I have licence agreement as "Unspecified" for trainer Id "123987"
      And I logout
      And I login as an "Trainer Licence"
      When I click "Accept"
      And I will be redirected to "My Licences" page
      When I login as an "Complaince Manager"
      And search for trainer "123987"
      And I can see "Accepted" as Licence Agreement
      And I can see the last changed details with user fullname and updated date


    @ccu_reject
    Scenario: Verify user's identity and date-time stamp when licence agreement is set to rejected by trainer
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Complaince Manager"
      Given I have licence agreement as "Unspecified" for trainer Id "123987"
      And I logout
      And I login as an "Trainer Licence"
      When I click "Reject"
      And I will be redirected to "My Licences" page
      When I login as an "Complaince Manager"
      And search for trainer "123987"
      And I can see "Rejected" as Licence Agreement
      And I can see the last changed details with user fullname and updated date

















