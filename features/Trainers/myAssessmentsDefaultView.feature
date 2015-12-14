@booked
Feature:
  As an assessor,
  I want to be able to view my requested assessments,
  so that I can plan my working week(s) effectively.

  Background:
    Given that I am logged into the system
    When I navigate to "MY ASSESSMENTS" page


  Scenario: Verify default view to show only assessments falling in next 30 calendar days
    Then I will be shown list of all assessments i requested
    And The status are "Booked"
    And The default view will only show assessments falling in next 30 calendar days

  Scenario: Verify default view not to display the assessments falling out of 30 calendar days
    And I will not be able to view dates which fall out of 30 calendar days

  Scenario: Verify the message when there are no Assessments Booked
    When I have no assessments on My Assessments page
    Then I will see "You do not have any Booked assessments" on the page





