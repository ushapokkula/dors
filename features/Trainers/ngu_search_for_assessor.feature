@pass
@DR-193
Feature: As an NGU,
  I want to be able to search for an Assessor,
  so that I can view the assessor record I am interested in.

  Background:
    Given that I have licence.ndors.org.uk page opened
    And I login as an "Compliance Manager"
    And I click "ASSESSORS"

@field_visibility
  Scenario: Verify the visibility of assessor search field
    Then I see the search field on the page to search an assessor

@auto_predict1
  Scenario Outline: Verify the auto-predict search for assessor
    When I start typing atleast three characters as an "<Assessor Name>" in the search field
    Then The system will start autopredicting it and the list appears

    Examples:
      | Assessor Name |
      | var           |
      | heg           |
      | esh           |

  @auto_predict2
  Scenario Outline: Verify the format of displaying the list of names when assessor name is searched
    When I start typing atleast three characters as an "<Assessor Name>" in the search field
    And The system will start autopredicting it and the list appears
    Then The auto predicted dropdown list will display the names in this format "<Format>"

    Examples:
      | Assessor Name |Format|
      | zar           |zara turner (1111)|


  @auto_predict3
  Scenario: Verify the validation message when no record does'nt match the search criteria
    When The search criteria does'nt match any record on the database
    Then I see the message "No Assessor with this name exists"

  @auto_predict4
  Scenario Outline: Verify the default search assessor
    And I start typing atleast three characters as an "<Assessor Name>" in the search field
    And The system will start autopredicting it and the list appears
    When I hit enter after typing first three characters as "<Assessor Name>"
    Then The first name will be selected from the drop down list by default "<Default>"


    Examples:
      | Assessor Name | Default |
      | sud           | sudiv   |

  @auto_predict5
  Scenario Outline: Verify the assessor details by moving up and down arrow keys from auto-predict list
    And I start typing atleast three characters as an "<Assessor Name>" in the search field
    And The system will start autopredicting it and the list appears
    When I hit DOWN arrow key from the list
    Then The second value will be selected from the drop down list "<Down_Arrow>"
    When I hit UP arrow key from the list
    Then The first name will be selected from the drop down list "<UP_Arrow>"


    Examples:
      | Assessor Name | Down_Arrow |UP_Arrow|
      | sud           | sudiv123   |sudiv   |





