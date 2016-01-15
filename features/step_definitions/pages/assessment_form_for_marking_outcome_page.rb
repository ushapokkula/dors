class AssessmentFormForMarkingOutcomePage < SitePrism::Page
  elements :outcome_dropdown, ".dors-well-other select"

  def verify_outcomes(new_table)
    outcome_dropdown.each do |row|
      dropdown_elements=[]
      dropdown_elements=row.text
      columns= new_table.map { |x| x['Outcomes'] }
      for i in 1...columns.size
        expect(dropdown_elements).to match(/#{columns[i]}/i)
      end
    end
  end


  def verify_ability_to_mark_outcome
    select('Cancelled', :from => 'status-SWAP124')
    find("#status-SWAP124").value == "5"
    select('Absent', :from => 'status-DOA123')
    find("#status-DOA123").value == "4"
    select('Action Note', :from => 'status-CIA624')
    find("#status-CIA624").value == "2"
  end

  def verify_compliance_notes
    find("#notes-SWAP124").visible?
    find("#notes-DOA123").visible?
    find("#notes-CIA624").visible?
  end

  def select_outcome_against_trainer
    select('Absent', :from => 'status-SWAP124')
    select('Absent', :from => 'status-DOA123')
    select('Absent', :from => 'status-CIA624')
  end


end