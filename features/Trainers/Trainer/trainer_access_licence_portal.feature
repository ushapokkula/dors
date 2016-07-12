@DR-894 @DR-892 @pass
Feature:Trainer's login to Licence Portal with different Licence Agreement

  Background:
    Given that I have licence.ndors.org.uk page opened


  Scenario: Trainer's login to Licence Portal with Licence Agreement as Unspecified
    When I login as an "Compliance Manager"
    Then I navigate to "TRAINERS" page
    Then the system will load the page where I can create a new trainer record with required fields