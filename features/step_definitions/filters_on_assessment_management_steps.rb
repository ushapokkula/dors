Given(/^I am on the Assessments Management page$/) do
  expect(page).to have_content("Assessments")
end

When(/^The default view of the page is loaded$/) do
  expect(page).to have_css(".assessment-status")
end

Then(/^I can see the assessment status filter with these following options$/) do |table|
  new_table = table.hashes
  @trainers.filters_on_assessment_management_page.verify_status_filter_visibility(new_table)
end

And(/^I see that the "([^"]*)" option is selected by default$/) do |status|
  within(".dropdown-menu") do
    find("input[type='checkbox']:checked + label").text == status
   # find(:xpath, "html/body/div[1]/div[2]/div[2]/div/div/ul/li[1]/div/label").text == status
    find("#assessmentStatusChk0").should be_checked
    find("#assessmentStatusChk1").should_not be_checked
  end
end

When(/^I select "([^"]*)"$/) do |status_filter|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  if (status_filter == "APPROVED")
   # @trainers.filters_on_assessment_management_page.verify_book_filter_status
    @trainers.trainer_login_page.log_in("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.trainer_login_page.log_in("Compliance Manager")
    find("#single-button").click
    check('assessmentStatusChk1')

  elsif(status_filter == "REQUESTED")
   # @trainers.filters_on_assessment_management_page.verify_request_filter_status
  @trainers.trainer_login_page.log_in("Assessor")
  @trainers.ngu_search_assessment_id_page.request_assessment
  @trainers.trainer_login_page.log_in("Compliance Manager")
  find("#single-button").click
  check('assessmentStatusChk0')

  elsif (status_filter == "REJECTED")
   # @trainers.filters_on_assessment_management_page.verify_reject_filter_status
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

  elsif (status_filter == "CANCELLED")
    #@trainers.filters_on_assessment_management_page.verify_cancelled_filter_status
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

  else (status_filter == "COMPLETED")
 # @trainers.filters_on_assessment_management_page.verify_completed_filter_status
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

Then(/^Only those assessments will be shown with status as "([^"]*)"$/) do |status|
  sleep 3
  expect(find(".assessment-status").text).to be == (status)
end

