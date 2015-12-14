Feature:
  As an assessor
  I want to be able to have my assessment requests auto authorised/approved which have multiple trainers and no expenses claimed
  So that appropriate requests can be processed quickly avoiding burden on Compliance Unit

  Background:
    Given that I am logged into the system
    And I am on Assessment Request Summary page


  Scenario: Auto Authorise assessment request with multiple trainer and no expenses claimed
    And I have multiple trainers included in  my request
    And no mileage expenses claimed
    When I click "Submit"
    #Then The assessment request will be marked Booked
    And I will be redirected to Request Assessment page
    And I see a message "The assessment has been Booked"


  Scenario: Assessment request status without multiple trainer included and no expenses claimed
    And I have not included multiple trainers in my request
    And no mileage expenses claimed
    When I click "Submit"
    And I will be redirected to Request Assessment page
    And I see a message "The assessment has been Requested"

  Scenario: Verify the Cancel button without data entered
    When I click "Cancel" button without entering data
    Then I should be redirected to Pick a slot page
