@DR-39 @DR-510 @DR-1150 @pass
Feature: As an NGU,
  I want to be able to manually edit the details of an existing licence held by a trainer,
  so that licence record can be kept upto date.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    Then I see "Trainers management" page
    And I can see Legend with "Practical Course" and "Theory Course"



  Scenario: Verify the license status options
    Given I see "Trainers management" page
    Then I see the following default Licence status in Licence status dropdown
      | Licence Status          |
      | ---Please select---     |
      | Provisional/Conditional |
      | Full                    |
      | Expired                 |
      | Suspended               |
      | Revoked                 |
      | Surrendered             |


  Scenario Outline: Verify Expiry date for 'Expired' and 'Suspended' status
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I select the "<Licence status>" as 'Expired' or 'Suspended'
    Then the system will default the Expiry Date to today's date
    And I can change today's date to any other "<date>" not in past
    Examples:
      | trainer first name | trainer last name | Licence status | date       |
      | roopa              | trainer           | Expired        | 17/04/2017 |
      | roopa              | trainer           | Suspended      | 17/04/2017 |


  Scenario Outline: Verify Expiry date for 'Full' status
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I select the status as to 'Full' from any other value
    Then the system will default the Expiry Date to 730 days from current date
    And I can change Expiry Date value to any other "<date>" not in past
    Examples:
      | trainer first name | trainer last name | date       |
      | roopa              | trainer           | 17/04/2017 |

  Scenario Outline: Verify Expiry date for 'Provisional' status
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I select the "<Licence status>" as 'Provisional or Conditional'
    Then the system will default the Expiry Date to 183 days from current date
    And I can change Expiry Date to any other "<date>" as well not in past
    Examples:
      | trainer first name | trainer last name | Licence status          | date       |
      | roopa              | trainer           | Provisional/Conditional | 22/04/2017 |

  @DR_673
  Scenario Outline: Verify warning-message when expiry date more than 730 days
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I manually set the "<Expiry Date>" to more than 730 days from system or current date
    Then the system will show a soft warning message, "You are setting the validity of this licence for more than 2 years. Please ensure your date selection is correct."
    Examples:
      | trainer first name | trainer last name | Expiry Date |
      | roopa              | trainer           | 26/04/2019  |

  Scenario Outline: Verify the 'updated message' after few changes
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I have made desired changes for "<Postcode>" and click 'Update Trainer'
    And the system will show a success message, "Trainer record successfully updated."
    And I will remain on the trainer's record page
    Examples:
      | trainer first name | trainer last name | Postcode |
      | roopa              | trainer           | HA9 7lm  |


    @DR-675 @DR-510
    Scenario Outline: Display error message when existing licences Full or Provisional status have expiry date in past
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
     Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
     When I change "<Expiry date>" in past for trainer which has Licence state of 'Full' or 'Provisional'
     Then the system will trigger the user with an error message "Sorry, the licence has expired, please amend the status accordingly" on trainer page
     Examples:
      | trainer first name | trainer last name | Expiry date |
      | roopa              | trainer           | 04/04/2016  |

  @DR-1150
  Scenario Outline: Verify added Course dettails can't be deleted
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    Then I should see added licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I should see added course name field will be disabled
    And And I can not see 'X' button to delete the added Course
    Examples:
     | trainer first name|trainer last name | Licence status          | Expiry Date|Course Name  |
     | tes              | test             | Full                    | 06/04/2018 |Speed Control|
     | test              | test             | Provisional/Conditional | 01/04/2017 |mictest      |


  @DR_1150
  Scenario Outline: Verify loaded trainer can select a course and can verify course type
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    And I click on Course Name field
    And I select a "<Course Name>" from Course Name field for "<Course Type>"
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    And I can see added course Icon next to the Course Name
    And I should see added course name field will be disabled
    And I click on Update Trainer
    Then I should see a message saying "Trainer record successfully updated."

    Examples:
      |Course Name                       |Course Type       | trainer first name | trainer last name|Licence status|
      |Driving For Change                |Practical Course  | roopa2               | trainer2       |  Full           |
      |What's Driving Us?                |Theory Course     | roopa2               | trainer2       |   Full          |
      |National Driver Alertness Course  |Theory Course     | roopa2              | trainer2          ||
      |National Driver Alertness Course  |Practical Course  | roopa2             | trainer2          ||
      |Speed Awareness                   |Theory Course     | roopa2              | trainer2          ||
      |National Speed Awareness          |Theory Course     | roopa2              | trainer2          ||
      |RiDE                              |Theory Course     | roopa2              | trainer2          ||
      |Motorway Course                   |Theory Course     | roopa2              | trainer2          ||


  Scenario Outline: Verify loaded trainer has selected course and added courses no loger available in course name field
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    And I click on Course Name field
    And I select a "<Course Name>" from Course Name field for "<Course Type>"
    When I click on Course Name field
    Then I see added Scheme "<Course Name>" no longer available in the dropdown for selection
    Examples:
    |trainer first name | trainer last name|Course Name                        |Course Type|
    |roopa2              |trainer2             |Speed Awareness                    |Theory Course|
    #|test1              |test1             |National Driver Alertness Course   |Practical Course|
    #|test1              |test1             |Driving For Change                 |Practical Course|

