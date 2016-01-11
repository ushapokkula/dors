Given(/^that I am logged into the system$/) do
  # @trainers.login_page.login
  visit $Trainers_Link

end

When(/^I will see "([^"]*)" on the page$/) do |text|
  page.has_content?(text)
end


Then(/^I will be shown a list of trainers who have their license expiring within configured days$/) do
  @trainers.trainers_listing_page.display_list_of_trainers_within_configured_days
end

And(/^Trainer Name,license number, Expiry Date, Scheme name, course type will be displayed in trainer listing view for each trainer$/) do
  @trainers.trainers_listing_page.verify_details_on_listing_page
end

Then(/^the license expiring soon will be shown at top$/)do
  @trainers.trainers_listing_page.expiry_days_asc_order
end

Then(/^Trainers who have multiple licenses expiring will be shown multiple times as a separate entry$/) do
  @trainers.trainers_listing_page.multiple_licenses_as_seperate_entry
end

Then(/^I will not be shown a list of trainers who have their license expiring out of thirty calender days$/) do
  @trainers.trainers_listing_page.not_displaying_results_after_30days
end

And(/^I will see that the licenses are unique to the scheme$/)do
  @trainers.trainers_listing_page.validating_unique_licenses
end


When(/^I click 'Pick a slot' on Request Assessment Page against a Trainer i want to assess$/) do
  @trainers.trainers_listing_page.pick_a_slot
end

Then(/^The page will also show Primary Trainers Full Name, License Number, Scheme Name and days in which their license expires$/) do
  @trainers.trainers_listing_page.primary_trainer_details_on_pickacourse_page
end

Then(/^The system will display a list of courses the selected trainer is delivering in future with course, site address and secondary trainer details$/) do
  @trainers.trainers_listing_page.pick_a_slot
end

When(/^I click 'Pick a slot' on Request Assessment Page$/) do
  @trainers.trainers_listing_page.pick_a_slot_to_verify_course_dates
end

Then(/^I validate the course dates delivered by trainer are of future dates only$/) do
  @trainers.trainers_listing_page.pick_a_slot_to_verify_course_dates
end