@DR-848
Feature: Create and update a trainer Record
  As an CCU user, I can create and update
  a trainer record with welsh characters in four of the form fields such
  as Street Address,Town,First Name and Last Name.

  Scenario: Welsh character support
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I start typing six digits as "131313" in the trainer search field
    And The system will start autopredicting it and the list of trainer appears
    And I hit enter after typing trainer ID "131313"
    And enter all valid details in Street Address,Town,First Name and Last Name
    And I click "Update Trainer"
    And the system will show a success message, "Trainer record successfully updated."
