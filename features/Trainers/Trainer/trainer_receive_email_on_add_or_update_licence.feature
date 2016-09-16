@pass
@DR-797


Feature: Trainer receives email when licence(s) added or upadted

  Background:
    Given I have deleted all the emails in the test email inbox


  @add_one_licence_to_trainer @nologout
  Scenario Outline: Verify the email notification with subject and body when new licences are added to traienr record
    Given that I have licence.ndors.org.uk page opened
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    And I click "Create Trainer"
    And a Success message will be displayed for Create Trainer "New trainer successfully created"
    And I am on update trainer page
    When I add new licence with "Berks-Scheme" course and "Full" licence status
    And I click "Add licence"
    And I click "Update Trainer"
    Then a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I logout
    And I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>" after the changes.

    Examples:
      | Subject                                              | Email Body                                                                                                                                                       |
      | Your NDORS Trainer Licence schedule has been updated | This is to inform you that the licence schedule on your account on DORS+ Licence Portal has been updated. The details of your updated licence schedule are below |

  @add_multiple_licences_to_trainer @nologout
  Scenario Outline: Verify the email notification with subject and body when multiple licences are added to traienr record

    Given that I have licence.ndors.org.uk page opened
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    And I click "Create Trainer"
    And a Success message will be displayed for Create Trainer "New trainer successfully created"
    And I am on update trainer page
    When I add new licence with "Berks-Scheme" course and "Full" licence status
    And I click "Add licence"
    And I add new licence with "National Driver Alertness Course" course and "Full" licence status
    And I click "Add licence"
    And I add new licence with "Speed Control" course and "Full" licence status
    And I click "Add licence"
    And I click "Update Trainer"
    And a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I logout
    Then I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>" after the changes.
    And only one email is sent with the subject "<Subject>" after updating


    Examples:
      | Subject                                              | Email Body                                                                                                                                                       |
      | Your NDORS Trainer Licence schedule has been updated | This is to inform you that the licence schedule on your account on DORS+ Licence Portal has been updated. The details of your updated licence schedule are below |

  @update_multiple_licences_to_trainer  @nologout
  Scenario Outline: Verify the email notification with subject and body when multiple licences are updated to traienr record

    Given that I have licence.ndors.org.uk page opened
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    And I add new licence with "Berks-Scheme" course and "Full" licence status
    And I click "Add licence"
    And I add new licence with "National Driver Alertness Course" course and "Full" licence status
    And I click "Add licence"
    And I add new licence with "Speed Control" course and "Full" licence status
    And I click "Add licence"
    And I click "Create Trainer"
    And a Success message will be displayed for Create Trainer "New trainer successfully created"
    And I am on update trainer page
    When I update licence status of Berks-Scheme course to "Expired"
    And I update licence status of Driver Alertness course to "Expired"
    And I click "Update Trainer"
    And a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I logout
    Then I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>" after the changes.
    And only one email is sent with the subject "<Subject>" after updating

    Examples:
      | Subject                                              | Email Body                                                                                                                                                       |
      | Your NDORS Trainer Licence schedule has been updated | This is to inform you that the licence schedule on your account on DORS+ Licence Portal has been updated. The details of your updated licence schedule are below |


  @mark_trainer_as_inactive @nologout
  Scenario Outline: Verify the email notification with subject and body when trainer record is made inactive

    Given that I have licence.ndors.org.uk page opened
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    And I add new licence with "Berks-Scheme" course and "Full" licence status
    And I click "Add licence"
    And I add new licence with "National Driver Alertness Course" course and "Full" licence status
    And I click "Add licence"
    And I click "Create Trainer"
    And a Success message will be displayed for Create Trainer "New trainer successfully created"
    And I am on update trainer page
    When I set the trainer as inactive
    And I click "Update Trainer"
    And I click "Reject"
    And a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And the licence statuses  will be changed to "Surrendered"
    And I logout
    Then I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>" after the changes.

    Examples:
      | Subject                                              | Email Body                                                                                                                                                       |
      | Your NDORS Trainer Licence schedule has been updated | This is to inform you that the licence schedule on your account on DORS+ Licence Portal has been updated. The details of your updated licence schedule are below |


  @mark_trainer_as_rejected @nologout
  Scenario Outline: Verify the email notification with subject and body when trainer licence agreement is marked as rejected

    Given that I have licence.ndors.org.uk page opened
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    And I add new licence with "Berks-Scheme" course and "Full" licence status
    And I click "Add licence"
    And I add new licence with "National Driver Alertness Course" course and "Full" licence status
    And I click "Add licence"
    And I click "Create Trainer"
    And a Success message will be displayed for Create Trainer "New trainer successfully created"
    And I am on update trainer page
    When I select "Rejected" as licence agreement
    And I click "Update Trainer"
    And I click "Reject"
    And a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And the licence statuses  will be changed to "Surrendered"
    And I logout
    Then I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>" after the changes.

    Examples:
      | Subject                                              | Email Body                                                                                                                                                       |
      | Your NDORS Trainer Licence schedule has been updated | This is to inform you that the licence schedule on your account on DORS+ Licence Portal has been updated. The details of your updated licence schedule are below |


  @licence_expiry_date_changed @nologout
  Scenario Outline: Verify the email notification with subject and body when trainer licence expiry date is changed

    Given that I have licence.ndors.org.uk page opened
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I fill Mandatory fields with required details on create trainer form
    And I add new licence with "Berks-Scheme" course and "Full" licence status
    And I click "Add licence"
    And I add new licence with "National Driver Alertness Course" course and "Full" licence status
    And I click "Add licence"
    And I click "Create Trainer"
    And a Success message will be displayed for Create Trainer "New trainer successfully created"
    And I am on update trainer page
    When I change the expiry date of both the licences to "10/03/2018"
    And I click "Update Trainer"
    And a Success message will be displayed for Update Trainer "Trainer record successfully updated."
    And I logout
    Then I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>" after the changes.

    Examples:
      | Subject                                              | Email Body                                                                                                                                                       |
      | Your NDORS Trainer Licence schedule has been updated | This is to inform you that the licence schedule on your account on DORS+ Licence Portal has been updated. The details of your updated licence schedule are below |

  @completed_assessment  @nologout
  Scenario Outline: Verify the email notification with subject and body when trainer licence status is changed after completed assessment

    Given that I have licence.ndors.org.uk page opened
    Given I login as an "Compliance Manager"
    And I click "TRAINERS"
    And I search for "Tina" and "_Auto" in the trainer search field
    And licence status of Driver Awareness is "Provisional/Conditional"
    And I click "Update Trainer"
    And I logout
    And I login as an "Assessor_Completed"
    And I request assessment to be Booked
    And I logout
    And I login as an "Compliance Manager"
    And I search for Booked assessment
    And I click "Search"
    And the "Assessment Outcome" page will be displayed
    And I select "Competent" as outcome for both the trainers in the assessment
    And I click "Mark Complete"
    Then I see that the email is generated and sent to the registered email address  with "<Subject>" and "<Email Body>" once assessment is completed
    And two emails are received with the subject "<Subject>" after updating

    Examples:
      | Subject                                              | Email Body                                                                                                                                                       |
      | Your NDORS Trainer Licence schedule has been updated | This is to inform you that the licence schedule on your account on DORS+ Licence Portal has been updated. The details of your updated licence schedule are below |









