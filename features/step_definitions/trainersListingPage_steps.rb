Given(/^that I am logged into the system$/) do
  # @trainers.login_page.login
  visit $Trainers_Link
  @trainers.configure_book_time_window_page.verify_no_user_is_signed_in   #time being kept login code here
  fill_in('txtemail', :with=> "ushag")
  fill_in('txtpassword', :with=> "Password2!")
  click_link_or_button("Sign in")

end

When(/^I will see "([^"]*)" on the page$/) do |text|
  page.has_content?(text)
end


Then(/^I will be shown a list of trainers who have their license expiring within time window of "([^"]*)" days$/) do |count|
  @trainers.trainers_listing_page.display_list_of_trainers_within_configured_days(count)
end

And(/^Trainer Name,license number, Expiry Date, Scheme name, course type will be displayed in trainer listing view for each trainer$/) do
  @trainers.trainers_listing_page.verify_details_on_listing_page
end

Then(/^the license expiring soon will be shown at top$/)do
  @trainers.trainers_listing_page.expiry_days_asc_order
end

And(/^I configure the assessment time window to "([^"]*)" days$/)do|days|
  click_link_or_button("ADMINISTRATION")
  fill_in('assessmentsWindow', :with=> days)
  click_button("Save")
  expect(page).to have_content("Assessments booking time window has been successfully set")
 end

Then(/^Trainers who have multiple licenses expiring will be shown multiple times as a separate entry$/) do
  @trainers.trainers_listing_page.multiple_licenses_as_seperate_entry
end

Then(/^I will not be shown a list of trainers who have their license expiring outside of configured time window$/) do
  @trainers.trainers_listing_page.not_displaying_results_out_of_time
end

And(/^I will not be shown a list of trainers for previous dates already expired$/)do
  @trainers.trainers_listing_page.verify_previous_expired_dates
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

Then(/^The system will display a list of courses the selected trainer is delivering in future$/) do
  @trainers.trainers_listing_page.pick_a_slot
end

When(/^I click 'Pick a slot' on Request Assessment Page$/) do
  sleep 3
  first(:button, 'Pick a slot').click
end

And(/^I see the Expiry Date is in dd-Mmm-YYYY format$/)do
  @trainers.trainers_listing_page.verify_date_format
end

Then(/^I validate the course dates delivered by trainer are of future dates only$/) do
  @trainers.trainers_listing_page.pick_a_slot_to_verify_course_dates
end

When(/^The system will display the following details on Pick slot page$/) do |table|
  new_table =table.hashes
  @trainers.trainers_listing_page.verify_details_on_pickaslot(new_table)
end

When(/^The page will also show primary trainers Full Name,secondary trainer fullname$/) do
  @trainers.trainers_listing_page.verify_trianers_fullname
end

And(/^I set the time window to "([^"]*)" days$/)do |days|
  @trainers.trainer_login_page.log_in("Compliance Manager")
  click_link_or_button("ADMINISTRATION")
  fill_in('assessmentsWindow', :with=> days)
  click_button("Save")
  @trainers.trainer_login_page.log_in("Assessor")
end