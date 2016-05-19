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

    #Scenario: Assessor updtaes their profile data successfully
     # And I fill all Profile fields to meet their validation rules
      #And the system will refresh My Profile page to show updated record
      #And a message "Your profile has been successfully updated." will be displayed.


  Scenario Outline: Validation error handling
    And I have updated my profile data with below validations
    Then I enter firstname value "<First Name>"
    And  I enter lastname value "<Last Name>"
    Then I enter primary phone number "<Primary Phone Number>"
    Then I enter secondary phone number "<Secondary Phone Number>"
    Then I enter email "<Email>"
    Then I enter address "<Address>"
    Then I enter town "<Town>"
    Then I enter postcode "<Postcode>"
    Then I click on Update Assessor
    Then I see validation messages for "<First Name>","<Last Name>","<Primary Phone Number>","<Secondary Phone Number>","<Email>","<Address>","<Town>","<Postcode>"
    Examples:
    |First Name|Last Name|Primary Phone Number|Secondary Phone Number|Email|Address|Town|Postcode|