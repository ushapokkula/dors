@DR-268, @DR-719 @pass
Feature: DR-268 and DR-719
  /*
  Assuming 'Assessor2' linked force area 'Metropolitan police'
  And verifying Search Force Area for default and filter view
  And 'Assessor4' linked force area 'CHESHIRE' with no assessments */

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as an "Assessor2"
    And I click "REQUEST ASSESSMENT"
    Then I will be re-directed to "Request Assessment" page

  @DR-268 @Force_Areas_filtering_on_Request_Assessments_page  @pass
  Scenario: default view to show trainers which have matching Force Areas as Assessor's Force Areas
    And I will see only those trainers whose linked Force Areas match to those linked to my record

  @DR-268 @no_trainers_available
  Scenario: no trainers are available to match this requirement
    And I logout
    When I login as an "Assessor4"
    And I click "REQUEST ASSESSMENT"
    Then I will be re-directed to "Request Assessment" page
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
      | Force Area | Force Area Name                |
      | Avo        | AVON AND SOMERSET CONSTABULARY |
      | Bri        | BRITISH TRANSPORT POLICE       |

  @DR-115 @trainer_search_by_name
  Scenario Outline: Verify the auto-predict search when trainer is filtered with Firstname or lastname
    Given I logout
    And I login as an "Assessor"
    And I click "REQUEST ASSESSMENT"
    And I can see "Filter By Trainer:" field available on the page
    When I start typing atleast three characters as "<Trainer Name>"in the filter by trainer field
    Then The system will auto-predict and show possible trainer names and IDs in a dropped down list

    Examples:
      | Trainer Name |
      | bob          |
      | ton          |
      | pil          |

  @DR-115 @trainer_search_by_trainer_id
  Scenario Outline: Verify the auto-predict search when trainer is filtered with Trainer ID
    Given I logout
    And I login as an "Assessor"
    And I click "REQUEST ASSESSMENT"
    When I enter a valid and existing trainer ID of 6 digits as "<Trainer ID>" in the filter by trainer field
    Then The system will auto-predict and show possible trainer names and IDs in a dropped down list

    Examples:
      | Trainer ID |
      | 111111     |
      | 333333     |
      | 555555     |

    @DR-115 @search_criteria_fail
  Scenario: Verify the validation message when no record does'nt match the search criteria
    Given I logout
    And I login as an "Assessor"
    And I click "REQUEST ASSESSMENT"
    When The search criteria does'nt match any trainer record
    Then I see the message "No such trainer exists."

      @DR-115 @navigate_list_using_keyboard_controls
  Scenario Outline: Verify the trainer details by navigating the trainer list using keyboard control keys
    And I start typing atleast three characters as "<Trainer Name>"in the filter by trainer field
    And The system will auto-predict and show possible trainer names and IDs in a dropped down list
    When I hit DOWN arrow key from the trainer filter auto predict list
    Then The second value will be selected from the auto predict list "<Down_Arrow>"
    When I hit UP arrow key from the trainer filter auto predict list
    Then The first name will be selected from the auto predict list "<UP_Arrow>"
    Examples:
      | Trainer Name | Down_Arrow | UP_Arrow |
      | swa          | Swapna     | Swapna   |

    @DR-115 @default_select
    Scenario: Verify the default search Trainer from the result set
      And I start typing atleast three characters as "<Trainer Name>" in the trainer search field
      And The system will start autopredicting it and the list of trainer appears
      When I hit enter after typing first three characters of trainer name as "<Trainer Name>"
      Then The first trainer name will be selected from the drop down list by default "<First Name>"






















