And(/^I type the Booked Assessment ID in the Assessment search field$/) do
  @trainers.trainer_login_page.login_as("Assessor")
  @trainers.ngu_search_assessment_id_page.search_booked_assessment_id
  click_link_or_button("Sign out")
  @trainers.trainer_login_page.login_as("Compliance Manager")
  fill_in('txt-assessment-id', :with => $booked_status)

end

And(/^The system will load the detailed information for assessment record in view mode$/) do
  expect(page).to have_css(".dors-table-row.row")
end

Then(/^The system will load the following information for assessment record in view mode$/) do |table|
  new_table=table.hashes
  @trainers.ngu_search_assessment_id_page.verify_assessment_outcome_details(new_table)
end

Then(/^The page will include Mark Complete and Cancel button$/) do
  @trainers.ngu_search_assessment_id_page.select_outcome
  expect(page).to have_button('Mark Complete', visible: true)
  expect(page).to have_button('Cancel', visible: true)
end

Then(/^the page include Outcome dropdown$/) do
  expect(page).to have_select('status-281', :with_options => ['Absent', 'Action Note', 'Cancelled', 'Competent', 'Compliance Note'])
  expect(page).to have_select('status-279', :with_options => ['Absent', 'Action Note', 'Cancelled', 'Competent', 'Compliance Note'])
  expect(page).to have_select('status-392', :with_options => ['Absent', 'Action Note', 'Cancelled', 'Competent', 'Compliance Note'])
end

And(/^I type the Request Assessment ID in the Assessment search field$/) do
  @trainers.ngu_search_assessment_id_page.search_requested_assessment_id
end

And(/^I request assessment as Booked$/) do
  @trainers.ngu_search_assessment_id_page.search_booked_assessment_id
end

And(/^I request assessment as Requested$/) do
  @trainers.ngu_search_assessment_id_page.search_requested_assessment_id
end

And(/^I login as Compliance Manager and click assessment management tab to search booked assessments$/) do
  @trainers.trainer_login_page.login_as("Compliance Manager")
  click_link_or_button("ASSESSMENT MANAGEMENT")
  expect(page).to have_css(".title-header", text: 'Assessments')
  fill_in('txt-assessment-id', :with => $booked_status)
end

And(/^I login as Compliance Manager and click assessment management tab to search requested assessments$/) do
  @trainers.trainer_login_page.login_as("Compliance Manager")
  click_link_or_button("ASSESSMENT MANAGEMENT")
  expect(page).to have_css(".title-header", text: 'Assessments')
  expect(page).to have_css("#txt-assessment-id", visible: true)
  fill_in('txt-assessment-id', :with => $requested_status)
end

And(/^The page will include "([^"]*)" button$/) do |button|
  expect(page).to have_button(button, visible: true)
end

When(/^I enter the assessment Id which does'nt exists$/) do
  expect(page).to have_css(".title-header", text: 'Assessments')
  expect(page).to have_css("#txt-assessment-id", visible: true)
  fill_in('txt-assessment-id', :with => '999999')
end

Then(/^I will see "([^"]*)"$/) do |error_text|
  expect(page).to have_css(".text-danger", text: error_text)
end

And(/^I do not enter any assessment Id$/) do

end