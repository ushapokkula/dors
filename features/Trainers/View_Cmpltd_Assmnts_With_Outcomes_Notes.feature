@DR-181 @DR-827 @DR-645 @pass
Feature: Completed Assessments Outcome Notes
  As an 'Assessor' & 'NGU' user
  can view the completed Assessments which includes
  Trainer 'Outcomes' and 'Outcome Notes'

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    And I deleted the assessments from Database
    Then I book assessment with nearby trainer
    And I logout

    Scenario:  When an NGU user loads detailed view of the Completed Assessment, they should be able to see:
      When I login as an "Compliance Manager"
      And I navigate to "ASSESSMENT MANAGEMENT" page
      And I 'Completed' Approved Assessment
      Then I load detailed view of 'Completed' Assessment
      Then I should see below information in view mode on 'Assessment Outcome' page
       |information              |
       |Trainer Name             |
       |Outcome                  |
       |Compliance Notes         |

  @DR-866
  Scenario: When an 'Assessor' loads detailed view of the 'Completed' Assessment, they should be able to see:
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSMENT MANAGEMENT" page
     And I 'Completed' Approved Assessment
     And I logout
     Then I login as an "Assessor"
     And I navigate to "MY ASSESSMENTS" page
     Then I load detailed view of 'Completed' Assessment from 'My Assessments' page
     Then I should see below information in view mode on 'My assessment details' page
     |information             |
     |Trainer Name            |
     |Trainer Outcome         |
     |Compliance Notes        |





