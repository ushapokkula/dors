@DR-861

  Feature: Email notificaton is recieved when primary email address is changed on supplier and police portal
    As a Police/Supplier user,
    I want to receive an email when the primary email address on my account is changed,
    so that I am alerted if this key info is changed by someone else in a fraudulent manner.


    Scenario: Verify the email notification received when primary email address is changed on supplier portal
      Given I am logged into the Supplier Portal
      And I login as "LSU User"
      And I click "My Account"
      And I click "Edit"
      When I change email address of LSU user from "swapna.gopu@wtg.co.uk" to "roopa.ramisetty@wtg.co.uk"
      And I click "Save"
      And I enter Password
      And I click "Save"
      And I see the message "User SwapnaLSU successfully edited" on my account page
      And I click "Finish"
      Then I will receive the email notification with "<Subject>" and "<Body>"
      And I see that email is sent to the old email address
      And CCed to the new email address








