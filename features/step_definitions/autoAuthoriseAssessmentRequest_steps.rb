Given(/^I am on Assessment Request Summary page$/) do
  @trainers.auto_authorise_assessment_request_page.navigate_assessment_request_summary_page
end

Given(/^I have multiple trainers included in  my request$/) do
  @trainers.auto_authorise_assessment_request_page.validate_and_check_include_box
end

Given(/^no mileage expenses claimed$/) do

end

Then(/^I will be redirected to Request Assessment page$/) do
  expect(page).to have_content("Trainer licenses expiring within the next 30 days:")
end

Then(/^A message will be displayed "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

And(/^I have not included multiple trainers in my request$/) do
  uncheck('Include')
end

And(/^I click "([^"]*)" button without entering data$/) do |button|
  click_link_or_button(button)
  sleep 2
end

And(/^I should be redirected to Pick a slot page$/) do
  expect(page).to have_content("Trainer licenses expiring within the next 30 days:")
end

