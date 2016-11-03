@DR-39 @DR-510 @DR-1150 @pass
Feature: As an NGU,
  I want to be able to manually edit the details of an existing licence held by a trainer,
  so that licence record can be kept upto date.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    Then I see "Trainers Management" page
    And I can see Legend with "Practical Course" and "Theory Course"


  Scenario: Verify the license status options
    Given I see "Trainers Management" page
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
  Scenario Outline: Verify added Course details can't be deleted
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    Then I should see selected licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I should see added course name field will be disabled
    And I can not see 'X' button to delete the added Course
    Examples:
     | trainer first name|trainer last name      | Licence status         | Expiry Date|Course Name           |
     | roopa2            |trainer2               | Full                   | 04/10/2018 |Driving For Change    |
     | roopa2            |trainer2               | Full                   | 04/10/2018 |What's Driving Us?     |
     |roopa2             |trainer2               |Full                    | 05/10/2018 |National Driver Alertness Course|


  @DR_1150
  Scenario Outline: Verify loaded trainer has selected course and selected courses no longer available in course name field
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    Then I should see selected licence type shown with "<Course Name>", "<Licence status>", "<Expiry Date>"
    And I click on Course Name field
    Then I see added Scheme "<Course Name>" no longer available in the dropdown for selection
    Examples:
    |trainer first name | trainer last name|Course Name                        |Licence status|Expiry Date|
    |roopa2              |trainer2          |Driving For Change                |    Full      |04/10/2018 |
    |roopa2             |trainer2           |What's Driving Us?                |   Full       | 04/10/2018 |
    |roopa2             |trainer2           |National Driver Alertness Course  |   Full       |  05/10/2018|


  @Dr_1150
  Scenario Outline: Verify added courses types are theory or Practical Courses
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field for "<Course Type>"
    Then I can verify selected "<Course Name>" type is "<Course Type>"
    Examples:
      |Course Name                       |Course Type       |trainer first name | trainer last name|
      |Driving For Change                |Practical Course  |roopa1              |test1|
      |What's Driving Us?                |Theory Course     |roopa1               |test1|
      |National Driver Alertness Course  |Theory Course     |roopa1               |test1|
      |National Driver Alertness Course  |Practical Course  |roopa1               |test1|
      |Speed Awareness                   |Theory Course     |roopa1               |test1|
      |National Speed Awareness          |Theory Course     |roopa1               |test1|
      |RiDE                              |Theory Course     |roopa1               |test1|
      |Motorway Course                   |Theory Course     |roopa1               |test1|


  @DR_1150
  Scenario Outline: add National Driver Alertness practical scheme and verify Practical Courses visibility in drop down
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    Then I click on Course Name field
    And I select a "<Course Name>" from Course Name field for "<Course Type>"
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    When I click on Course Name field
    And I enter "<Course Name>" name in Course Name field
    Then I should see available number of "<Course Name>" Courses
    Examples:
      |Course Name                       |Course Type       |trainer first name | trainer last name|Licence status|
      |National Driver Alertness Course  |Practical Course  |roopa1              |test1            |  Full        |


@DR_1150
  Scenario Outline: Adding Active Schemes and Verifying update trainer functionality
    Then I fill Mandatory fields with required details on create trainer form
    And I click on Create Trainer button
    Then a Success message will be displayed for Create Trainer "New trainer successfully created."
    And I will remain on the trainer's record page
    And I click on Course Name field
    And I select a "<Course Name>" from Course Name field for "<Course Type>"
    Then I can verify selected "<Course Name>" type is "<Course Type>"
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    And I can see added course Icon next to the Course Name
    And I should see added course name field will be disabled
    And I click on Update Trainer
    Then I should see a message saying "Trainer record successfully updated."
    Examples:
      |Course Name                       |Course Type      |Licence status|
      |Driving For Change                |Practical Course  |  Full       |
      |What's Driving Us?                |Theory Course     |   Full      |
      |National Driver Alertness Course  |Theory Course     |    Full    |
      |National Driver Alertness Course  |Practical Course  |  Full      |
      |Speed Awareness                   |Theory Course     |  Full      |
      |National Speed Awareness          |Theory Course     | Full       |
      |RiDE                              |Theory Course     | Full       |
      |Motorway Course                   |Theory Course     | Full       |


  @DR_1150
  Scenario Outline: Verify the course visibility in course dropdown after adding and removing the course on Update Trainer page
    Given I search for "<trainer first name>" and "<trainer last name>" in the trainer search field
    Then I should see searched "<trainer first name>" and "<trainer last name>" trainer details
    And I am in Licences section
    And I click on Course Name field
    And I select a "<Course Name>" from Course Name field for "<Course Type1>"
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    And I click on Course Name field
    And I select a "<Course Name>" from Course Name field of course type "<Course Type2>"
    And I select the licences status as "<Licence status>"
    And I click "Add licence" button
    And  I click on Course Name field
    And  I should see that the course name dropdown doesn't contain "<Course Name>"
    When I remove the licence having "<Remove Course Type>" course
    And I click on Course Name field
    And I enter "<Course Name>" name in Course Name field
    Then I should see number of "<Remove Course Type>" of type "<Course Name>"

  Examples:
    | Course Name                      | Licence status | Course Type1  | Course Type2     | Remove Course Type |trainer first name | trainer last name|
    | National Driver Alertness Course | Full           | Theory Course | Practical Course | Theory Course      |roopa1              |test1              |
    | National Driver Alertness Course | Full           | Theory Course | Practical Course |Practical Course    |roopa1              |test1              |





