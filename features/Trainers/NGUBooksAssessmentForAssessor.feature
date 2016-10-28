@DR_42
Feature: As an NGU,
  I want to be able to create an assessment record for an assessor irrespective of date of training session,
  so that unusual scenarios and errors can be catered for.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I deleted the assessments from Database
    Then I am on the Assessment Management page
    #And I see "BOOK ASSESSMENT" on assessment management page            /waiting for css/
    And I navigate to "BOOK ASSESSMENT" page
    Then I will be redirected to Book Assessment page
    And I can see number of assessments to book

    Scenario Outline: NGU loads an assessor on to book assessment
      When I select 'Pick a course' on Book Assessment Page for "<trainer_name>"
      Then I will be redirected to the Pick a course page
      And I click "Book Assessment" on Pick a course page
      Then I will be redirected to Course Detail page
      And does not show the Assessor information
      Then I can select "<trainer_name>" for which an assessment needs to be added
      And I can see text saying "Enter the assessor on whose behalf you make the assessment request, enter the mileage for the assessor and it will automatically calculate expenses"
      Then I can see "Book Assessment on behalf of" field to search for assessor
      When I start typing assessor as "<Assessor Name>" in 'Book Assessment on behalf of' field
      Then The system will start autopredicting it and the list of assessor appears
      Examples:
      |Assessor Name|trainer_name |
      |tes          |auto2 trainer|
      |roo          |auto7 trainer|


  Scenario Outline: When there is no Assessor selected then Verify Error message
    When I select 'Pick a course' on Book Assessment Page for "<trainer_name>"
    Then I will be redirected to the Pick a course page
    And I click "Book Assessment" on Pick a course page
    Then I will be redirected to Course Detail page
    Then I can select "<trainer_name>" for which an assessment needs to be added
    When I start typing assessor as "<Assessor Name>" in 'Book Assessment on behalf of' field
    And I click "Submit"
    Then I should see an "<error>" messages on Summary page
    Examples:
    |Assessor Name|trainer_name|error|
    |             |auto2 trainer|An assessor must be selected.|


  Scenario Outline: Verify Error message for invalid assessor name
    When I select 'Pick a course' on Book Assessment Page for "<trainer_name>"
    Then I will be redirected to the Pick a course page
    And I click "Book Assessment" on Pick a course page
    Then I will be redirected to Course Detail page
    Then I can select "<trainer_name>" for which an assessment needs to be added
    When I start typing assessor as "<Assessor Name>" in 'Book Assessment on behalf of' field
    And I click "Submit"
    Then I see the message "No such assessor exists."
    Examples:
      |Assessor Name|trainer_name|
      | tes        |auto2 trainer|
      |  d566      |auto2 trainer|


    Scenario Outline: NGU Books Assessment on behalf an Assessor
      When I select 'Pick a course' on Book Assessment Page for "<trainer_name>"
      Then I will be redirected to the Pick a course page
      And I click "Book Assessment" on Pick a course page
      Then I will be redirected to Course Detail page
      Then I can select "<trainer_name>" for which an assessment needs to be added
      When I start typing assessor as "<Assessor Name>" in 'Book Assessment on behalf of' field
      And I click "Submit"
      Then the Assessment Request is automatically Approved
      And the NGU user is redirected to the Assessment Management screen
      And a Confirmation message is shown
      Examples:
      |Assessor Name|trainer_name|
      | deena grit  |auto2 trainer|

