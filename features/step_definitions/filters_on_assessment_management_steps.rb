Given(/^I am on the Assessments Management page$/) do
  expect(page).to have_css("h1", text: "Assessments")
end

When(/^The default view of the page is loaded$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_link("ASSESSMENT MANAGEMENT")
  expect(page).to have_content("There are no assessments to display.")
end

Then(/^I can see the assessment status filter with these following options$/) do |table|
  new_table = table.hashes
  @trainers.filters_on_assessment_management_page.verify_status_filter_visibility(new_table)
end

And(/^I see that the "([^"]*)" option is selected by default$/) do |status|
  within(".dropdown-menu") do
    find("input[type='checkbox']:checked + label").text == status
    find("#assessmentStatusChk0").should be_checked
    find("#assessmentStatusChk1").should_not be_checked
  end
end

When(/^I select "([^"]*)"$/) do |status_filter|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  if (status_filter == "APPROVED")
    click_link("Sign out")
    # @trainers.filters_on_assessment_management_page.verify_book_filter_status
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk1')

  elsif (status_filter == "REQUESTED")
    click_link("Sign out")
    # @trainers.filters_on_assessment_management_page.verify_request_filter_status
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.request_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk0')

  elsif (status_filter == "REJECTED")
    click_link("Sign out")
    # @trainers.filters_on_assessment_management_page.verify_reject_filter_status
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.request_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    fill_in("txt-assessment-id", :with => $requested_status)
    click_button("Search")
    click_button("Reject")
    fill_in("cancellationNotes", :with => "Notes for Rejection")
    click_button('Yes')
    expect(page).to have_css(".alert.alert-success")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk2')

  elsif (status_filter == "CANCELLED")
    click_link("Sign out")
    #@trainers.filters_on_assessment_management_page.verify_cancelled_filter_status
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
    fill_in("txt-assessment-id", :with => $booked_status)
    click_button("Search")
    click_button("Cancel")
    fill_in("cancellationNotes", :with => "Notes for cancellation")
    click_button('Yes')
    expect(page).to have_css(".alert.alert-success")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk3')

  else
    (status_filter == "COMPLETED")
    click_link("Sign out")
    # @trainers.filters_on_assessment_management_page.verify_completed_filter_status
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
    expect(page).to have_css("h1", text: "Assessments")
    fill_in("txt-assessment-id", :with => $booked_status)
    click_button("Search")
    @trainers.assessment_form_for_marking_outcome_page.select_outcome_against_trainer
    click_button('Mark Complete')
    expect(page).to have_css(".alert.alert-success")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk4')
  end
end

When(/^I select "([^"]*)" and "([^"]*)"$/) do |status_filter1, status_filter2|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  if (status_filter1 == "REQUESTED" && status_filter2 == "APPROVED")
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.ngu_search_assessment_id_page.request_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk0')
    check('assessmentStatusChk1')

  elsif (status_filter1 == "APPROVED" && status_filter2 == "REJECTED")
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.ngu_search_assessment_id_page.request_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    @trainers.filters_on_assessment_management_page.reject_assessment
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk1')
    check('assessmentStatusChk2')

  elsif (status_filter1 == "REJECTED" && status_filter2 == "CANCELLED")
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.ngu_search_assessment_id_page.request_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
    @trainers.filters_on_assessment_management_page.reject_assessment
    @trainers.filters_on_assessment_management_page.cancelled_assessment
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk2')
    check('assessmentStatusChk3')

  else
    (status_filter1 == "REJECTED" && status_filter2 == "COMPLETED")
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    @trainers.ngu_search_assessment_id_page.book_assessment
    @trainers.ngu_search_assessment_id_page.request_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    @trainers.filters_on_assessment_management_page.reject_assessment
    @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
    @trainers.filters_on_assessment_management_page.completed_assessment
    @trainers.assessment_form_for_marking_outcome_page.select_outcome_against_trainer
    click_button('Mark Complete')
    expect(page).to have_css("#single-button")
    find("#single-button").click
    check('assessmentStatusChk3')
    check('assessmentStatusChk4')

  end

end

# Then(/^Only those assessments will be shown with status as "([^"]*)"$/) do |status|
#     expect(page).to have_css(".dors-table")
#     expect(page.all(".dors-table").count).to be > 0
#     @trainers.filters_on_assessment_management_page.verify_assessment_status(status)
#
# end

Then(/^Only those assessments will be shown with status as "([^"]*)" on Assessment management page$/) do |status|
  expect(page).to have_css(".dors-table")
  expect(page.all(".dors-table").count).to be > 0
  @trainers.filters_on_assessment_management_page.verify_assessment_status(status)
end

Then(/^Only those assessments will be shown with status as "([^"]*)" and "([^"]*)" on Assessment management page$/) do |status1, status2|
  expect(page).to have_css(".dors-table")
  expect(page.all(".dors-table").count).to be > 0
  @trainers.filters_on_assessment_management_page.verify_combination_status(status1, status2)
end

Then(/^Only those assessments will be shown with status as "([^"]*)" on My assessments page$/) do |status|
  expect(page).to have_css(".dors-well-other")
  expect(page.all(".dors-well-other").count).to be > 0
  @trainers.filters_on_assessment_management_page.verify_assessment_status(status)
end

Then(/^Only those assessments will be shown with status as "([^"]*)" and "([^"]*)"$/) do |status1, status2|
  expect(page).to have_css(".dors-well-other")
  expect(page.all(".dors-well-other").count).to be > 0
  @trainers.filters_on_assessment_management_page.verify_combination_status(status1, status2)
end
