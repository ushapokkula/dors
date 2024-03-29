class FiltersOnAssessmentManagementPage < SitePrism::Page

  elements :status_values,  "#single-button+ul li label"      #   :xpath,  "html/body/div[1]/div[2]/div[2]/div/div/ul/li/div/label"

  elements :assessment_status, ".assessment-status"

  def verify_status_filter_visibility(new_table)
    status =[], actual_status_values = []
     page.has_css?("#single-button")
    find("#single-button").text == "Assessment Status"
    find("#single-button").click
     expect(page).to have_css(".dropdown-menu")
    status_values.each do |values|
      status = values.text
      actual_status_values.push(status)
    end
     expect(new_table.map { |x| x['Expected Status Filters'] }).to match_array(actual_status_values)
  end

  def verify_book_filter_status
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.trainer_login_page.login_as("Compliance Manager")
    find("#single-button").click
    check('assessmentStatusChk1')
  end

  def verify_request_filter_status
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.request_assessment
    @trainers.trainer_login_page.login_as("Compliance Manager")
    find("#single-button").click
    check('assessmentStatusChk0')
  end

  def reject_assessment
    expect(page).to have_css("#txt-assessment-id")
    fill_in("txt-assessment-id",:with=>$requested_status)
    click_button("Search")
    expect(page).to have_css("h1",text: "Assessment Request")
    click_button("Reject")
    fill_in("cancellationNotes", :with=>"Notes for Rejection")
    click_button('Yes')
  end

  def cancelled_assessment
    fill_in("txt-assessment-id",:with=>$booked_status)
    click_button("Search")
    click_button("Cancel")
    fill_in("cancellationNotes", :with=>"Notes for cancellation")
    click_button('Yes')

  end

  def verify_assessment_status(status)
    assessment_status.each do |row|
     expect(row.text).to be == (status)
    end
  end

  def completed_assessment
    fill_in("txt-assessment-id",:with=>$booked_status)
    click_button("Search")

  end

  def verify_combination_status(status1,status2)
    status_array= [status1,status2]
    assessment_status.each do |status|
      actual_status = status.text
      expect(status_array).to include(actual_status)
    end
  end
end