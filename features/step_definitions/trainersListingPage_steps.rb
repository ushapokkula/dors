Given(/^that I am logged into the system$/) do
  # @trainers.login_page.login
 # visit $Trainers_Link
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
 expect(page).to have_css(".trainer-full-name")
 expect(page).to have_css(".trainer-licenseCode")
 expect(page).to have_css(".license-expiry-date")
 expect(page).to have_css(".license-scheme-name")
 expect(page).to have_css(".license-type")
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


When(/^I click 'Pick a course' on Request Assessment Page against a Trainer i want to assess$/) do
  find(:button, 'Pick a course', match: :first).click if find(:button, 'Pick a course', match: :first)
  #@trainers.trainers_listing_page.pick_a_slot
end

Then(/^The page will also show Primary Trainers Full Name, License Number, Scheme Name and days in which their license expires$/) do
  @trainers.trainers_listing_page.primary_trainer_details_on_pickacourse_page
end

Then(/^The system will display a list of courses the selected trainer is delivering in future$/) do
  expect(page).to have_css(".dors-well-other")
  expect(page.all(".dors-well-other").count).to be > 0
end

When(/^I click 'Pick a course' on Request Assessment Page$/) do
  find(:button, 'Pick a course', match: :first).click
end

And(/^I see the Expiry Date is in dd-Mmm-YYYY format$/)do
  expect(page).to have_css(".license-expiry-date")
  @trainers.trainers_listing_page.verify_date_format
end

Then(/^I validate the course dates delivered by trainer are of future dates only$/) do
  @trainers.trainers_listing_page.pick_a_slot_to_verify_course_dates
end

When(/^The system will display the following details on Pick a course page$/) do |table|
  new_table =table.hashes
  @trainers.trainers_listing_page.verify_details_on_pickacourse(new_table)
end

When(/^The page will also show primary trainers Full Name,secondary trainer fullname$/) do
  expect(page).to  have_css(".trainer-fullname", visible:true)
  expect(page).to have_css(".auto-other-trainer-fullname", visible:true)
end

And(/^I set the time window to "([^"]*)" days$/)do |days|
  @trainers.trainer_login_page.login_as("Compliance Manager")
  click_link_or_button("ADMINISTRATION")
  fill_in('assessmentsWindow', :with=> days)
  click_button("Save")
  # @trainers.trainer_login_page.login_as("Assessor")
end

And(/^I see that licence code is replaced by "([^"]*)"$/) do|trainer_id|
 expect(page).to have_css(".auto-main-trainerid-label", text: trainer_id)
 expect(page).to have_css(".auto-other-trainer-trainerid-label", text: trainer_id)
end

Then(/^I will be taken to "([^"]*)" page$/) do |course_page|
  expect(page).to have_css(".breadcrumb .active>span", text: course_page)
end

And(/^the term "([^"]*)" is not shown against trainers on pick a course page$/) do |secondary_trainer|
  expect(page).to have_no_content(secondary_trainer)
end

When(/^I Pick a course against the trainer which has same scheme as the trainer who is in requested assessment$/) do
  all(".btn.btn-primary:nth-child(2)")[4].click
end

When(/^I Pick a course against the trainer which has same scheme as the trainer who is in booked assessment$/) do
  all(".btn.btn-primary:nth-child(2)")[1].click
end

Then(/^the requested assessment id is shown against the trainer$/) do
  @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
  expect(page).to have_css(".auto-other-trainer-on-assessment", text:$requested_status)
end

Then(/^the booked assessment id is shown against the trainer$/) do
  @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
  expect(page).to have_css(".auto-other-trainer-on-assessment", text:$booked_status)
end

And(/^I include trainer in near by course$/) do
 # all(('.include-nearby-trainer-checkbox:nth-child(1)')[0], visible:true)
  expect(page).to have_css(".include-nearby-trainer-checkbox:nth-child(1)", visible:true)
  all('.include-nearby-trainer-checkbox:nth-child(1)')[0].click
end