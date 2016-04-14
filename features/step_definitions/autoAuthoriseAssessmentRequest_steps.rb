Given(/^I am on Assessment Request Summary page$/) do
  #@trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.auto_authorise_assessment_request_page.navigate_assessment_request_summary_page
end

Given(/^I have multiple trainers included in  my request$/) do
  @trainers.auto_authorise_assessment_request_page.validate_and_check_include_box
end

Given(/^no mileage expenses claimed$/) do

end

And(/^The status of the assessment request will be marked Booked in the database$/)do
@trainers.auto_authorise_assessment_request_page.check_status_in_DB
end

Then(/^I will be redirected to Request Assessment page$/) do
  expect(page.text).to have_selector(:css,"h1",text: "Request Assessment")

end

Then(/^A message will be displayed "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

And(/^I have not included multiple trainers in my request$/) do

end

And(/^I click "([^"]*)" button without entering data$/) do |button|
  click_link_or_button(button)
  sleep 2
end

And(/^I should be redirected to Pick a slot page$/) do
  expect(page).to have_content("Request Assessment")
end

And (/^I should see linked Force Areas$/)do
  @trainers.auto_authorise_assessment_request_page.verify_linked_force_areas
end

Then(/^I should see message for no trainers to match requirements$/) do
  expect(page.text).to have_selector(:css,".alert.alert-info", text: "No assessments available to book.")
end

And (/^I should not see trainers Force Area which not linked to Assessor$/)do
  @trainers.auto_authorise_assessment_request_page.verify_linked_force_areas_not_related_to_assessor
end

And (/^I should see default pre-selected Force Area$/)do
  @trainers.auto_authorise_assessment_request_page.verify_defalut_preselected_forcearea
end