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
    When I start typing atleast three characters as "<Assessor Name>" in the assessor search field
    Then The system will start autopredicting it and the list of assessor appears
    Examples:
      | Assessor Name|
      | dee         |
      | tes         |
      | ani         |

    Scenario Outline: Verify the validation message for 'no assessor exists' for invalid Assessor name
      When I start typing invalid assessor name as "<Assessor Name>" in the assessor search field
      Then I see the message "No such assessor exists."
      Examples:
        |Assessor Name|
        |0123456sfvdbd|
        |111111testtest34|
        |0_0"Tes00000_u000|

    Scenario Outline: Verify the format of displaying the list of names when assessor name is searched
      When I start typing atleast three characters as "<Assessor Name>" in the assessor search field
      Then The system will start autopredicting it and the list of assessor appears
      When I hit enter after typing first three characters of assessor name as "<Assessor Name>"
      Then searched assessor "<Name>" name includes assessor full name and assessor ID
      Then Assessor first name "<Name>" will be selected from the auto predict list
      Examples:
        | Assessor Name |Name                 |
        |dee            |deena grit (0123456) |
        |sud            |sudiv p (11111)      |

    Scenario Outline: Verify Assessor details by moving up and down arrow keys from auto-predict list
      And I start typing atleast three characters as "<Assessor Name>" in the assessor search field
      And The system will start autopredicting it and the list of assessor appears
      When I hit DOWN arrow key from the assessor auto predict list
      And I start typing atleast three characters as "<Assessor Name>" in the assessor search field
      And The system will start autopredicting it and the list of assessor appears
      When I hit UP arrow key from the assessor auto predict list
      Examples:
        | Assessor Name |
        | roo           |

    Scenario Outline: Verify 'no assessment records' are found in the database for selected assessor filter criteria on assessment management page
      And I logout
      When I login as an "Assessor"
      Then I navigate to "REQUEST ASSESSMENT" page
      And I deleted the assessments from Database
      Then I request assessment
      And I logout
      And I login as an "Compliance Manager"
      Then I navigate to "ASSESSMENT MANAGEMENT" page
      When I am on the Assessment Management page
      Then I click 'Assessment Status' dropdown button
      And I see 'Requested' status is in selected status
      And I search with assessor "<Assessor Name>" in the assessor search field
      And I click "Apply" button
      Then I should see a message "There are no assessments to display."
      Examples:
        |Assessor Name|
        |ali mashadi  |
        |david abiom  |

    Scenario Outline: Verify assessment records for selected assessor in assessor filter on assessment management page
      And I logout
      When I login as an "Assessor"
      Then I navigate to "REQUEST ASSESSMENT" page
      And I deleted the assessments from Database
      Then I request assessment
      And I logout
      When I login as an "Assessor3"
      Then I navigate to "REQUEST ASSESSMENT" page
      Then I request assessment
      And I logout
      And I login as an "Compliance Manager"
      Then I navigate to "ASSESSMENT MANAGEMENT" page
      When I am on the Assessment Management page
      Then I click 'Assessment Status' dropdown button
      And I see 'Requested' status is in selected status
      And I search with assessor "<Assessor Name>" in the assessor search field
      And I click "Apply" button
      Then assessments will be shown which fall under selected Assessor "<Assessor Name>"

      Examples:
        |Assessor Name  |
        |deena grit     |
        |sudiv p        |

      







