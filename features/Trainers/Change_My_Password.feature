@DR-443
Feature: Change Password of (Assessor || Trainer)
As a user,
I want to be able to change my password,
so that I can ensure my account security and continued access to the system.

  Background:
    Given that I have licence.ndors.org.uk page opened

  Scenario Outline: Collapsible sections
    When I login as an "<user>"
    And I navigate to "MY PROFILE" page
    Then the system will show user 'Profile details' in expand section
    And the 'Change password' section will be collapsed by default
    When I request to expand the 'Change password' section
    Then 'Change password' section will be expanded
    And 'Profile details' section will be collapsed
    Examples:
      |user|
      |Assessor|
      |Trainer2|

  Scenario Outline: Entered incorrect 'Current Password' and verify that field validation message
    When I login as an "<user>"
    And I navigate to "MY PROFILE" page
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter Confirm password as "<confirm_pwd>"
    And I click "Save"
    Then the system will highlight those fields
    And the system will show validation error message, "The password you entered is not correct. Please retry."
    And I will remain on the same page
    And password will not be changed
    Examples:
      |user     |current_pwd|password|confirm_pwd|
      |Assessor| test@1234 |test@123 | test@123 |
      |Trainer2| test!1234  |test@123| test@123 |


  Scenario Outline: Verify validation message when Password and confirm Password mismatches
    Given I login as an "<user>"
    And I navigate to "MY PROFILE" page
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter Confirm password as "<confirm_pwd>"
    And I click "Save"
    When the new password and the confirmation of new password mismatch
    Then the system will highlight those fields
    And I will see a validation error message on the password confirmation field "Sorry, the passwords do not match."
    And I will remain on the same page
    And password will not be changed
    Examples:
      |user    |current_pwd|password|confirm_pwd|
      |Assessor| test@123  |auto_test123|test#!&12|
      |Trainer2| test@123  |auto_test123|test#!&12|


  Scenario Outline: verify Password  message when Password value not as per business rule
    Given I login as an "<user>"
    And I navigate to "MY PROFILE" page
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter Confirm password as "<confirm_pwd>"
    And I click "Save"
    And the current password is correct
    When the new password does not meet the password policy requirement
    Then the system will highlight the validation error message on the password field,"Sorry, the password does not meet the policy requirements."
    And I will be shown the password policy requirements
    And I will remain on the same page
    And password will not be changed
    Examples:
      |user     |current_pwd|password  |confirm_pwd|
      |Assessor3| test@443test |Deena@12334|Deena@12334|
      |Trainer2 | test@443test |Roopa@12334|Roopa@12334 |


  @manual
  Scenario Outline: Successfully updating Assessor or Trainer Password
    Given I login as an "<user>"
    And I navigate to "MY PROFILE" page
    When I am on 'My Profile' page in default view
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter Confirm password as "<confirm_pwd>"
    And I click "Save"
    Then I see a message saying "your password successfully updated"
    And I will be re directed to "<home_page>" page
    Examples:
      |user     |current_pwd|password |confirm_pwd|home_page     |
      |Assessor5| P@ssw0rd5  |test@12? |test@12?   |My assessments|
      |Trainer3 | P@s5w0rd3  |test@?12 | test@?12  |My Licenses   |


  @manual
  Scenario Outline: Verify Password changed too recently message (within the last 24 hours)
    Given I login as an "<user>"
    And I navigate to "MY PROFILE" page
    When I am on 'My Profile' page in default view
    Then I request to expand the 'Change password' section
    Then I will see the your password changed recently message,"You will not be able to change your password at this point in time because it was recently changed. You will be able to change password on #{<15-Jun-2016 17:27>}#"
    Examples:
      |user     |
      |Assessor5|
      |Trainer3 |

    @manual
    Scenario Outline: