Given(/^I see "([^"]*)" on the page$/) do |text|
  expect(page).to have_css("#assessment-title-header", text: text)
end

And(/^I see a message "([^"]*)" if i have booked assessments$/) do |text|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
  click_link_or_button("MY ASSESSMENTS")
  expect(page.text).to have_content(text)
end


Then(/^The confirmation message will be displayed as  "([^"]*)"$/) do |message|
  expect(page).to have_css(".modal-body>p", text: message)
end

And(/^I see the message "([^"]*)" after cancelling the assessment$/) do |message|
  expect(page).to have_css(".alert.alert-success", text: message)
end


And(/^I enter Cancellation Notes$/) do
  fill_in('cancellationNotes', :with => 'This assessment need to cancel')
end


Then(/^I see "([^"]*)" and "([^"]*)" buttons on the confirmation message box$/) do |button1, button2|
  within(".modal-content") do
    expect(page).to have_button(button1, visible: true)
    expect(page).to have_button(button2, visible: true)
  end
end

And(/^the trainer will be available for bookings for assessors$/) do
  @trainers.ngu_search_assessment_id_page.assessor_availability
end


And(/^The confirmation message will close$/) do
  expect(page).to have_no_css(".modal-body>p")
end

And(/^I have assessments with Booked status$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
  expect(page).to have_css(".alert.alert-success", text: "The assessment has been Booked")
end


#And(/^I enter Cancellation Notes$/)do
#fill_in('cancellationNotes', :with => 'This assessment need to cancel')
#end

And(/^I see the message "([^"]*)" on the cancellation window$/) do |message|
  expect(page).to have_css(".help-block p", text: message)
end


And(/^I see Cancellation Notes$/) do
  expect(page).to have_css("#cancellationNotes")
end

And(/^The assessment will not be cancelled and I will remain on 'My Assessments' section$/) do
  expect(page).to have_css("#assessment-title-header", text: "Assessment Outcome")
  click_link("REQUEST ASSESSMENT")
  expect(page).to have_no_css('.trainer-licenseCode', text: '100001/101')

end

And(/^I get the current URL$/) do
  $cuurent_url = URI.parse(current_url)
end

Given(/^I see "([^"]*)" button for assessments with status Booked or Requested$/) do |button|
  find_button(button).visible?
end

Given(/^I see that the "([^"]*)" button is not available for Cancelled status$/) do |button|
  visit $cuurent_url
  expect(page).not_to have_button(button, visible:true)
end


When(/^I click "([^"]*)" button on confirmation message box$/) do |button_name|
 within(".modal-content") do
   click_button(button_name)
 end
end