class AssessmentManagementDefaultViewPage < SitePrism::Page
  elements :list_of_assessment_requests, ".dors-table"
  elements :assessment_dates, ""



  def verify_assessment_default_view_details(new_table)
    sleep 5
    columns = new_table.map { |x| x['Details'] }
    for i in 1..columns.size
      expect(page.text).to match(/#{columns[i]}/i)
    end
  end

  def verify_list_of_assessment_requests
    sleep 5
    list_of_assessment_requests.each do |row|
      expect(row.text).to include("Status Requested")
    end
  end

  def verify_assessment_ID
    expect(page.all(".text-md.primary-color").count).to be > 1
  end

  def verify_max_trainers
    list_of_assessment_requests.each do |row|
     expect(page.all(:xpath,"html/body/div[1]/div[2]/div[5]/div/div[2]/div/div[4]/div/div/div[1]").count).to be <=4
    end
  end

  def verify_approve_button(button)
    list_of_assessment_requests.each do |row|
       expect(row.text).to include("Approve")
       expect(page).to have_content("Approve")
    end
     expect(page.all(".btn.btn-sm.btn-primary").count).to be > 1
  end

  def verify_assessment_list_sorting
    actual_order= []
    assessment_dates.each do |row|
      assessment_dates= row.text
    end
    actual_order.push(assessment_dates)
    expected_order = []
    expected_order=actual_order.clone
     puts expect(actual_order).to match_array(expected_order)

  end
end