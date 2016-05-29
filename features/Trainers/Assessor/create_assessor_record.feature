@pass
@DR-171
Feature: DR-171
  As an user,
  I want to be able to create a new Assessor,
  so that they can use the system to manage assessments.

  Background:
    Given that I have licence.ndors.org.uk page opened

  @create_assessor1
  Scenario: Verify the fields displayed to create an assessor
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSORS" page
    Then the system will load the page where I can create a new assessor record with the following fields
      | Input Details          |
      | Username               |
      | Assessor Number        |
      | First Name             |
      | Last Name              |
      | Primary Phone Number   |
      | Secondary Phone Number |
      | Email                  |
      | Address                |
      | Postcode               |
      | Town                   |
      | Force Areas            |

  @create_assessor2
  Scenario Outline: Verify The mandatory fields
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSORS" page
    Then I see the following fields as "<Mandatory>" with "<Error Messages>"

    Examples:
      | Mandatory             | Error Messages                   |
      | Username              | Please provide a username.       |
      | First Name            | Please provide a first name.     |
      | Last Name             | Please provide a last name.      |
      | Primary Phone Number  | Please provide a phone number.   |
      | Primary Email Address | Please provide an email address. |
      | Address               | Please provide an address.       |
      | Postcode              | Please provide a postcode.       |
      | Town                  | Please provide a town.           |


  @create_assessor3
  Scenario Outline: Verify The  optional fields
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSORS" page
    Then I see the following fields as "<Optional>"

    Examples:
      | Optional               |
      | Assessor Number        |
      | Secondary Phone Number |
      |Secondary Email Address |
      | Force Areas            |


  @create_assessor4
  Scenario: Verify the Cancel and Create Assessor buttons
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSORS" page
    Then I see that the page includes "Create Assessor" and "Cancel" buttons


  @create_assessor5
  Scenario: Verify Cancel button on create assessor page is working
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And the system will load the page where I can create a new assessor record
    When I click Cancel button
    Then then unsaved changes will be lost and I will be redirected to my homepage (Assessments Management)


  @create_assessor6
  Scenario Outline: Verify all validation messages on entering invalid inputs to create assessor form
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page
    And the system will load the page where I can create a new assessor record
    When I enter field1 "<username>"
    When I enter field2 "<Assessor Number>"
    When I enter field3 "<First Name>"
    When I enter field4 "<Last Name>"
    When I enter field5 "<Primary Phone Number>"
    When I enter field6 "<Secondary Phone Number>"
    When I enter field7 "<Email>"
    When I enter field8 "<Address>"
    When I enter field9 "<Town>"
    When I enter field10 "<Postcode>"
    When I enter field11 "<Force Areas>"
    When I click on create assessor button
    Then I see validation messages for "<username>","<Assessor Number>","<First Name>","<Last Name>","<Primary Phone Number>","<Secondary Phone Number>","<Email>","<Address>","<Town>","<Postcode>","<Force Areas>"


    Examples:
      | username | Assessor Number | First Name | Last Name        | Primary Phone Number | Secondary Phone Number | Email              | Address             | Town   | Postcode | Force Areas              |
      |          | 11111111        | WTGTest    | Web Technologies | 07987876789          | 07876545654            | test.wtg@wtg.co.uk | 76 Hammersmith road | London | W148UD   | BRITISH TRANSPORT POLICE |
  #| TestWTG  |11111111|    | Web Technologies| 07987876789|07876545654|test.wtg@wtg.co.uk|76 Hammersmith road|London|W148UD|BRITISH TRANSPORT POLICE|
  #| TestWTG  |11111111| WTG|                 | 07987876789|07876545654|test.wtg@wtg.co.uk|76 Hammersmith road|London|W148UD|BRITISH TRANSPORT POLICE|
  #| TestWTG  |11111111| WTG| Web Technologies| |07876545654|test.wtg@wtg.co.uk|76 Hammersmith road|London|W148UD|BRITISH TRANSPORT POLICE|
  #| TestWTG  |11111111| WTG| Web Technologies| 07987876789|07876545654|                  |76 Hammersmith road|London|W148UD|BRITISH TRANSPORT POLICE|
 # | TestWTG  |11111111| WTG| Web Technologies| 07987876789|07876545654|test.wtg@wtg.co.uk|               |London|W148UD|BRITISH TRANSPORT POLICE|
  #| TestWTG  |11111111| WTG| Web Technologies| 07987876789|07876545654|test.wtg@wtg.co.uk|76 Hammersmith road| |W148UD|BRITISH TRANSPORT POLICE|
  #| TestWTG  |11111111| WTG| Web Technologies| 07987876789|07876545654|test.wtg@wtg.co.uk|76 Hammersmith road|London|   |BRITISH TRANSPORT POLICE|






