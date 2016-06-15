@DR-443
Feature: Change Password for Assessor and Trainer
As a user,
I want to be able to change my password,
so that I can ensure my account security and continued access to the system.

  Background:
    Given that I have licence.ndors.org.uk page opened

  Scenario Outline: Collapsible sections
    When I login as an "<User>"
    And I navigate to "MY PROFILE" page
    Then the system will show user 'Profile details' in expand section
    And the 'Change password' section will be collapsed by default
    When I request to expand the 'Change password' section
    Then 'Change password' section will be expanded
    And 'Profile details' section will be collapsed
    Examples:
      |User|
      |Assessor|
      |Trainer1|

  Scenario Outline: Current Password Wrong
    When I login as an "<User>"
    And I navigate to "MY PROFILE" page
    Then I request to expand the 'Change password' section
    And I entered the password change data as "<current_pwd>","<password>","<confirm_pwd>"
    And I click "Save"
    When the current password is incorrect
    Then the system will highlight those fields
    And the system will show validation error message, "The password you entered is not correct. Please retry."
    And I will remain on the same page
    And password will not be changed
    Examples:
      |User     |current_pwd|password|confirm_pwd|incorrect_password|
      |Assessor3| test@1234 |test@123 | test@123 |test123@          |
      |Trainer1 | P@s5w0rd  |test@123| test@123  |test@123          |


  Scenario Outline: Password confirmation mismatch validation
    Given I login as an "<User>"
    And I navigate to "MY PROFILE" page
    And I entered the password change data as "<current_pwd>","<password>","<confirm_pwd>"
    And I click "Save"
    When the new password and the confirmation of new password mismatch
    Then the system will highlight those fields
    And I will see a validation error message on the password confirmation field "Sorry, the passwords do not match."
    And I will remain on the same page
    And password will not be changed
    Examples:
      |User    |current_pwd|password|confirm_pwd|
      |Assessor| test@123  |test@12?|test@?12   |
      |Trainer1|  test@123 |test@12?| test@?12  |


  Scenario Outline: Password validation business rules fail
    Given I login as an "<User>"
    And I navigate to "MY PROFILE" page
    And I entered the password change data as "<current_pwd>","<password>","<confirm_pwd>"
    And I click "Save"
    And the current password is correct
    When the new password does not meet the password policy requirement
    Then the system will highlight the validation error message on the new password field,"Your new password is invalid. Please ensure it meets the password policy requirements."
    And I will be shown the password policy requirements
    And I will remain on the same page
    And password will not be changed
    Examples:
      |User    |current_pwd|password    |confirm_pwd|
      |Assessor| test@123  |test@12?    |test@?12   |
      |Trainer1|  test@123 |test@12?    | test@?12  |


  Scenario Outline: Password changed too recently
    Given I login as an "<User>"
    And I navigate to "MY PROFILE" page
    When I am on 'My Profile' page in default view
    Then I request to expand the 'Change password' section
    And I entered the password change data as "<current_pwd>","<password>","<confirm_pwd>"
    And I click "Save"
    And I have changed my password within the last 24 hours
    Then I will see the your password changed recently message,"You will not be able to change your password at this point in time because it was recently changed. You will be able to change password on <15-Jun-2016 17:27>"
    Examples:
      |User|current_pwd|password    |confirm_pwd|
      |Assessor| test@123  |test@12? |test@?12   |
      |Trainer1|  test@123 |test@12? | test@?12  |