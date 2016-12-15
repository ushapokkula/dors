And(/^I am on the My Assessments page$/) do
  expect(page).to have_content("My Assessments")
end

When(/^The default view of the page of My Assessments is loaded$/) do
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

Then(/^I see that the "([^"]*)" option is selected by default on My Assessments page$/) do |default_status|
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
    expect(page).to have_css(".assessmentStatus", text: type, visible: true)
    expect((find_all(".col-md-offset-3.col-md-3 h4")[0]).text).to eq(course1)
    expect((find_all(".col-md-offset-3.col-md-3 h4")[1]).text).to eq(course2)
  else
    expect(page).to have_css("#assessment-title-header", visible: true, text: 'Assessment Outcome')
    expect(page).to have_css(".assessmentStatus", text: type, visible: true)
    expect((find_all(".col-md-offset-3.col-md-3 h4")[0]).text).to eq(course1)
    expect((find_all(".col-md-offset-3.col-md-3 h4")[1]).text).to eq(course2)
   end
end


Then(/^I see the message "([^"]*)" on my assessments page$/) do |message|
  expect(page).to have_css(".alert.alert-info", visible: true, text: message)
end


And(/^I select assessment status depending on "([^"]*)" on my assessments page$/) do |type|
  if type == "Requested"
    find("#single-button").click
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk0", visible: true).click
    find("#assessmentStatusChk1", visible: true).click
  else
   type == "Approved"
    find("#single-button", visible: true).click
    expect(page).to have_css("#single-button + .dropdown-menu", visible: true)
    find("#assessmentStatusChk1").should be_checked
  end
  end


And(/^the option to filter the list by "([^"]*)" is Displayed$/) do |force_filter_header|
  expect(page).to have_css(".clearfix>label", text: force_filter_header, visible: true)
end

And(/^The option to "([^"]*)" force areas is available with "([^"]*)" and "([^"]*)" buttons$/) do |include_all, yes_button, no_button|
  expect(page).to have_css(".pull-left>small", text: include_all, visible: true)
  #expect(page).to have_css(".clearfix >div> label:nth-child(2)", visible: true, text: yes_button)
  expect(page).to have_css(".clearfix >div> label:nth-child(2)", visible: true, text: yes_button)
  expect(page).to have_css("label.btn.btn-primary.active", visible: true, text: no_button)
  #expect(page).to have_css("label.btn.btn-primary.active", visible: true, text: no_button)

end

And(/^the option to include all force areas is available with "([^"]*)" and "([^"]*)" buttons$/) do |yes, no|
expect(page).to have_css("label.btn.btn-primary", text: yes )
expect(page).to have_css("label.btn.btn-primary.active", text: no )


end

And(/^I can see "(.*)" as default force in the force filter$/) do |force_name|
  expect(page).to have_css(".selectedForceAreaFilter", text: force_name, visible: true)
end

And(/^the results are displayed based on selected force force$/) do
  expect(page).to have_css(".dors-well-other", count: 1, visible: true)
  click_button("View Details")
  expect(page).to have_content("111333")

end

When(/^I apply single force "([^"]*)" in the force filter$/) do |force_name|
  @trainers.filters_on_my_assessment_page.x_button.click
  @trainers.filters_on_my_assessment_page.force_filter.set(force_name)
  @trainers.filters_on_my_assessment_page.force_filter.send_keys(:enter)
end

And(/^no others filters are applied$/) do
  @trainers.filters_on_my_assessment_page.course_filter.text.should.eq('')
  @trainers.filters_on_my_assessment_page.end_date_filter.text.should.eq('')
  today_date = (Date.today.strftime('%d/%m/%Y'))
  expect(find_field('txtStartDate').value).to eq(today_date)
  @trainers.filters_on_my_assessment_page.verify_no_assessment_status_filter
end

Then(/^The results listing will be updated showing only those assessments who fall under the selected force area$/) do
  expect(page).to have_css(".dors-well-other", visible: true, count: 1)
  click_button("View Details")
  sleep 3
  actual_trainers = @trainers.filters_on_my_assessment_page.trainer_name.map { |x| x.text }
  expect(actual_trainers).to match_array(["auto1 trainer", "auto2 trainer"])
end

When(/^I apply multiple forces like "([^"]*)" and "([^"]*)"in the force filter$/) do |force1, force2|
  @trainers.filters_on_my_assessment_page.x_button.click
  @trainers.filters_on_my_assessment_page.force_filter.set(force1)
  @trainers.filters_on_my_assessment_page.force_filter.send_keys(:enter)
  @trainers.filters_on_my_assessment_page.force_filter.set(force2)
  @trainers.filters_on_my_assessment_page.force_filter.send_keys(:enter)
end

When(/^I include all force areas by clicking "([^"]*)" button$/) do |yes_button|
  expect(page).to have_css(".clearfix >div> label:nth-child(2)", visible: true, text: yes_button)
  @trainers.filters_on_my_assessment_page.yes_button.click
end

Then(/^the assessments listing are displayed without applying any force area filters to the results$/) do
  expect(page).to have_css(".dors-well-other", visible: true, count: 2)
end

When(/^no force areas are included by clicking "([^"]*)" button$/) do |no_button|
  expect(page).to have_css(".clearfix >div> label:nth-child(3)", visible: true, text: no_button)
  all(".clearfix >div> label:nth-child(3)")[1].click
  #@trainers.filters_on_my_assessment_page.no_button.click
end

Then(/^no force area filters are applied to the results$/) do
 expect(page).to have_css(".selectedForceAreaFilter", visible:true,text:"ESSEX POLICE")
  expect(find("#txt-force-filter-search").text).to eq('')
  expect(page).to have_css(".dors-well-other",visible:true, count:1)
end

And(/^I request assessment as "([^"]*)" for trainers under "([^"]*)"$/) do |type, force_name|
  expect(page).to have_css("h1", text: 'Request Assessment')
  expect(page).to have_css(".selectedForceAreaFilter", text: "ESSEX POLICE")
  @trainers.filters_on_my_assessment_page.x_button.click
  @trainers.filters_on_my_assessment_page.force_filter.set("CHESHIRE")
  @trainers.filters_on_my_assessment_page.force_filter.send_keys(:enter)
  if force_name == "CHESHIRE" and type == "Approved"
    @trainers.filters_on_my_assessment_page.book_assessment_under_cheshire
  else
    @trainers.filters_on_my_assessment_page.force_filter.set(force_name)
    @trainers.filters_on_my_assessment_page.force_filter.send_keys(:enter)
    @trainers.filters_on_my_assessment_page.book_assessment_under_british_transport
  end
end

Then(/^The results listing will be updated showing only those assessments who fall under cheshire and british transport police force area$/) do
  expect(page).to have_css(".dors-well-other", visible: true, count: 1)
  click_button("View Details")
  expect(page).to have_css("h1", text: "Assessment Outcome")
  actual_trainers = @trainers.filters_on_my_assessment_page.trainer_name.map { |x| x.text }
  expect(actual_trainers).to match_array(["Heather Mcqueen_Auto", "Wendy Smith_Auto"])
end

And(/^only default force area assessments are displayed on my assessments page$/) do
  expect(page).to have_css(".dors-well-other", visible: true, count: 1)
  click_button("View Details")
  expect(page).to have_css("h1", text: "Assessment Outcome")
  actual_trainers = @trainers.filters_on_my_assessment_page.trainer_name.map { |x| x.text }
  expect(actual_trainers).to match_array(["Heather Mcqueen_Auto", "Bob Thorton_Auto","Wendy Smith_Auto"])
end
