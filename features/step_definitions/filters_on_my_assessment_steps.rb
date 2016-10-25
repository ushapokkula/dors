And(/^I am on the My Assessments page$/)do
  expect(page).to have_content("My Assessments")
end

When(/^The default view of the page of My Assessments is loaded$/)do
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

When(/^I select "([^"]*)" on My Assessments page$/) do |status_filter|
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

Then(/^I see that the "([^"]*)" option is selected by default on My Assessments page$/)do|default_status|
  within(".dropdown-menu") do
    find("input[type='checkbox']:checked + label").text == default_status
    find("#assessmentStatusChk1").should be_checked
    find("#assessmentStatusChk0").should_not be_checked
  end
end


When(/^I select "([^"]*)" and "([^"]*)" on My Assessments page$/) do |status_filter1, status_filter2|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  if (status_filter1 == "REQUESTED" && status_filter2 == "APPROVED")

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

  else
    (status_filter1 == "REJECTED" && status_filter2 == "COMPLETED")

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

And(/^I can see "([^"]*)" section on My assessments page$/) do |section_header|
  expect(page).to have_css(".panel-title.panel-title-adj-btn strong", visible: true, text: section_header)
end

And(/^I can see course filter under "([^"]*)" section with label "([^"]*)"$/) do |section_header, course_label|
  within(".panel.panel-default") do
    expect(page).to have_css(".panel-title.panel-title-adj-btn strong", visible: true, text: section_header)
    expect(page).to have_css(".col-md-3.has-feedback>label", visible: true, text: course_label)
  end
end


Then(/^I see that the "([^"]*)" assessments are displayed which belong to the selected "([^"]*)"$/) do |type, course_name|
  if (type == "Requested")
    expect(page).to have_css("#assessment-title-header", visible: true, text: 'Assessment Request')
    expect((find_all(".col-md-offset-3.col-md-3 h4")[0]).text).to eq(course_name)
  else
    expect(page).to have_css("#assessment-title-header", visible: true, text: 'Assessment Outcome')
    expect((find_all(".col-md-offset-3.col-md-3 h4")[0]).text).to eq(course_name)
  end
end


Then(/^I see assessments matching with that course filter are displayed$/) do
  expect(page).to have_css(".dors-well-other", visible: true, minimum: 1)
end

Then(/^I see that the "([^"]*)" assessments are displayed which belong to the selected "([^"]*)","([^"]*)" and "([^"]*)"$/) do |type, course1, course2, course3|
  if (type == "Requested")
    expect(page).to have_css("#assessment-title-header", visible: true, text: 'Assessment Request')
    expect((find_all(".col-md-offset-3.col-md-3 h4")[0]).text).to eq(course1)
    expect((find_all(".col-md-offset-3.col-md-3 h4")[1]).text).to eq(course1)
  else
    expect(page).to have_css("#assessment-title-header", visible: true, text: 'Assessment Outcome')
    expect((find_all(".col-md-offset-3.col-md-3 h4")[0]).text).to eq(course1)
    expect((find_all(".col-md-offset-3.col-md-3 h4")[1]).text).to eq(course3)
  end
end


Then(/^I see the message "([^"]*)" on my assessments page$/) do |message|
  expect(page).to have_css(".alert.alert-info", visible: true, text: message)
end


And(/^I select assessment status depending on "([^"]*)"$/) do |type|
  if type == "Requested"
    find("#single-button").click
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk0", visible: true).click
    find("#assessmentStatusChk1", visible: true).click
  end
end