Given(/^I see "([^"]*)" on the page$/) do |text|
  expect(page.text).to have_content(text)
end

And(/^I see a message "([^"]*)" if i have booked assessments$/) do |text|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
  click_link_or_button("MY ASSESSMENTS")
  expect(page.text).to have_content(text)
end


Then(/^The confirmation message will be displayed as  "([^"]*)"$/) do |message|
  expect(page.text).to have_content(message)
end

Then(/^I see 'Yes' and 'No' buttons on the confirmation message box$/) do
  find_button('Yes').visible?
  find_button('No').visible?
end

And(/^the trainer will be available for bookings for assessors$/) do
  within(:xpath, "html/body/div[1]/div[2]/div") do
    expect(page.text).to include("CIA624")
    expect(page.text).to include("DOA123")
    expect(page.text).to include("FSB422")
  end
end

And(/^The confirmation message will close$/) do
  expect(page.text).not_to have_content("Are you sure you want to cancel this assessment?")
end

And(/^I have assessments with Booked status$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
end

And(/^I enter Cancellation Notes$/)do
  fill_in('cancellationNotes', :with => 'This assessment need to cancel')
end

And(/^I see Cancellation Notes$/)do
  expect(page).to have_css("#cancellationNotes")
end

And(/^The assessment will not be cancelled and I will remain on 'My Assessments' section$/) do
  expect(page.text).to have_content("My assessment details")
  click_link_or_button("REQUEST ASSESSMENT")
  sleep 2
  within(:xpath, "html/body/div[1]/div[2]/div") do
    expect(page.text).not_to include("CIA624")
    expect(page.text).not_to include("DOA123")
    expect(page.text).not_to include("FSB422")
  end
end

And(/^I get the current URL$/)do
  $cuurent_url = URI.parse(current_url)
  $cuurent_url
end

Given(/^I see "([^"]*)" button for assessments with status Booked or Requested$/) do |button|
  sleep 5
  find_button(button).visible?
end

Given(/^I see that the "([^"]*)" button is not available for Cancelled status$/) do |button|
  visit $cuurent_url
 $cuurent_url
 expect(page).not_to have_button(button)
end
