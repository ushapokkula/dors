@DR-268
Feature:
  Assuming this  Assessor linked force area 'Metropolitan police'
  Request Assessment page default and filter view

 Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"


  @Trainers_linked_forceareas_match_to_myrecord
    Scenario: will see only those trainers whose linked Force Areas match to those linked to my record
    #Then I will be redirected to Request Assessment page
     And I should see linked Force Areas

   @Trainers_forcearea_not_linked_to_Assessor
    Scenario: won't see trianers who have a force area assigned which i am not linked to
      And I should not see trainers Force Area which not linked to Assessor


    @Assessors_preselected_forceArea
    Scenario: the Force Areas filter control on the page will have my linked Force Areas pre-selected as default
       And I should see default pre-selected Force Area

     @No_trainers_available
     Scenario: no trainers are available to match this requirement
       And I logout
       When I login as an "Compliance Manager"
       And I navigate to "ADMINISTRATION" page
       And I will be able to view the field "Assessment Window"
       And When I enter the value as "1" in time window
       And I click "save"
       And I logout
       And I login as an "Assessor"
       Then I should see message  "No assessments available to book."





