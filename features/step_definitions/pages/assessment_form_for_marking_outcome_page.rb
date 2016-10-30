class AssessmentFormForMarkingOutcomePage < SitePrism::Page
  elements :outcome_dropdown, ".dors-well-other select"


  def verify_outcomes(new_table)
    outcome_dropdown.each do |row|
      dropdown_elements=[]
      dropdown_elements=row.text
      columns = new_table.map { |x| x['Outcomes'] }
      for i in 1...columns.size
         expect(dropdown_elements).to match(/#{columns[i]}/i)

      end
    end
  end


  def verify_ability_to_mark_outcome
    select('Cancelled', :from => 'status-281')
    find("#status-281").value == 5
    select('Absent', :from => 'status-279')
    find("#status-279").value == 4
    select('Action Note', :from => 'status-392')
    find("#status-392").value == 2
  end

  def verify_compliance_notes
    find("#notes-281").visible?
    find("#notes-279").visible?
    find("#notes-392").visible?
  end

  def select_outcome_against_trainer
    select('Absent', :from => 'status-281')
    select('Absent', :from => 'status-279')
    select('Absent', :from => 'status-280')
  end


end