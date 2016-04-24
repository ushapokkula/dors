Feature: DR-268 and DR-719
  /*DR-720 still in Devlopment
   Assuming Assessor 'sudiv' linked force area 'Metropolitan police'
   And verifying Search Force Area for default and filter view */

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    And I click "REQUEST ASSESSMENT"
    Then I will be redirected to Request Assessment page


   @DR-268 @Force_Areas_filtering_on_Request_Assessments_page  @pass
    Scenario: will see only those trainers whose linked Force Areas match to those linked to my record
     Then I will see only those trainers whose linked Force Areas match to those linked to my record

   @DR-268 DR-719 @trainers_forcearea_not_linked_to_Assessor @pass
    Scenario Outline: won't see trianers who have a force area assigned which i am not linked to
    When I start typing three letters as "<Force Area>" in the trainer search force areas
    Then The system will start autopredicting it and the list of highlight "<Force Area Name>" appear
    And I won't see trainers who have a Force Area assigned which I am not linked to
    And the Force Areas filter control on the page will have my linked Force Areas pre-selected as default
    Examples:
      |Force Area|Force Area Name              |
      |Avo      |AVON AND SOMERSET CONSTABULARY|
      |Bri      |BRITISH TRANSPORT POLICE      |



  @DR-268 @no_trainers_available @ignore @pass
     Scenario: no trainers are available to match this requirement
       And I logout
       Then I login as an "Compliance Manager"
       When I navigate to "ADMINISTRATION" page
       And I will be able to view the field "Assessment Window"
       And When I enter the value as "1" in time window
       And I click "Save"
       And I logout
       Then I login as an "Assessor"
       And I click "REQUEST ASSESSMENT"
       Then I should see message for no trainers to match requirements



