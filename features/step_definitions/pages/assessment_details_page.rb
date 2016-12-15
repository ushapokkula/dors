class AssessmentDetailsPage < SitePrism::Page

  element :mileage, "#mileage"
  element :expenses_cliamed, "#expenses"
  element :notes, "#notes"

  def verify_assessor_and_trainer_details(new_table)
    columns = new_table.map { |x| x['Details'] }
    for i in 1..columns.size
      expect(page).to have_content(columns[i])
    end
  end

  def verify_mileage_expenses_fields
    page.find("#mileage").should be_visible
    page.find("#expenses").should be_visible
  end


end