@DR-443
Feature:
  As a user,
  I want to be able to change my password,
  so that I can ensure my account security and continued access to the system.

  Background:
     Given that I have licence.ndors.org.uk page opened
     When I logged into the Licence Portal
     Then My Profile page every user will have 2 collapsible sections
     And The first section will be labelled 'Change Password' which will be collapsed by default.
     And The other section will be labelled 'Profile details' and it will be expand by default.

    Scenario: Collapsible sections
      Then I access the My Profile page
      And  the system will show me details of my record and ability to update it under the 'Profile details' expanded section
      And the 'Change Password' section will be collapsed by default
      When I request to expand the Change Password section
      Then this section will be expanded and the Profile Details section will be collapsed

      Scenario: Current Password wrong
      When I have entered the password change data and click Save
      Then the current password is incorrect
      And  the field will be shown highlighted
      And  the system will show validation error message, "The password you entered is not correct. Please retry."
      And  I will remain on the same page with editable fields shown to retry

      Scenario: Password confirmation mismatch validation
       When I have entered the password change data and clicked Save
       Then the new password and the confirmation of new password mismatch
       And  the system will highlight the validation error on the password confirmation field
       And







