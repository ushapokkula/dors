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

    #Scenario: Assessor updates their profile data successfully
     # And I fill all Profile fields to meet their validation rules
      #And the system will refresh My Profile page to show updated record
      #And a message "Your profile has been successfully updated." will be displayed.


  Scenario Outline: Validation error handling
    #And I have updated my profile data with below validations
    Then I enter firstname value "<First Name>"
    And  I enter lastname value "<Last Name>"
    Then I enter primary phone number "<Primary Phone Number>"
    Then I enter secondary phone number "<Secondary Phone Number>"
    Then I enter email "<Email>"
    Then I enter address "<Address>"
    Then I enter town "<Town>"
    Then I enter postcode "<Postcode>"
    #When I request to updated my profile data
    And "<First Name>","<Last Name>","<Primary Phone Number>","<Secondary Phone Number>","<Email>","<Address>","<Town>","<Postcode>" fields not meet the below validation requirements
    Then the system will highlight those fields
    And show validation requirements against those fields
    And record will not be updated
    And I will remain on the same page
    Examples:
    |First Name|Last Name|Primary Phone Number|Secondary Phone Number|Email|Address|Town|Postcode|
    |          | WTGTest| 876789|07876545654|test.wtg@wtg.co.uk|76 Hammersmith road|London|W148UD|
    #|fields                       |validation               |
    #|First Name                   |                         |
    #|Last Name                    |test@123                 |
    #|Primary Phone Number         |568942+                  |
    #|Secondary Phone Number       |                         |
    #|Email                        |t_jhcbj@test.com         |
    #|Address                      |@`!#$%&'*+-/=?^_`{ } ~ . |
    #|Town                         |                         |
    #|Postcode                     |                         |
