
@DR-861

Feature: Email notification is received when primary email address is changed on supplier and police portal
  As a Police/Supplier user,
  I want to receive an email when the primary email address on my account is changed,
  so that I am alerted if this key info is changed by someone else in a fraudulent manner.

  Given I am logged into the "<portal>" Portal

  @email_notification @nologout
  Scenario Outline: Verify the email notification received when primary email address is changed on supplier portal
    Given I am logged into the "<portal>" Portal
    And I login as "<user>" user
    And I click "My Account"
    Given the primary address on "<portal>" is "<old_email_address>"
    And I click Edit button
    When I change email address of "<user>" user from "<old_email_address>" to "<new_email_address>"
    And I click Review button
    And I click Save button
    And I enter password to authenticate
    And I click Save button
    And I see the message "<success_message>" on my account page
    And I click Finish
    Then I will receive the email notification with "<subject>" and "<body>"
    And I see that email is sent To the <old email> address with <old_email_address>
    And I see that email is Cced to the <new email> address with <new_email_address>

    Examples:
      | portal   | user | old email   | old_email_address     | new email       | new_email_address         | success_message                    | subject                                             | body                                                                                                                                                                                                                                                                |
      | police   | LFU  | Swapna Gopu | Swapna.Gopu@wtg.co.uk | Roopa Ramisetty | Roopa.Ramisetty@wtg.co.uk | User SwapnaLFU successfully edited | Your email address has been changed on DORS+ system | This is to notify you that the primary email address linked to your profile on the DORS+ system has been changed. If you have not made this change, please contact your employer or Support Desk immediately to prevent potential unauthorized use of your account. |

      | police   | LFA  | Swapna Gopu | Swapna.Gopu@wtg.co.uk | Roopa Ramisetty | Roopa.Ramisetty@wtg.co.uk | User SwapnaLFA successfully edited | Your email address has been changed on DORS+ system | This is to notify you that the primary email address linked to your profile on the DORS+ system has been changed. If you have not made this change, please contact your employer or Support Desk immediately to prevent potential unauthorized use of your account. |

      | supplier | LSA  | Swapna Gopu | Swapna.Gopu@wtg.co.uk | Roopa Ramisetty | Roopa.Ramisetty@wtg.co.uk | User SwapnaLSA successfully edited | Your email address has been changed on DORS+ system | This is to notify you that the primary email address linked to your profile on the DORS+ system has been changed. If you have not made this change, please contact your employer or Support Desk immediately to prevent potential unauthorized use of your account. |

      | supplier | LSU  | Swapna Gopu | Swapna.Gopu@wtg.co.uk | Roopa Ramisetty | Roopa.Ramisetty@wtg.co.uk | User SwapnaLSU successfully edited | Your email address has been changed on DORS+ system | This is to notify you that the primary email address linked to your profile on the DORS+ system has been changed. If you have not made this change, please contact your employer or Support Desk immediately to prevent potential unauthorized use of your account. |










