@DR-90
  Feature: Record User's identity and date-time stamp when licence agreement is set/updated by trainer or CCU

    Scenario: Verify user's identity and date-time stamp when licence agreement is set by trainer
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Complaince Manager"
      Given I have licence agreement as "Unspecified" for trainer Id "123987"
      And I logout
      And I login as an "Trainer Licence"
      When I click "Accept"
      And I will be redirected to "My Licences" page
      When I login as an "Complaince Manager"
      And search for trainer "123987"



