
Feature: Assessor Role and Permissions

  @DR-388
  Scenario: Verify the access to Request Assessment, My assessments and My profile pages
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    Then I see that I have access to "MY ASSESSMENTS","REQUEST ASSESSMENT","MY PROFILE"

  Scenario: Verify the page for requested assessments with status Approved
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    Then I will be directed to My assessments page
    And The page will show the list of assessments with status Approved


  Scenario Outline: Verify the ability to display the assessment records which they have requested
    Given that I have licence.ndors.org.uk page opened
    When I enter "<Username>"
    And I enter "<Password>"
    And I click "Sign In"
    Then I will be directed to My assessments page
    And The page will show the list of assessments i requested with status Approved

    Examples:
    |Username|Password|
    |sudiv   |P@ssw0rd|
    |johnny  |P@ssw0rd|






