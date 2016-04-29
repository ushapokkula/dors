Feature: DR-268 and DR-719 @pass
  /*
   Assuming 'Assessor2' linked force area 'Metropolitan police'
   And verifying Search Force Area for default and filter view
   And 'Assessor3' linked force area 'CHESHIRE' with no assessments */

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor2"
    And I click "REQUEST ASSESSMENT"
    Then I will be redirected to Request Assessment page

    @DR-268 @Force_Areas_filtering_on_Request_Assessments_page  @pass
    Scenario: default view to show trainers which have matching Force Areas as Assessor's Force Areas
     And I will see only those trainers whose linked Force Areas match to those linked to my record

    @DR-268 @no_trainers_available
    Scenario: no trainers are available to match this requirement
    When I login as an "Assessor3"
    And I click "REQUEST ASSESSMENT"
    Then I will be redirected to Request Assessment page
    And I should see the matching Force Area Name in Force Area Filters
    Then I should see message for "No assessments available to book."

    @DR-719  @trainers_forcearea_not_linked_to_Assessor
    Scenario Outline: Verify trainers force area not linked to assessor
      When I start typing three letters as "<Force Area>" in the trainer search force areas
      Then The system will start autopredicting it and the list of highlight "<Force Area Name>" appear
      And I hit enter to see the selected "<Force Area Name>" in Force Area filter
      And I won't see trainers who have a Force Area assigned which I am not linked to
      And the Force Areas filter control on the page will have my linked Force Areas pre-selected as default
      Examples:
      |Force Area|Force Area Name              |
      |Avo      |AVON AND SOMERSET CONSTABULARY|
      |Bri      |BRITISH TRANSPORT POLICE      |







