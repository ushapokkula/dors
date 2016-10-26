@DR-390 @DR-11 @DR_1133 @pass
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

  @DR_1133 @pass
  Scenario Outline: Trainer Views My Licences Including Licence Types
    When I login as a "Trainer7" user
    Then I will be directed to my landing page (i.e. My Licences)
    And I can see a table with 4 columns
    And I can see table details provided via Trainer Portal are displayed as "<Scheme Name>","<Licence Type>","<Status>","<Expiry Date>"
    Examples:
      |Scheme Name                             |Licence Type |Status|  Expiry Date|
      |Driving For Change                      | Practical   |Full  |  18-Oct-2018|
      |National Driver Alertness Course        | Theory      |Full  |  18-Oct-2018|
      |Motorway Course                         | Theory      |Full  |  18-Oct-2018|
      |National Driver Alertness Course        | Theory      |Full  |  18-Oct-2018|
      |National Speed Awareness                | Theory      |Full  |  18-Oct-2018|
      |Speed Awareness                         | Theory      |Full  |  18-Oct-2018|
      |RiDE                                    | Theory      |Full  |  18-Oct-2018|
      |What's Driving Us?                      | Theory      |Full  |  18-Oct-2018|


  @DR_1133  @pass
  Scenario Outline: Verify practical only Licences Type on My Licences page
    When I login as a "Trainer8" user
    Then I will be directed to my landing page (i.e. My Licences)
    And I can see a table with 4 columns
    Then I can see "<Licence Type>" type "<Scheme Name>" course details in the table
    Examples:
      |Scheme Name                     |Licence Type|
      |Driving For Change              | Practical   |
      |National Driver Alertness Course| Practical   |






