@DR-13 @DR-817
Feature:
  As an Assessor,
  I want to be able to edit my record on the system,
  so that all my contact details remain updated.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor3"
    And I navigate to "MY PROFILE" page

    Scenario: Assessor cancels the profile update operation
      Then I will be shown these fields of my record
        | Update Assessor Fields |
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

  Scenario: Verify 'Cancel' button functionality on 'Profile Page'
    Then the system will load the page where I can update assessor record
    When I click Cancel button on profile page
    And I will be redirected to "MY ASSESSMENTS" page
    Then unsaved changes will be lost

  Scenario Outline: Validation error handling
    #And I have updated my profile data with below validations
    #Then I enter field3 "<First Name>"
    #Then I enter field4 "<Last Name>"
    #Then I enter field5 "<Primary Phone Number>"
    #Then I enter field6 "<Secondary Phone Number>"
    #Then I enter field7 "<Email>"
    #Then I enter field8 "<Address>"
    #Then I enter field9 "<Town>"
    #Then I enter field10 "<Postcode>"
    #When I request to updated my profile data
    #And "<First Name>","<Last Name>","<Primary Phone Number>","<Secondary Phone Number>","<Postcode>","<Address>" ,"<Email>"fields not meet the below validation requirements
    And I fill 'Address' and 'Email' fields with '255' chars
    #And I fill "<Town>" field with "60" chars
    #Then the system will highlight those fields
    #And show validation requirements against those fields
   # And record will not be updated
    #And I will remain on the same page
    Examples:
    |First Name                                          |Last Name                                              |Primary Phone Number                              |Secondary Phone Number|Postcode|Address|Email|
    |EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ  415^&    |                                                       | +876789-*%                                       |                |W148UD|               |     |
    |TestWTG%78*                                         | EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ  415^&*-    | 07987876789                                      |07876545654|W148UD|                    |  |
    |                                                    | Web Technologies                                      | DHDgddsggg415fnhm56386+9xbvfyi689e0vhm,c.3w4678 415^&|0787*+|W148UD|                     |     |







    #|fields                       |validation               |
    #|First Name                   |                         |
    #|Last Name                    |test@123                 |
    #|Primary Phone Number         |568942+                  |
    #|Secondary Phone Number       |                         |
    #|Email                        |t_jhcbj@test.com         |
    #|Address                      |@`!#$%&'*+-/=?^_`{ } ~ . |
    #|Town                         |                         |
    #|Postcode                     |                         |
