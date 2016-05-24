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
    Then I enter firstname value "<First Name>"
    Then I enter lastname value "<Last Name>"
    Then I enter primary phone number "<Primary Phone Number>"
    Then I enter secondary phone number "<Secondary Phone Number>"
    Then I enter email "<Email>"
    Then I enter address "<Address>"
    Then I enter town "<Town>"
    Then I enter postcode "<Postcode>"
    When I request to updated my profile data
    And "<First Name>","<Last Name>","<Primary Phone Number>","<Secondary Phone Number>","<Email>","<Address>","<Town>","<Postcode>" fields not meet the below validation requirements
    #And show validation requirements against those fields
   # And record will not be updated
    #And I will remain on the same page
    Examples:
    |First Name                                          |Last Name                                              |Primary Phone Number                                  |Secondary Phone Number|Email                  |Address       |Town    |Postcode |
    |EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ  415^&    |                                                       | +876789-*                                            | 0787*+               | Roopa#@wtg{com         |65byron Road |Lo&%-H  |         |
    |TestWTG%78*                                         | EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ123@vb  415^&*- |                                                   |07876545654           |rchitt120>~mail&&.com   |WEExxx.bcbhb | Tr , -;| we1234   |
    |                                                    | Web Technologies                                      | DHDgddsggg415fnhm56386+9xbvfyi689e0vhm,c.3w4678 415^&|078765456$%&BVH       |                        |             |DV&/.()jc| ha0 3pb |





