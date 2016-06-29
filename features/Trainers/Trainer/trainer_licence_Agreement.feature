@DR-894
  Feature:Trainer-NDORS Licence Agreement

    Background:
      Given that I have licence.ndors.org.uk page opened
      And I login as an "Compliance Manager"
      When I navigate to "TRAINERS" page

    Scenario: CCU/NGU creates a trainer record with Licence Agreement as Unspecified by default
      Then the system will load the page where I can create a new trainer record with required fields
        | Input Details          |
        | Username               |
        | Trainer Id             |
        | First Name             |
        | Last Name              |
        | Known As               |
        | Primary Phone Number   |
        | Secondary Phone Number |
        | Primary Email Address  |
        | Secondary Email Address|
        | Address                |
        | Postcode               |
        | Town                   |
        | Is Instructor          |
        |Status                  |
        |License Agreement       |
      And I will see a 'Licence Agreement' field on the trainer form


    Scenario: CCU/NGU creates a trainer record with Licence Agreement as Unspecified by default
      And I see 'Licence Agreement' field will be set to Unspecified by default
      And 'Licence Agreement' field will be disabled or read-only

    Scenario: CCU/NGU Verifys Trainer Licence Agreement options
      Then I fill Mandatory fields with required details on create trainer form
      And I click on Create Trainer button
      Then a Success message will be displayed for Create Trainer "New trainer successfully created."
      And the 'Licence Agreement' will be shown as Unspecified
      And 'Licence Agreement' field will have three possible options
        |Licence Agreement|
        |Accepted   |
        |Rejected   |
        |Unspecified|


      Scenario: Trainer's first logon to Licence Portal with Licence Agreement as Unspecified
        And its with default values i.e. Status set to Active and Licence Agreement set to Unspecified
        When I attempt to login to the Licence Portal and provide valid credentials
        Then I will be redirected to Licence Agreement screen showing licence text with option to Accept or Reject it
        And I will not have access to any other system resources i.e. nav-bar or access to any URLs directly, doing which should take me back to the same page



