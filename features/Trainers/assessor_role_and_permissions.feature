@DR-388
Feature: Assessor Role and Permissions

  @role_permission1 @pass
  Scenario: Verify the access to Request Assessment, My assessments and My profile pages
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    Then I see that I have access to "MY ASSESSMENTS","REQUEST ASSESSMENT","MY PROFILE"

  @role_permission2 @pass
  Scenario: Verify the landing page after logging in as an assessor
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    Then I will be directed to My assessments page

  @role_permission3 @fail
  Scenario: Verify the page for requested assessments with status Approved
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    And I request assessments to be booked
    Then The page will show the list of assessments with status Approved

  @role_permission4 @fail @in_progress
  Scenario Outline: Verify the ability to display the assessment records which they have requested
    Given that I have licence.ndors.org.uk page opened
    When I enter username "<Username>"
    And I enter password "<Password>"
    And I click "Sign in"
    Then I will be directed to My assessments page
    And I request assessments to be booked
    And The page will show the list of assessments "<Username>" requested

    Examples:
      | Username | Password |
      | sudiv    | P@ssw0rd1|
      | johnny   | P@ssw0rd|

  @role_permission5 @pass
  Scenario: Verify the visibility of pages when logged in as Compliance User
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I see that I have no access to "MY ASSESSMENTS","REQUEST ASSESSMENT"








