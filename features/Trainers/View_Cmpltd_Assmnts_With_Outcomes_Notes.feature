Feature:
  As an 'Assessor' & 'NGU' user
  can view the completed Assessments which includes
  Trainer 'Outcomes' and 'Outcome Notes'

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessment with nearby trainer

    Scenario:  When an NGU user loads detailed view of the Completed Assessment, they should be able to see:
       When I login as an "Compliance Manager"
       And I navigate to "ASSESSMENT MANAGEMENT" page
       Then I see the "Requested" option is in selected status
       And I "Approve" requested Assessment
       And I 'Completed' approved Assessment
       Then I load detailed view of 'Completed' Assessment
       Then I should see below information in view mode on 'Assessment Outcome' page
       |information              |
       |Trainer Name             |
       |Licence          |
       |Outcome          |
       |Compliance Notes         |

  Scenario: When an 'Assessor' loads detailed view of the 'Completed' Assessment, they should be able to see:
     And I navigate to "My ASSESSMENTS" page
     And I select 'Completed' status from 'Assessment Status' dropdown
     Then I load detailed view of 'Completed' Assessment from 'My Assessments' page
     Then I should see below information in view mode on 'My assessment details' page
     |information             |
     |Trainer Name            |
     |Trainer Licence Code/ID |
     |Trainer Outcome         |
     |Compliance Notes        |





