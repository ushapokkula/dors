@DR_1150
  Feature: View and Update Licence Type on Trainer Record (Trainer Portal)

    Scenario:
      Given I am in the Trainers area of the Trainer portal
      And I find a trainer via the search
      When I am in the Licenses section
      Then I can see a Course Name label
      And in the licenses section, I can see a Legend is shown stating: "[glyphicon-road icon] = Practical Course Trainer [glyphicon-bookicon] = Theory Course Trainer"
      And next to the trainers licenses, an icon is shown before the name of the license (not shown in the screenshot)
      And the icon reflects the course type (as shown in the table <Type>) in the dropdown