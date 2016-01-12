@booked
Feature:
  As an assessor,
  I want to be able to view my requested assessments,
  so that I can plan my working week(s) effectively.

  Background:
    Given that I am logged into the system
    And I configure the days in assessmnet window
    When I navigate to "MY ASSESSMENTS" page
    And I will see a message for assessments for configured days

@configured
  Scenario: Verify default view to show only assessments for which the days are configured
    Then I will be shown list of all assessments i requested
    And The status are "Approved"
    And The view will only show assessments for which the days are configured

  Scenario: Verify default view not to display the assessments falling out of 30 calendar days
    And I will not be able to view dates which fall out of 30 calendar days

  Scenario: Verify the message when there are no Assessments Booked
    When I have no assessments on My Assessments page
    Then I will see "You do not have any Booked assessments" on the page

  @DR-237
  Scenario:  Verify the display of assessment count on My asssessments page
    Then I can see "Assessments" label for trainer count
    And This column will show count of trainers for assessment
    And Trainer names are not displayed on summary page
    When I click "View Details"
    Then I see Trainer names included in an assessment request







