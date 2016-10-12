And(/^I request all assessments$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  2.times do
    @trainers.ngu_search_assessment_id_page.request_assessment
  end
end

Then(/^I will see  list of all Assessments Requests with status requested$/) do
  expect(page).to have_css(".title-header", text: 'Assessments')
  expect(page).to have_css(".btn.btn-sm.btn-primary", text: 'Approve', count: 2)
end

Then(/^Each assessment request will include following details$/) do |table|
  new_table=table.hashes
  @trainers.assessment_management_default_view_page.verify_assessment_default_view_details(new_table)
end

When(/^There are no assessments with status requested$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_link_or_button("ASSESSORS")
  click_link_or_button("ASSESSMENT MANAGEMENT")
end

And(/^Each request contains Assessment ID$/) do
  @trainers.assessment_management_default_view_page.verify_assessment_ID
end

And(/^Maximum trainers included are not more than four$/) do
  @trainers.assessment_management_default_view_page.verify_max_trainers
end

And(/^I see "([^"]*)"$/) do |link|
  expect(page).to have_css(".dors-table-header > div.col-md-3 > a ", text: link)
end

And(/^I see "([^"]*)" button$/) do |button|
  @trainers.assessment_management_default_view_page.verify_approve_button(button)
end

And(/^The assessment list will be sorted by assessment date$/) do
  @trainers.assessment_management_default_view_page.verify_assessment_list_sorting
end


And(/^assessor name and date are also displayed in the default view$/) do
  expect(page).to have_css(".assessor-name", visible: true)
  expect(page).to have_css(".assessment-date", visible: true)
end

And(/^I request assessment as "([^"]*)" of course type "([^"]*)"$/) do |assessment_type, licence_type|
  if (assessment_type == "Requested" && licence_type == "Theory")
    @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
    @trainers.ngu_search_assessment_id_page.request_assessment
  elsif (assessment_type == "Requested" && licence_type == "Practical")
    @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
    @trainers.assessment_management_default_view_page.request_assessment_with_practical
  elsif (assessment_type == "Booked" && licence_type == "Theory")
    @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
    @trainers.ngu_search_assessment_id_page.book_assessment
  else
    (assessment_type == "Booked" && licence_type == "Practical")
    @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
    @trainers.assessment_management_default_view_page.book_assessment_with_practical
  end
end

And(/^I login as "([^"]*)"$/) do |arg|
  pending
end

Then(/^I see licence type "([^"]*)" against the trainer for each "([^"]*)" assessment in the assessment management page$/) do |licence_type, assessment_type|
  if (licence_type == "Practical" and assessment_type == "Requested")
    expect(page).to have_css(".trainer-licences-tyoe", count: 1, text: licence_type)
  else
    expect(page).to have_css(".trainer-licences-tyoe", count: 2, text: licence_type)
  end
end

And(/^I reject\/cancel the Assessment depending on "([^"]*)"$/) do |assessment_type|
  @trainers.assessment_management_default_view_page.cancel_or_reject_assessment(assessment_type)
end

And(/^I select assessment status depending on "([^"]*)"$/) do |cancellation_type|
  find("#single-button").click
  if cancellation_type == "Rejected"
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk2", visible: true).click
  elsif cancellation_type == "Cancelled"
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk3", visible: true).click
  else
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk4", visible: true).click
  end
end

And(/^I select "([^"]*)" from assessment status dropdown$/) do |assessment_type|
  if assessment_type == "Approved"
    find("#single-button").click
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk1", visible: true).click
  else
    find("#single-button").click
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk4", visible: true).click
  end
end

And(/^I select possible outcome against each trainer depending on "([^"]*)"$/) do |type|
  if type == "Practical"
    select('Absent', :from => 'status-392')
    select('Absent', :from => 'status-280')
  else
    @trainers.assessment_form_for_marking_outcome_page.select_outcome_against_trainer
  end
end

Then(/^I see "([^"]*)" as column name$/) do |column_name|
  find_all(".dors-well-container").each do |row|
    #within(row.text)
    #find_all(".dors-well-container > div >div:nth-child(3) > div:nth-child(1)").each do |element|
    expect(page).to have_css(".dors-well-container > div >div:nth-child(3) > div:nth-child(1)", text: column_name, visible: true)
  end
end


And(/^I see "([^"]*)" under licence type column$/) do |type|
  find_all(".dors-well-container").each do |row|
    #within(row.text)
    #find_all(".dors-well-container > div >div:nth-child(3) > div:nth-child(1)").each do |element|
    expect(page).to have_css(".dors-well-container > div >div:nth-child(3) > div:nth-child(2)", text: type, visible: true)
  end
end

And(/^I can see the label "([^"]*)"$/) do |label_name|
  expect(page).to have_css(".trainer-licence-label", visible: true, text: label_name)
end