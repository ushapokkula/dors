And(/^I am on the My Assessments page$/)do
  expect(page).to have_content("My assessments")
end

When(/^The default view of the page of My assessments is loaded$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_link("REQUEST ASSESSMENT")
  @trainers.ngu_search_assessment_id_page.book_assessment
  expect(page).to have_selector(".alert.alert-success")
  click_link("MY ASSESSMENTS")
  expect(find(".assessment-status").text).to be == "Approved"
end

Then(/^I can see the assessment status filter with these following options on My Assessments page$/) do |table|
  new_table = table.hashes
  @trainers.filters_on_my_assessment_page.verify_status_filter_visibility_on_myassessments(new_table)
end

When(/^I select "([^"]*)" on My Assessments page$/)do |status_filter|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  if (status_filter == "APPROVED")

    @trainers.ngu_search_assessment_id_page.book_assessment
    expect(page).to have_selector(".alert.alert-success")
    click_link("MY ASSESSMENTS")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk1')

  elsif (status_filter == "REQUESTED")

    @trainers.ngu_search_assessment_id_page.request_assessment
    expect(page).to have_selector(".alert.alert-success")
    click_link("MY ASSESSMENTS")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk0')

  elsif (status_filter == "REJECTED")

    @trainers.ngu_search_assessment_id_page.request_assessment
    expect(page).to have_selector(".alert.alert-success")
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    fill_in("txt-assessment-id", :with => $requested_status)
    click_button("Search")
    click_button("Reject")
    fill_in("cancellationNotes", :with => "Notes for Rejection")
    click_button('Yes')
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    click_link("MY ASSESSMENTS")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk2')

  elsif (status_filter == "CANCELLED")

    @trainers.ngu_search_assessment_id_page.book_assessment
    expect(page).to have_selector(".alert.alert-success")
    click_link("MY ASSESSMENTS")
    click_button("View Details")
    click_button("Cancel Assessment")
    fill_in("cancellationNotes", :with => "Notes for cancellation")
    click_button('Yes')
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk3')

  else
    (status_filter == "COMPLETED")

    @trainers.ngu_search_assessment_id_page.book_assessment
    expect(page).to have_selector(".alert.alert-success")
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
    fill_in("txt-assessment-id", :with => $booked_status)
    click_button("Search")
    @trainers.assessment_form_for_marking_outcome_page.select_outcome_against_trainer
    click_button('Mark Complete')
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    click_link("MY ASSESSMENTS")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk4')
  end
end

Then(/^I see that the "([^"]*)" option is selected by default on my assessments page$/)do|default_status|
  within(".dropdown-menu") do
    find("input[type='checkbox']:checked + label").text == default_status
    find("#assessmentStatusChk1").should be_checked
    find("#assessmentStatusChk0").should_not be_checked
  end
end


When(/^I select "([^"]*)" and "([^"]*)" on My Assessments page$/)do |status_filter1,status_filter2|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  if (status_filter1 == "REQUESTED" && status_filter2 == "APPROVED" )

    @trainers.ngu_search_assessment_id_page.book_assessment
    expect(page).to have_selector(".alert.alert-success")
    @trainers.ngu_search_assessment_id_page.request_assessment
    expect(page).to have_selector(".alert.alert-success")
    click_link("MY ASSESSMENTS")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk0')
    check('assessmentStatusChk1')

  elsif (status_filter1 == "APPROVED" && status_filter2 == "REJECTED")

    @trainers.ngu_search_assessment_id_page.book_assessment
    expect(page).to have_selector(".alert.alert-success")
    @trainers.ngu_search_assessment_id_page.request_assessment
    expect(page).to have_selector(".alert.alert-success")
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    @trainers.filters_on_my_assessment_page.reject_assessment_on_myassessments
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    click_link("MY ASSESSMENTS")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk1')
    check('assessmentStatusChk2')


  elsif (status_filter1 == "REJECTED" && status_filter2 == "CANCELLED")

    @trainers.ngu_search_assessment_id_page.book_assessment
    expect(page).to have_selector(".alert.alert-success")
    @trainers.ngu_search_assessment_id_page.request_assessment
    expect(page).to have_selector(".alert.alert-success")
    @trainers.filters_on_my_assessment_page.cancel_assessment
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Compliance Manager")
    @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    @trainers.filters_on_my_assessment_page.reject_assessment_on_myassessments
    click_link("Sign out")
    @trainers.trainer_login_page.login_as("Assessor")
    expect(page).to have_css("#single-button")
    find("#single-button").click
    expect(page).to have_css("#single-button + .dropdown-menu")
    check('assessmentStatusChk2')
    check('assessmentStatusChk3')

  else (status_filter1 == "REJECTED" && status_filter2 == "COMPLETED")

  @trainers.ngu_search_assessment_id_page.book_assessment
  expect(page).to have_selector(".alert.alert-success")
  @trainers.ngu_search_assessment_id_page.request_assessment
  expect(page).to have_selector(".alert.alert-success")
  click_link("Sign out")
  @trainers.trainer_login_page.login_as("Compliance Manager")
  @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
  @trainers.filters_on_my_assessment_page.reject_assessment_on_myassessments
  @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
  @trainers.filters_on_assessment_management_page.completed_assessment
  @trainers.assessment_form_for_marking_outcome_page.select_outcome_against_trainer
  click_button('Mark Complete')
  expect(page).to have_selector(".alert.alert-success")
  click_link("Sign out")
  @trainers.trainer_login_page.login_as("Assessor")
  click_link("MY ASSESSMENTS")
  find("#single-button").click
  expect(page).to have_css("#single-button + .dropdown-menu")
  check('assessmentStatusChk3')
  check('assessmentStatusChk4')

  end

end