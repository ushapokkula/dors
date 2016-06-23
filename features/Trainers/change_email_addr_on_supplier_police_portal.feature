@DR-861

  Feature: Email notificaton is recieved when primary email address is changed on supplier and police portal
    As a Police/Supplier user,
    I want to receive an email when the primary email address on my account is changed,
    so that I am alerted if this key info is changed by someone else in a fraudulent manner.


    Scenario: Verify the email notification received when primary email address is changed on supplier portal
      Given I am logged into the Supplier Portal
      And I login as "LSU User"

