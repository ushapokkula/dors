@DR_400
  Feature:
    As an NGU,
    I want to able to filter records on Assessments Management page,
    so that I can focus on items of interest.

  Scenario Outline: search for assessments  by Assessor name
    And I login as an "Compliance Manager"
    When I navigate to "ASSESSMENT MANAGEMENT" page
    And I start typing atleast three characters as "<Assessor Name>" in the assessor search field
    Then The system will start autopredicting it and the list of assessor appears

    Examples:
      | Assessor Name|
      | bob         |
      | tes         |
      | roo         |


    Scenario Outline: Verify the validation message for 'no assessor exists' for invalid Trainer ID
      And I login as an "Compliance Manager"
      When I navigate to "ASSESSMENT MANAGEMENT" page
      When I start typing invalid trainer id as "<Assessor Name>" in the assessor search field
      Then I see the message "No such assessor exists."
      Examples:
        |Assessor Name|
        |120112012010|
        |111111111111111|
        |00000000000000|


    Scenario Outline: Verify the format of displaying the list of names when assessor name is searched
      And I login as an "Compliance Manager"
      When I navigate to "ASSESSMENT MANAGEMENT" page
      When I start typing atleast three characters as "<assessor Name>" in the assessor search field
      Then The system will start autopredicting it and the list of assessor appears
      When I hit enter after typing first three characters of assessor name as "<Assessor Name>"
      Then searched trainer "<Name>" name includes assessor full name and assessor ID
      Then The first name "<Name>" will be selected from the auto predict list
      Examples:
        | Assessor Name |Name                   |
        | dee          | deena grit (0123456)   |


    Scenario Outline: Verify trainer details by moving up and down arrow keys from auto-predict list
      And I login as an "Compliance Manager"
      When I navigate to "ASSESSMENT MANAGEMENT" page
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

      







