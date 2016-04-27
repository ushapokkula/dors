@DR-39
Feature: As an NGU,
  I want to be able to manually edit the details of an existing licence held by a trainer,
  so that licence record can be kept upto date.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "TRAINERS"
    Then I see "Trainers management" page

  @DR-39 @NGU-manually-editing-licences @bug-story
  Scenario Outline: Display error message when existing licences Full or Provisional status have expiry date in past
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see searched Trainer details
    And I change "<Expiry date>" in past for trainer which has Licence state of 'Full' or 'Provisional'
    Then the system will trigger the user with an error message "Sorry, the license has expired, please amend the status accordingly" on trainer page
    Examples:
   |Trainer Name |Expiry date|
    |roopa trainer|04/04/2016|

  @DR-39 @Editable_fields
  Scenario: Verify the Editable Licence Fields
    And I see the following default Licence status in Licence status dropdown
      |Licence Status|
      |---Please select---|
      |Provisional/Conditional|
      |Full                   |
      |Expired                |
      |Suspended              |
      |Revoked                |
      |Surrendered            |


  @DR-39 @NGU-manually-editing-licences
  Scenario Outline: Verify Expiry date for 'Expired' and 'Suspende' status
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see searched Trainer details
    And I select the "<Licence status>" as 'Expired' or 'Suspended'
    Then the system will default the Expiry Date to today's date
    And I can change today's date to any other "<date>" not in past
    Examples:
    |Trainer Name |Licence status |date      |
    |roopa trainer|Expired         |17/04/2017|
    |roopa trainer|Suspended     |17/04/2017|


  Scenario Outline: Verify Expiry date for 'Full' status
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see searched Trainer details
    And I select the status as to 'Full' from any other value
    Then the system will default the Expiry Date to 730 days from current date
    And I can change Expiry Date value to any other "<date>" not in past
    Examples:
      |Trainer Name |date      |
      |roopa trainer|17/04/2017|

  Scenario Outline: Verify Expiry date for 'Provisional' status
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see searched Trainer details
    And I select the "<Licence status>" as 'Provisional or Conditional'
    Then the system will default the Expiry Date to 183 days from current date
    And I can change Expiry Date to any other "<date>" as well not in past
    Examples:
    |Trainer Name |Licence status          |date|
    |roopa trainer|Provisional/Conditional|22/04/2017|

  Scenario Outline: Verify warning-message when expiry date more than 730 days
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see searched Trainer details
    And I manually set the "<Expiry Date>" to more than 730 days from system or current date
    Then the system will show a soft warning message, "You are setting the validity of this licence for more than 2 years. Please ensure your date selection is correct."
    Examples:
   |Trainer Name|Expiry Date|
   |roopa trainer|26/04/2019|

  Scenario Outline: Verify the 'updated message' after few changes
    When I start searching for existing "<Trainer Name>" in the trainer search field
    Then I should see searched Trainer details
    And I have made desired changes for "<Postcode>" and click 'Save'
    And the system will show a success message, "Trainer record successfully updated."
    And I will remain on the trainer's record page
    Examples:
    |Trainer Name |Postcode|
    |roopa trainer|HA9 7lm|

