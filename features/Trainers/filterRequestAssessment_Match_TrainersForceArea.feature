Feature: DR-268 and DR-720 and DR-719
  /*Assuming Assessor 'sudiv' linked force area 'Metropolitan police'
  And verifying Request Assessment page for default and filter view */

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor"
    And I click "REQUEST ASSESSMENT"
    Then I will be redirected to Request Assessment page


   @trainers_linked_forceareas_match_to_myrecord  @pass
    Scenario: will see only those trainers whose linked Force Areas match to those linked to my record
     And I should see linked Force Areas
     And I should see list of trainers match to my record


  @trainer_force_arear_auto_predict1
  Scenario Outline: Verify the auto-predict search for force area when searched with force area
    When I start typing three letters as "<Force Area>" in the trainer search force areas
    Then The system will start autopredicting it and the list of force area appear
    And I should see selected force areas in search force area filter

    Examples:
      | Force Area |
      | Avo        |
      | Bri        |
      | Che        |


  @trainer_force_arear_auto_predict2
  Scenario Outline: Verify the auto-predict search for force area when searched with force area
    When I start typing three letters as "<Force Area>" in the trainer search force areas
    Then The system will start autopredicting it and the list of force area appear
    And I should see selected "<Force AreaName>" in search force area filter

    Examples:
      | Force Area |Force AreaName|
      | BED        |BEDFORDSHIRE POLICE|




   @trainers_forcearea_not_linked_to_Assessor
    Scenario: won't see trianers who have a force area assigned which i am not linked to
     And I should not see trainers Force Area not linked to Assessor


   @trainer_preselected_forceArea
    Scenario: the Force Areas filter control on the page will have my linked Force Areas pre-selected as default
      And I should see default pre-selected Force Area


  @trainer_selected_forcearea_not_be_inlist
  Scenario Outline: Verify the selected force area name search not in force area dropdown
    When I start typing three letters as "<Force Area>" in the trainer search force areas
    Then The system will start autopredicting it and the list of force area appear
    Then The selected force area name will not be in the drop down list

    Examples:
      |Force Area|
      | Cit      |



  @no_trainers_available @ignore @pass
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

  #@DR-720



