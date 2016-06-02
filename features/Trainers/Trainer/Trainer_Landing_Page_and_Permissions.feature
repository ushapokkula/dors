@DR-390 
Feature:
  As a trainer user of the Licence Portal,
  I want to be able to have access to my licence page and my profile page after logging in,
  so that I can verify the information is correct.

  Background:
    Given that I have licence.ndors.org.uk page opened
    When I login as a "Trainer" user

  Scenario: Trainer landing page and permissions
      Then I will be directed to my landing page (i.e. My Licences)
       And I will also have access to 'My Profile' page from the navigation menu

  Scenario: Trainer landing page and permissions
      When I access any system resource that I am not authorized to access
      Then I will be directed to my landing page (i.e. My Licences)



