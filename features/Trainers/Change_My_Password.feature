@DR-443
Feature: Change Password for Assessor and Trainer
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
      |Assessor3|
      |Trainer2|
  @pass
  Scenario Outline: Enter the incorrect 'Current Password' and verify the validation message
    When I login as an "<user>"
    And I navigate to "MY PROFILE" page
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter the Confirm password as "<confirm_pwd>"
    And I click "Save"
    Then the system will highlight those fields
    And the system will show validation error message, "The password you entered is not correct. Please retry."
    And I will remain on the same page
    And password will not be changed
    Examples:
      |user     |current_pwd|password|confirm_pwd|
      |Assessor3| test@1234 |test@123 | test@123 |
      |Trainer2 | P@s5w0rd  |test@123| test@123  |

  Scenario Outline: Verify Password and confirm Password mismatch validation
    Given I login as an "<user>"
    And I navigate to "MY PROFILE" page
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter the Confirm password as "<confirm_pwd>"
    And I click "Save"
    When the new password and the confirmation of new password mismatch
    Then the system will highlight those fields
    And I will see a validation error message on the password confirmation field "Sorry, the passwords do not match."
    And I will remain on the same page
    And password will not be changed
    Examples:
      |user    |current_pwd|password|confirm_pwd|
      |Assessor3| test@123  |test@12?|test@?12   |
      |Trainer2|  test@123 |test@12?| test@?12  |


  Scenario Outline: enter Password value which not as in business rule and verify the validation when business rules fails
    Given I login as an "<user>"
    And I navigate to "MY PROFILE" page
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter the Confirm password as "<confirm_pwd>"
    And I click "Save"
    And the current password is correct
    When the new password does not meet the password policy requirement
    Then the system will highlight the validation error message on the new password field,"Sorry, the password does not meet the policy requirements."
    And I will be shown the password policy requirements
    And I will remain on the same page
    And password will not be changed
    Examples:
      |user    |current_pwd|password    |confirm_pwd|
      |Assessor3| test@123  |DDEE@123  |DDEE@123 |
      |Trainer2|  test@123 |test@12?    | test@?12  |

  @manual
  Scenario Outline: Password changed too recently
    Given I login as an "<user>"
    And I navigate to "MY PROFILE" page
    When I am on 'My Profile' page in default view
    Then I request to expand the 'Change password' section
    And I enter the current password as "<current_pwd>"
    And I enter Password as "<password>"
    And I enter the Confirm password as "<confirm_pwd>"
    And I click "Save"
    And I have changed my password within the last 24 hours
    Then I will see the your password changed recently message,"You will not be able to change your password at this point in time because it was recently changed. You will be able to change password on <15-Jun-2016 17:27>"
    Examples:
      |user|current_pwd|password    |confirm_pwd|
      |Assessor3| test@123  |test@12? |test@?12   |
      |Trainer2|  test@123 |test@12? | test@?12  |