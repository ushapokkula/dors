Given(/^I am on Pick a Slot Page$/) do

end

And(/^The mileage field will only take numbers$/)do
  fill_in('mileage', :with => '500')
  find("#mileage").value == '500'
end

And(/^The notes field will take free text upto 1000 characters$/)do
@trainers.submit_assessment_request_page.verify_notes_field_limit(1000)
end

And(/^I enter characters in the mileage field apart from numbers$/)do
  fill_in('mileage', :with => 'ABC')
end

And(/^more than 1000 characters in notes field$/)do
  @trainers.submit_assessment_request_page.verify_notes_field_limit(1500)
end

Then(/^I should not be able to enter Invalid or morethan 1000 characters in mileage and notes field respectively$/)do
  find("#mileage").value == ''
  find("#notes").value.length
  find("#notes").value.length == 1000
end

And(/^I fill Optional mileage and Notes fields$/)do
  fill_in('mileage', :with => '500')
end

And(/^The assessment request will be submitted and saved in the database$/)do
  expect(page).to have_css(".alert.alert-success", text: "The assessment has been Requested")
  @trainers.ngu_search_assessment_id_page.verify_requested_assessment_status_in_DB
  expect($assessment_status).to equal(1)
end

And(/^An assessment ID will be generated in the format 100xxx$/)do
  @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    expect($requested_status).to match(/100[0-9][0-9][0-9]/)
  end

And(/^I see the success message "([^"]*)" on the page$/)do |text|
  expect(page).to have_css(".alert.alert-success", text: "The assessment has been Requested")
end

And(/^The status of the assessment request will be marked as Requested$/)do
  expect($assessment_status).to equal(1)
end

And(/^I click Cancel on this page without entering any data into mileage and notes field$/)do
click_button("Cancel")
end

And(/^I will be redirected back to the Pick a Slot page$/)do
  expect(page).to have_css("h1", "Request Assessment")
end

And(/^I enter data into mileage and notes field$/)do
  @trainers.auto_authorise_assessment_request_page.navigate_assessment_request_summary_page
  fill_in('mileage', :with => '500')
  @trainers.submit_assessment_request_page.verify_notes_field_limit(780)
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

end

When(/^I check "([^"]*)" for second trainer$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end



Then(/^I uncheck "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The system will not include the secondary trainer in the booking request$/) do
  pending # Write code here that turns the phrase above into concrete actions
end