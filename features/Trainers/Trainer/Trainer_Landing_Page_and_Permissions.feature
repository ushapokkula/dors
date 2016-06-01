@DR-390
Feature:
  As a trainer user of the Licence Portal,
  I want to be able to have access to my licence page and my profile page after logging in,
  so that I can verify the information is correct.

  Scenario:
    Given that I have licence.ndors.org.uk page opened
    When I login as a "Trainer" user
    Then I will be directed to my landing page (.e. My Licences)
    And  I will also have access to 'My Profile' page from the navigation menu
    When I access any system resource that I am not authorized to access
    Then I will be directed to my landing page (i.e. My Licences)


