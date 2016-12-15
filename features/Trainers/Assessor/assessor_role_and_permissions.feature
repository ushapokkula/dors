@pass
@DR-388
Feature: Assessor Role and Permissions

  Background:
    Given that I have licence.ndors.org.uk page opened

  @role_permission1
  Scenario: Verify the access to Request Assessment, My Assessments and My profile pages
    When I login as an "Assessor"
    Then I see that I have access to "MY ASSESSMENTS","REQUEST ASSESSMENT","MY PROFILE"

  @role_permission2
  Scenario: Verify the landing page after logging in as an assessor
    When I login as an "Assessor"
    Then I will be re-directed to "My Assessments" page

  @role_permission3
  Scenario: Verify the page for requested assessments with status Approved
    And I login as an "Assessor"
    And I request assessments to be booked
    And I see the success message for requested assessment with date and assessment ID
    #And I see the message "The assessment has been Booked" for assessment requested
    When I click "MY ASSESSMENTS"
    Then The page will show the list of assessments with status Approved

  @role_permission4
  Scenario Outline: Verify the ability to display the assessment records which they have requested
    When I enter username "<Username>"
    And I enter password "<Password>"
    And I click "Sign in"
    Then I will be re-directed to "My Assessments" page
    And I request assessments to be booked
    And I see the success message for requested assessment with date and assessment ID
    #And I see the message "The assessment has been Booked" for assessment requested
    And I click "MY ASSESSMENTS"
    When I click View Details button for the assessment
    And The page will show the list of assessments "<Username>" requested

    Examples:
      | Username | Password |
      | sudiv    | P@ssw0rd2|
      | johnny   | P@ssw0rd1|

  @role_permission5
  Scenario: Verify the visibility of pages when logged in as Compliance User
    When I login as an "Compliance Manager"
    Then I see that I have no access to "MY ASSESSMENTS","REQUEST ASSESSMENT"








