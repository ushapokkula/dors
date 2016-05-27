@DR-171 @DR-13 @DR-594
Feature:
  As an user,
  I want to be able to create a new Assessor,
  so that they can use the system to manage assessments.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I navigate to "ASSESSORS" page

  @create_assessor1
  Scenario: Verify the fields displayed to create an assessor
    Then the system will load the page where I can create a new assessor record with the following fields
      | Input Details           |
      | Username                |
      | Assessor Number         |
      | First Name              |
      | Last Name               |
      | Primary Phone Number    |
      | Secondary Phone Number  |
      | Primary Email Address   |
      | Secondary Email Address |
      | Address                 |
      | Postcode                |
      | Town                    |
      | Force Areas             |

    @create_assessor2
    Scenario Outline: Verify The mandatory fields
    Then I see the following fields as "<Mandatory>" with "<Error Messages>"
    Examples:
      | Mandatory              | Error Messages                   |
      | Username               | Please provide a username.       |
      | First Name             | Please provide a first name.     |
      | Last Name              | Please provide a last name.      |
      | Primary Phone Number   | Please provide a phone number.   |
      | Primary Email Address  | Please provide an email address. |
      | Address                | Please provide an address.       |
      | Postcode               | Please provide a postcode.       |
      | Town                   | Please provide a town.           |


    @create_assessor3
    Scenario Outline: ario Outline: Verify The  optional fields
    Then I see the following fields as "<Optional>"
    Examples:
      | Optional               |
      | Assessor Number        |
      | Secondary Phone Number |
      | Secondary Email Address|
      | Force Areas            |

   @create_assessor4
   Scenario: Verify the Cancel and Create Assessor buttons
    And I see that the page includes "Create Assessor" and "Cancel" buttons

  @create_assessor5
   Scenario: Verify Cancel button on create assessor page is working
    Then the system will load the page where I can create a new assessor record
    When I click Cancel button
    Then then unsaved changes will be lost and I will be redirected to my homepage (Assessments Management)

  @create_assessor6
  Scenario Outline: Verify all validation messages on entering invalid inputs to create assessor form
    Then the system will load the page where I can create a new assessor record
    Then I enter field1 "<Username>"
    Then I enter field2 "<Assessor Number>"
    Then I enter field3 "<First Name>"
    Then I enter field4 "<Last Name>"
    Then I enter field5 "<Primary Phone Number>"
    Then I enter field6 "<Secondary Phone Number>"
    Then I enter field7 "<Primary Email>"
    Then I enter field8 "<Secondary Email>"
    Then I enter field9 "<Address>"
    Then I enter field10 "<Town>"
    Then I enter field11 "<Postcode>"
    Then I enter field12 "<Force Areas>"
    Then I click on create assessor button
    Then I see validation messages for "<Username>","<Assessor Number>","<First Name>","<Last Name>","<Primary Phone Number>","<Secondary Phone Number>","<Primary Email>","<Secondary Email>","<Address>","<Town>","<Postcode>","<Force Areas>"

    Examples:
       |Username   |Assessor Number   |First Name                                          |Last Name                                                 |Primary Phone Number                                  |Secondary Phone Number|Primary Email         |Secondary Email     |Address       |Town      |Postcode|
       |           |1^&*456           |EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ  415^&    |                                                          | +876789-*                                            | 0787*+               |{^*Roopa#@wtg&com     |                     |76hammersmith |Lo&,.,-H |         |
       | Te^&*WTG  |011111111         |TestWTG%78*                                         | EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ123@vb  415^&*- |                                                      |07876545654           |/_rchitt120>~mail&&.com|                     |WEExxx.bcbhb | Tr@' , -;| w14 8ud |
       |Test(_+    |11111111          |                                                    | Web Technologies                                         | DHDgddsggg415fnhm56386+9xbvfyi689e0vhm,c.3w4678 415^&|078765456$%&BVH       |                       |                      |             |DV&/.()jc| ha03pb |


