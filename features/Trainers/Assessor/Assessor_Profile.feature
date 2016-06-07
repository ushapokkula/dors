@DR-13 @DR-817 @pass
Feature:
  As an Assessor,
  I want to be able to edit my record on the system,
  so that all my contact details remain updated.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor3"
    And I navigate to "MY PROFILE" page

  @DR-549 @DR-594
    Scenario: Assessor cancels the profile update operation
      Then I will be shown these fields of my record
        | Update Assessor Fields |
        | Username               |
        | Assessor Number        |
        | First Name             |
        | Last Name              |
        | Primary Phone Number   |
        | Secondary Phone Number |
        | Primary Email Address  |
        |Secondary Email Address |
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
    Then I enter primary phone number field value as "<Primary Phone Number>"
    Then I enter secondary phone number field value as "<Secondary Phone Number>"
    Then I enter primary email address field value as "<Primary Email>"
    Then I enter secondary email address field value as "<Secondary Email>"
    Then I enter address field value as "<Address>"
    Then I enter town field value as "<Town>"
    Then I enter postcode field value as "<Postcode>"
    When I request to updated my profile data
    And "<Primary Phone Number>","<Secondary Phone Number>","<Primary Email>","<Secondary Email>","<Address>","<Town>","<Postcode>" fields not meet below validation requirements
    Then the system will highlight those fields
    And show "<validation requirements>" against those fields
    And record will not be updated
    And I will remain on the same page
    Examples:
    |First Name                                          |Last Name                                                 |Primary Phone Number                                  |Secondary Phone Number|Primary Email         |Secondary Email     |Address       |Town      |Postcode|
    |EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ  415^&    |                                                          | +876789-*                                            | 0787*+               |{^*Roopa#@wtg&com     |                     |76hammersmith |Lo&,.,-H |         |
    |TestWTG%78*                                         | EGDGDHDgddsggg41515 ...MN M MDDKJKDJIKJIJ123@vb  415^&*- |                                                      |07876545654           |/_rchitt120>~mail&&.com|                     |WEExxx.bcbhb | Tr@' , -;| w14 8ud |
    |                                                    | Web Technologies                                         | DHDgddsggg415fnhm56386+9xbvfyi689e0vhm,c.3w4678 415^&|078765456$%&BVH       |                       |                      |             |DV&/.()jc  | ha0  3pb |


