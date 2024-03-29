@pass @auto_authoris
Feature: Auto Authorise
  As an assessor
  I want to be able to have my assessment requests auto authorised/approved which have multiple trainers and no expenses claimed
  So that appropriate requests can be processed quickly avoiding burden on Compliance Unit

  Background:

    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I am on Assessment Request Summary page

  @auto_authorise_assessment_req1
  Scenario: Auto Authorise assessment request with multiple trainer included and no expenses claimed
    And I have multiple trainers included in  my request
    And no mileage expenses claimed
    When I click "Submit"
    Then The status of the assessment request will be marked Booked in the database
    And I will be re-directed to "Request Assessment" page
    And I see the success message for requested assessment with date and assessment ID
    #And I see the message The assessment has been Booked for assessment requested

  @auto_authorise_assessment_req2
  Scenario: Assessment request status without multiple trainer included and no expenses claimed
    And I have not included multiple trainers in my request
    And no mileage expenses claimed
    When I click "Submit"
    Then I will be re-directed to "Request Assessment" page
    And I see the success message for requested assessment with date and assessment ID

  @auto_authorise_assessment_req3
  Scenario: Verify the Cancel button without data entered
    When I click "Cancel" button without entering data
    Then I will be re-directed to "Request Assessment" page
