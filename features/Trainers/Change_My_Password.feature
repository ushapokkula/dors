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
    And the change password section will be collapsed by default
    When I request to expand the change password section
    Then change password section will be expanded
    And profile details section will be collapsed
    Examples:
      |User|
      |Assessor|
      |Trainer1 |

  Scenario Outline: Current Password Wrong
    Given I login as an "<User>"
    And I entered the password change data
    And I click "Save"
    When the current password is incorrect
    Then the field will be shown highlighted
    And the system will show validation error message, "The password you entered is not correct. Please retry."
    And I will remain on the same page
    And password will not be changed
    Examples:
      |User|
      |Assessor|
      |Trainer1|

  Scenario Outline: Password confirmation mismatch validation
    Given I login as an "<User>"
    And I entered the password change data
    And I click "Save"
    When the new password and the confirmation of new password mismatch
    Then the system will highlight the validation error on the password confirmation field
    And I will see a message "The passwords must match."
    And I will remain on same page
    And password will not changed
    Examples:
      |User|
      |Assessor|
      |Trainer1|

  Scenario Outline: Password validation business rules fail
    Given I login as an "<User>"
    And I entered the password change data
    And I click "Save"
    And the current password is correct
    When the new password does not meet the password policy requirement
    Then the system will highlight the validation error on the new password fields and show a message, "Your new password is invalid. Please ensure it meets the password policy requirements."
    And I will be shown the password policy requirements
    And I will remain on the same page
    And password will not changed
    Examples:
      |User|
      |Assessor|
      |Trainer1|

  Scenario Outline: Password changed too recently
    Given I login as an "<User>"
    When I am on 'My Profile' page in default view
    Then I request to expand the Change Password section
    And  I have changed my password within the last 24 hours
    Then I will see the below message in this section
    Examples:
      |User|
      |Assessor|
      |Trainer1|