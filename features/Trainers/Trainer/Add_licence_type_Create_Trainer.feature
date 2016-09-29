@DR-1110
Feature: In order to specify whether the license I have is a Theory or Practical License
         As a Trainer administrator
         I want to select a license type when adding a license to a trainer
  #2 practical
  #1 theory
  Scenario Outline: Verify Course Names and Iocns in Course Name Dropdown
        Given that I have licence.ndors.org.uk page opened
        And I login as an "Compliance Manager"
        And I click "TRAINERS"
        Then I am on create Trainers page
        And I am in Licences section
        Then I can see Legend shown with "<Icon>" Icon
        And I can see a Course Name label
        When I click on Course Name field
        And the Icon shown before the Course Name in dropdown
        Examples:
        |Icon|
        |Practical Course |
        |Theory Course |

  Scenario: Verify Active schemes under Course Dropdown
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I am in Licences section
    Then I click on Course Name field
    And The Course Name dropdown will be populated with current active schemes

  Scenario Outline: Verify the theory and Practical Courses
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    Then I can see "<Type>" of the Course
    Examples:
      |Course Name                       |Type            |
      | Driving 4 Change                 |Practical Course|
      |What's Driving Us?                |Theory Course   |
      |National Driver Alertness Course  | Theory Course   |
      |National Driver Alertness Course  | Practical Course |

  Scenario Outline: successfully added licence type shown as an added new entry
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    And I see 'X' button for added new licence which is not saved to database
    Then I should see added licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    Examples:
      |Course Name|Licence status           |Expiry Date|
      |drive well | Provisional/Conditional |31/03/2017 |


  Scenario Outline: added scheme can't be available in the licence type dropdown
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    Then I click on Course Name field
    And added Scheme "<Course Name>" no longer available in the dropdown for selection
    Examples:
      |Course Name|Licence status|
      |Berks-Scheme|Full         |

  Scenario Outline: successfully added licence type can be removed
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    Then I should see added licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I see 'X' button for added new licence which is not saved to database
    When I click X button
    Then The licence row will be deleted
    Examples:
      |Course Name    |Licence status|Expiry Date|
      |Motorway Course|Expired       |29/09/2016 |
      #|               |              |

  Scenario Outline: removed licence type can be visible in the Course Name list
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    And I select the licences status as "<Licence status>"
    And I click "Add licence"
    Then I should see added licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    When I click X button
    Then The licence row will be deleted
    And I click on Course Name field
    And added Scheme "<Course Name>" available in the dropdown for selection
   Examples:
     |Course Name|Licence status|Expiry Date|
     | BRYLKOW   |  Full        |  29/09/2018 |
     #|           |              |           |

  Scenario Outline: Create a Trainer by Adding licences
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "TRAINERS" page
    Then I fill Mandatory fields with required details on create trainer form
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field
    And I select the licences status as "<Licence status>"
    And I click "Add licence"
    Then I should see added licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I click on Create Trainer button
    Then I should see a message saying "New trainer successfully created."
    Examples:
      |Course Name|Licence status|Expiry Date|
      | BRYLKOW   |  Full        |  29/09/2018 |






