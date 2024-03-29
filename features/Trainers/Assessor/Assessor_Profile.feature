@DR-13 @DR-817
Feature: Assessor Profile
  As an Assessor,
  I want to be able to edit my record on the system,
  so that all my contact details remain updated.

  @DR-549 @pass
  Scenario: Assessor cancels the profile update operation
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor3"
    And I navigate to "MY PROFILE" page
    Then I will be shown these fields of assessor record
      | Update Assessor Fields  |
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
  @pass
  Scenario: Verify Cancel button functionality on Profile Page
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor3"
    And I navigate to "MY PROFILE" page
    Then the system will load the page where I can update assessor record
    When I click Cancel button on profile page
    And I will be redirected to 'MY ASSESSMENTS' page
    Then unsaved changes will be lost

  @DR-594 @pass
  Scenario Outline: Validation error handling
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Assessor3"
    And I navigate to "MY PROFILE" page
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
      | Primary Phone Number                                  | Secondary Phone Number | Primary Email           | Secondary Email | Address       | Town      | Postcode |
      | +876789-*                                             | 0787*+                 | {^*Roopa#@wtg&com       |                 | 76hammersmith |           |          |
      |                                                       | 07876545654            | /_rchitt120>~mail&&.com |                 | WEExxx.bcbhb  | Tr@' , -; | w14 8ud  |
      | DHDgddsggg415fnhm56386+9xbvfyi689e0vhm,c.3w4678 415^& | 078765456$%&BVH        |                         |                 |               | DV&/.()jc | ha0  3pb |


#  @DR-860 @nologout @manual
#   Scenario Outline: Verify the email notification sent when assessor change their primary email address
#    Given I have deleted all the emails in the test email inbox
#    Given that I have licence.ndors.org.uk page opened
#    And I login as an "Assessor3"
#    And I navigate to "MY PROFILE" page
#    Given I am on accessors details page
#    And I see the primary email address as "<old email address>"
#    When I change the assessors primary address from 'old email address' to "<new email address>"
#    And I click "Update"
#    And changes have been successfully saved
#    Then I will receive the email notification with "<Subject>" and "<Body>"
#   And I see that email is sent To the address with <old email address>
#   And I see that email is Cced to the address with <new email address>
#
#
#    Examples:
#      | Subject                                             | Body                                                                                                                                                                                                                                                                | old email address     | new email address         |
#      | Your email address has been changed on DORS+ system | This is to notify you that the primary email address linked to your profile on the DORS+ system has been changed. If you have not made this change, please contact your employer or Support Desk immediately to prevent potential unauthorized use of your account. | dors_test@outlook.com | Roopa.Ramisetty@wtg.co.uk |


