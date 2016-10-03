@DR-261 @DR-827 @DR-645 @DR-898 @pass
Feature: Show Assessment ID
  As an 'Assessor' or 'NGU' User
  Verify the 'Assessment ID'
  On Summary View and Detailed View of Assessment Requests


  Scenario: The summary view of assessment requests on My Assessments page should show the Assessment ID.
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    And I request assessment
    And I navigate to "MY ASSESSMENTS" page
    Then I select 'Requested' status from 'Assessment Status' dropdown
    And I see "Requested" assessments on 'My Assessments' page
    Then I should see the "Assessment ID" on summary view of assessment on 'My assessment' page

  Scenario: The detailed view of an assessment request should show Assessment ID.
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    And I request assessment
    And I navigate to "MY ASSESSMENTS" page
    Then I select 'Requested' status from 'Assessment Status' dropdown
    And I click on "View Details" button on 'My assessments' page
    And I should see "Assessment ID" on detailed view of assessment request

  Scenario: The summary view of assessment requests on Manage Assessments page should show the Assessment ID1.
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    And I request assessment
    And I logout
    Then I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    Then I should see Assessment ID on summary view of assessment on 'Manage Assessments' page

  Scenario: The detailed view of an assessment request should show Assessment ID.
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    And I request assessment
    And I logout
    Then I login as an "Compliance Manager"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I click on "View Details" button on 'Assessment management' page
    Then I should see "Assessment ID" on detailed view of an assessment request


  @DR-898
  Scenario Outline: Assessor address is replaced by assessor number on view details of assessment management page
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor3"
    And I navigate to "REQUEST ASSESSMENT" page
    And I request assessment as "<Type>"
    And I logout
    Then I login as an "<User>"
    And I navigate to "ASSESSMENT MANAGEMENT" page
    And I select assessment status depending on "<User>" and "<Type>"
    When I click on "View Details" button on 'Assessment management' page
    Then I see assessor address is replaced by assessor number

    Examples:
      | Type      | User               |
      | Requested | Compliance Manager |
      | Booked    | Compliance Manager |

  @DR-898
  Scenario Outline: Assessor address is replaced by assessor number on view details of My Assessments page
    Given that I have licence.ndors.org.uk page opened
    When I login as an "<User>"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessment as "<Type>"
    And I navigate to "MY ASSESSMENTS" page
    Then I select assessment status depending on "<User>" and "<Type>"
    And I click on "View Details" button on 'My assessments' page
    Then I see assessor address is replaced by assessor number

    Examples:
      | Type      | User      |
      | Requested | Assessor3 |
      | Booked    | Assessor3 |


  @DR-898
  Scenario: Verify assessor section on both view details page when the assessor number is blank
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "ASSESSORS"
    And I search for "deena"
    And I edit the assessor number to be blank
    And I click "Update Assessor"
    And I see the success message "Assessor record successfully updated" on the assessor page
    And I logout
    And I login as an "Assessor3"
    And I deleted the assessments from Database
    And I request assessment
    And I logout
    And I login as an "Compliance Manager"
    And I click "ASSESSMENT MANAGEMENT"
    When I click on "View Details" button on 'Assessment management' page
    Then I see in assessor section there is no assessor number displayed
    And I logout
    And I login as an "Assessor3"
    And I click "MY ASSESSMENTS"
    And I select 'Requested' status from 'Assessment Status' dropdown
    When I click on "View Details" button on 'My assessments' page
    Then I see in assessor section there is no assessor number displayed


  @DR-898
  Scenario: Revert back the assessor number
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "ASSESSORS"
    When I search for "deena"
    Then I revert back the assessor number to "0123456"
    And I click "Update Assessor"
    And I see the success message "Assessor record successfully updated" on the assessor page


     






