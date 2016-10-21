@DR_400
  Feature:
    As an NGU,
    I want to able to filter records on Assessments Management page,
    so that I can focus on items of interest.

    Background:
      Given that I have licence.ndors.org.uk page opened
      When I login as an "Compliance Manager"
      Then I am on the Assessment Management page
      And I deleted the assessments from Database
      And I click "ASSESSMENT MANAGEMENT"
      Then I should see a message "There are no assessments to display."
      When I click 'Assessment Status' dropdown button
      Then I see 'Requested' status is in selected status
      And default Date range filter will have no selection

  Scenario: Verify defalut view of the Assessment Management page
    And I can see default Assessor filter on Assessment Management Page
    And default Assessor filter will have no selection


  Scenario Outline: search for assessors by Assessor name
    And I start typing atleast three characters as "<Assessor Name>" in the assessor search field
    Then The system will start autopredicting it and the list of assessor appears
    Examples:
      | Assessor Name|
      | dee         |
      | tes         |
      | ani         |


    Scenario Outline: Verify the validation message for 'no assessor exists' for invalid Trainer ID
      When I start typing invalid assessor name as "<Assessor Name>" in the assessor search field
      Then I see the message "No such assessor exists."
      Examples:
        |Assessor Name|
        |0123456sfvdbd|
        |111111testtest34|
        |00000000000000|


    Scenario Outline: Verify the format of displaying the list of names when assessor name is searched
      When I start typing atleast three characters as "<Assessor Name>" in the assessor search field
      Then The system will start autopredicting it and the list of assessor appears
      When I hit enter after typing first three characters of assessor name as "<Assessor Name>"
      Then searched assessor "<Name>" name includes assessor full name and assessor ID
      Then Assessor first name "<Name>" will be selected from the auto predict list
      Examples:
        | Assessor Name |Name                   |
        | dee          | deena grit (0123456)   |


    Scenario Outline: Verify trainer details by moving up and down arrow keys from auto-predict list
      And I start typing atleast three characters as "<Assessor Name>" in the assessor search field
      And The system will start autopredicting it and the list of assessor appears
      When I hit DOWN arrow key from the assessor auto predict list
      And I start typing atleast three characters as "<Assessor Name>" in the assessor search field
      And The system will start autopredicting it and the list of assessor appears
      When I hit UP arrow key from the assessor auto predict list
      Examples:
        | Assessor Name |
        | roo           |

    Scenario Outline: Verify 'no assessment records' are found in the database for selected filter criteria on assessment management page
      When I login as an "<Assessor1>"
      Then I navigate to "REQUEST ASSESSMENT" page
      And I deleted the assessments from Database
      Then I request assessment
      And I logout
      And I login as an "<Assessor2>"
      Then I navigate to "REQUEST ASSESSMENT" page
      And I deleted the assessments from Database
      Then I request assessment
      And I logout
      And I login as an "Compliance Manager"
      Then I navigate to "ASSESSMENT MANAGEMENT" page
      Then I am on the Assessments Management page
      When I click 'Assessment Status' dropdown button
      Then I see 'Requested' status is in selected status
      And I enter "<start date>" in start date field
      And I enter "<end date>" in End date field
      And I search with assessor "<First Name>" and "<Last Name>" in the assessor search field
      Then I should see a message "There are no assessments to display."
      Examples:
        |First Name          | Last Name      |start date|end date|Assessor1|Assessor2|
        | deena               |grit           |5/08/2016|09/11/2016| Assessor3|Assessor|
        |sudiv                |p              |5/08/2016|09/11/2016| Assessor3|Assessor|

      







