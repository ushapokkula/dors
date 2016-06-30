@DR-894 @wip
  Feature:Trainer-NDORS Licence Agreement

    Background:
      Given that I have licence.ndors.org.uk page opened

    Scenario 1: CCU/NGU Verifys Trainer Licence Agreement default option ( Unspecified )
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
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


    Scenario 1: CCU/NGU Verifys Trainer record 'Licence Agreement' field (Unspecified)readonly status
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      And I see 'Licence Agreement' field will be set to Unspecified by default
      And 'Licence Agreement' field will be disabled or read-only


    Scenario 2: CCU/NGU Verifys Trainer 'Licence Agreement' options
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

    @wip
    Scenario 3: Trainer's first logon to Licence Portal with Licence Agreement as Unspecified
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      Then I see 'Status' field default value set to 'Active'
      And the 'Licence Agreement' will be shown as Unspecified
      Then I logout
      And I login as an "Trainer1"
      Then I will be redirected to Licence Agreement screen
      And I see licence text with an option to Accept or Reject
      And I will not have access to any other system resources
    #(i.e. nav-bar or access to any URLs directly, doing which should take me back to the same page)


    Scenario 4: trainer does not see Licence Agreement on their Profile
       When I login as an "Trainer1"
       Then I navigate to "MY PROFILE" page
       And I will not see 'Licence Agreement' field on my profile page


    @wip
    Scenario 3: CCU/NGU updates the Licence Agreement on a trainer record
      When I login as an "Compliance Manager"
      Then I navigate to "TRAINERS" page
      When I search for a trainer record
      Then the system will load for me the trainer record in edit/update mode
      And I will see a 'Licence Agreement' field on the trainer form in enabled state
      And with possible options: Accepted, Rejected, Unspecified






