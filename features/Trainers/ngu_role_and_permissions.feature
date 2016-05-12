@DR-392
Feature:DR-392
  As a Compliance Manager,
  I want to have access to features and data on the system relevant to my role and account,
  so that I can use the system effectively for compliance, assessment, licence and user management.

  @ngu_permission1
  Scenario: Verify the access to Assessment Management,Administration, Assessors, My profile
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I see that I have access to "ASSESSMENT MANAGEMENT","ADMINISTRATION","ASSESSORS","TRAINERS"

  @ngu_permission2
  Scenario: Verify the landing page after logging in as an assessor
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Compliance Manager"
    Then I will be directed to Assessment Management page

  @ngu_permission3
  Scenario: Verify the page for requested assessments with status Requested
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor"
    And I request assessments as requested
    When I login as an "Compliance Manager"
    Then The page will show the list of assessments with status Requested

  @ngu_permission4
  Scenario: Verify the visibility of pages when logged in as Assessor
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    Then I see that I have no access to these "ASSESSMENT MAANAGEMENT","ADMINISTRATION","ASSESSORS"
    And I see that I have access to "MY ASSESSMENTS","REQUEST ASSESSMENT","MY PROFILE" as an assessor

  @ngu_permission5
  Scenario: Verify the ability to display the assessment records which they have requested
    Given that I have licence.ndors.org.uk page opened
    And I login as "Assessor" and "Assessor1" and request assessments as requested
    When I login as an "Compliance Manager"
    Then The page will show the list of assessments with status Requested
    And The page will show the list of requested assessments made by "Assessor" and "Assessor1"

