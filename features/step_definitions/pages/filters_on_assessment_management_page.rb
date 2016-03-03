class FiltersOnAssessmentManagementPage < SitePrism::Page

  elements :status_values, :xpath,  "html/body/div[1]/div[2]/div[2]/div/div/ul/li/div/label"

  def verify_status_filter_visibility(new_table)
    staus =[], actual_status_values = []
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
    @trainers.trainer_login_page.log_in("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.trainer_login_page.log_in("Compliance Manager")
    find("#single-button").click
    check('assessmentStatusChk1')
  end

  def verify_request_filter_status
    @trainers.trainer_login_page.log_in("Assessor")
    @trainers.ngu_search_assessment_id_page.request_assessment
    @trainers.trainer_login_page.log_in("Compliance Manager")
    find("#single-button").click
    check('assessmentStatusChk0')
  end

  def verify_reject_filter_status
    @trainers.trainer_login_page.log_in("Assessor")
    @trainers.ngu_search_assessment_id_page.request_assessment
    @trainers.trainer_login_page.log_in("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    fill_in("txt-assessment-id",:with=>$requested_status)
    click_button("Search")
    click_button("Reject")
    fill_in("cancellationNotes", :with=>"Notes for Rejection")
    click_button('Yes')
    find("#single-button").click
    check('assessmentStatusChk2')
  end

  def verify_cancelled_filter_status
    @trainers.trainer_login_page.log_in("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.trainer_login_page.log_in("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
    fill_in("txt-assessment-id",:with=>$booked_status)
    click_button("Search")
    click_button("Cancel")
    fill_in("cancellationNotes", :with=>"Notes for cancellation")
    click_button('Yes')
    find("#single-button").click
    check('assessmentStatusChk3')
  end

  def verify_completed_filter_status
    @trainers.trainer_login_page.log_in("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.trainer_login_page.log_in("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
    fill_in("txt-assessment-id",:with=>$booked_status)
    click_button("Search")
    @trainers.assessment_form_for_marking_outcome_page.select_outcome_against_trainer
    click_button('Mark Complete')
    find("#single-button").click
    check('assessmentStatusChk4')
  end
end