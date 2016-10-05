@DR-390 @DR-11 @pass
Feature: Trainer Landing Page
  As a trainer user of the Licence Portal,
  I want to be able to have access to my licence page and my profile page after logging in,
  so that I can verify the information is correct.

  Background:
    Given that I have licence.ndors.org.uk page opened

  Scenario: Trainer landing page and permissions
    When I login as a "Trainer1" user
      Then I will be directed to my landing page (i.e. My Licences)
       And I will also have access to "MY PROFILE" page from the navigation menu

  Scenario: Trainer landing page and permissions
    When I login as a "Trainer1" user
      When I access any system resource that I am not authorized to access
      Then I will be directed to my landing page (i.e. My Licences)

  Scenario: verify No Licenses Message
    When I login as a "Trainer2" user
    Then I should see "There are no licence records for you on the DORS+ system. If you believe this is incorrect, please contact your employer or NDORS Corporate Compliance Unit." No Licenses Message

  @DR_1133
  Scenario Outline: Trainer Views My Licences Including Licence Types
    When I login as a "Trainer1" user
    Then I will be directed to my landing page (i.e. My Licences)
    And I can see Legend shown with "<Icon>" Icon
    And I can see added licences
    And I can see table has below "<Scheme Name>", "<Scheme Type>", "<Expiry Date>" details provided via Trainer Portal
    And I can see below "<Scheme Type>" details provided via Trainer's Trainer Portal
    Examples:
    |Scheme Name|Scheme Type|Expiry Date|Icon|
    |           |           |           |    |
    |           |           |           |    |


#    And scheme type will show "Theory" or "Practical"
#    Then I can see a table with '4' columns
#    And I can see Scheme Name
#    And I can see Scheme Type
#    And I can see Expiry Date










