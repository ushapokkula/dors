Given(/^I am on Pick a Slot Page$/) do

end

Given(/^I navigate to Pick a Course Page by clicking on PIck a slot against a trainer$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click Request Assessment button against a slot i have choosen$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The system will load Assessment Request Summary page with following Assessor details$/) do
  page.has_xpath?("html/body/div[1]/div[2]/div/div[1]/div[4]/div[5]/div[1]")
  page.has_xpath?("html/body/div[1]/div[2]/div/div[1]/div[4]/div[5]/div[2]")

end

Then(/^The page will display with the following Trainer Details$/) do |table|
  @trainers.auto_authorise_assessment_request_page.verify_trainer_and_course_details
 end


Then(/^I see that the primary trainer is included by default$/) do
  @trainers.auto_authorise_assessment_request_page.primary_trainer_include_bydefault
end

Then(/^I will be able to Include or Exclude other trainer$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I check "([^"]*)" for second trainer$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The system will include the selected trainer in the booking request$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I uncheck "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The system will not include the secondary trainer in the booking request$/) do
  pending # Write code here that turns the phrase above into concrete actions
end