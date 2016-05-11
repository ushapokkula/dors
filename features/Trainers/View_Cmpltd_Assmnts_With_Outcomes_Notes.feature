@DR-181
Feature:
  As an 'Assessor' and 'NGU' user
  can view the completed Assessments which includes Trainer 'Outcomes' and 'Outcome Notes'

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    And I navigate to "REQUEST ASSESSMENT" page
    Then I request assessment with nearby trainer

    Scenario: When an NGU/CCU user loads detailed view of the Completed Assessment, they should be able to see:
     When I login as an "Compliance Manager"
     And I navigate to "ASSESSMENT MANAGEMENT" page
      Then I see the "Requested" option is in selected status
       And I "Approve" requested Assessment
       And I "Completed" approved Assessment
      Then I load detailed view of the Completed Assessment
      Then I should able to see below "<fields>" on assessment outcome page
      #Examples:
         #|fields|
         #|Trainer Name|
        # |Trainer Licence Code/ID|
         #|Trainer Outcome        |
         #|Compliance Notes       |






