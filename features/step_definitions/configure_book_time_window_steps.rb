Given(/^I will be able to view the field "([^"]*)"$/) do |arg1|
expect(page).to have_css(".col-md-3.control-label")
end

Given(/^The system will be able to allow to set a time duration in number of days$/) do
  find("#assessmentsWindow")
  fill_in('assessmentsWindow', :with=> '200')
  find("#assessmentsWindow").value == '200'
end

Given(/^The field will only take numbers as input$/) do
@trainers.configure_book_time_window_page.verify_time_window_field_acceptance
end

Given(/^The value should be greater than zero$/) do
  expect($entered_numeric_value.to_i > 0).to be true
end

When(/^I enter a value in assessments booking window$/) do
  fill_in('assessmentsWindow', :with=> '365')
  $configured_days = find("#assessmentsWindow").value
end

Then(/^The system will save the preferences$/) do
@trainers.configure_book_time_window_page.verify_time_window_preferences_in_DB
end

When(/^I enter characters in the assessment time window$/) do
  fill_in('assessmentsWindow', :with=> 'ABCD')
end

Then(/^The field will not accept the characters$/) do
  entered_char_Value = find("#assessmentsWindow").value
  expect(entered_char_Value).to be == ""
end

Then(/^When I enter the value as "([^"]*)" in time window$/) do |days|
  fill_in('assessmentsWindow', :with=> days)
end

When(/^I set the assessment time window to  certain "([^"]*)"$/) do |days|
  fill_in('assessmentsWindow', :with=> days)
end

Then(/^The Assessors will only be able to view trainers licenses expiring in "([^"]*)"time window$/) do|count|
  sleep 4
  @trainers.trainers_listing_page.verify_expiry_dates(count)
end

Then(/^I will able to view only those trainer licenses expiring in "([^"]*)" time window on summary page$/)do |count|
  @trainers.configure_book_time_window_page.verify_trainer_licenses_on_summarypage(count)
end


