class AssessmentManagementDefaultViewPage < SitePrism::Page
  elements :list_of_assessment_requests, ".dors-table"
  elements :assessment_dates, ".assessment-date"


  def verify_assessment_default_view_details(new_table)
    list_of_assessment_requests.each do |row|
    columns = new_table.map { |x| x['Details'] }
    columns.each do |label|
        expect(page).to have_text(label)
      end
    end
  end

  def verify_assessment_ID
    expect(page.all(".dors-table-row").count).to be >= 1
  end


  def verify_max_trainers
    list_of_assessment_requests.each do |row|
      expect(page.all(".trainer-full-name").count).to be <=4
    end
  end

  def verify_approve_button(button)
    list_of_assessment_requests.each do |row|
      expect(row.text).to include("Approve")
    end
    expect(page.all(".btn.btn-sm.btn-primary").count).to be >= 1
  end

  def verify_assessment_list_sorting
    actual_order= []
    assessment_dates.each do |row|
      assessment_dates= row.text
    end
    actual_order.push(assessment_dates)
    expected_order = []
    expected_order=actual_order.clone
    expected_order.sort
    expect(actual_order).to match_array(expected_order)

  end

end



