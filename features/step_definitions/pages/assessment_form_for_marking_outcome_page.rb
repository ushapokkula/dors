class AssessmentFormForMarkingOutcomePage < SitePrism::Page
  elements :outcome_dropdown, ".dors-well-other select"

  def verify_outcomes(new_table)
    outcome_dropdown.each do |row|
      dropdown_elements=[]
      dropdown_elements=row.
      columns= new_table.map { |x| x['Outcomes'] }
      for i in 1...columns.size
        expect(dropdown_elements).to match(/#{columns[i]}/i)
      end
    end
  end


  def verify_ability_to_mark_outcome
    select('Cancelled', :from => 'status-111333/001')
    find("#status-111333/001").value == "5"
    select('Absent', :from => 'status-111222/001')
    find("#status-111222/001").value == "4"
    select('Action Note', :from => 'status-111555/003')
    find("#status-111555/003").value == "2"
  end

  def verify_compliance_notes
    find("#notes-111333/001").visible?
    find("#notes-111222/001").visible?
    find("#notes-111555/003").visible?
  end

  def select_outcome_against_trainer
    select('Absent', :from => 'status-111333/001')
    select('Absent', :from => 'status-111222/001')
    select('Absent', :from => 'status-111555/003')
  end


end