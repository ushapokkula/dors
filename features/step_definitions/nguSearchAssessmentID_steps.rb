And(/^I type the Booked Assessment ID in the Assessment search field$/) do
   @trainers.trainer_login_page.login_as("Assessor")
   @trainers.ngu_search_assessment_id_page.search_booked_assessment_id
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
   find_button('Mark Complete').visible?
   find_button('Cancel').visible?
end

Then(/^the page include Outcome dropdown$/) do
  page.has_select?('#status-281', :options => ['Absent','Action Note','Cancelled','Competent','Compliance Note'])
  page.has_select?('#status-279', :options => ['Absent', 'Action Note', 'Cancelled', 'Competent', 'Compliance Note'])
  page.has_select?('#status-392>', :options => ['Absent', 'Action Note', 'Cancelled', 'Competent', 'Compliance Note'])
end

And(/^I type the Request Assessment ID in the Assessment search field$/) do
  @trainers.ngu_search_assessment_id_page.search_requested_assessment_id
end

And(/^I request assessment as Booked$/)do
  @trainers.ngu_search_assessment_id_page.search_booked_assessment_id
end

And(/^I request assessment as Requested$/)do
  @trainers.ngu_search_assessment_id_page.search_requested_assessment_id
end

And(/^I login as Compliance Manager and click assessment management tab to search booked assessments$/) do
  @trainers.trainer_login_page.login_as("Compliance Manager")
  click_link_or_button("ASSESSMENT MANAGEMENT")
  fill_in('txt-assessment-id', :with => $booked_status)
end

And(/^I login as Compliance Manager and click assessment management tab to search requested assessments$/) do
  @trainers.trainer_login_page.login_as("Compliance Manager")
  click_link_or_button("ASSESSMENT MANAGEMENT")
  fill_in('txt-assessment-id', :with => $requested_status)
end

And(/^The page will include "([^"]*)" button$/) do |button|
   find_button(button).visible?
end

When(/^I enter the assessment Id which does'nt exists$/) do
  fill_in('txt-assessment-id', :with => '999999')
end

Then(/^I will see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

And(/^I do not enter any assessment Id$/) do

end