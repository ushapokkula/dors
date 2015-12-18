Then(/^The status of the assessment will be updated to Completed$/) do
  @trainers.mark_complete_and_update_licenses_page.verify_completed_status
end

Then(/^I will be re\-directed to "ASSESSMENT MANAGEMENT"$/) do
expect(page).to have_content("Assessments")
end

When(/^I select "([^"]*)" or "([^"]*)" as outcome$/) do |outcome1, outcome2|
  @trainers.mark_complete_and_update_licenses_page.verify_license_action_note_competent(outcome1,outcome2)
end

Then(/^the license of the trainer will not be changed$/) do
  @trainers.mark_complete_and_update_licenses_page.verify_license_status_for_absent_cancelled
end

And(/^The trainer will be available for bookings on Request Assessment page$/)do
  @trainers.mark_complete_and_update_licenses_page.visibility_of_trainers
end

Then(/^the license of the trainer will be renewed for two years from the date of assessment$/) do
  @trainers.mark_complete_and_update_licenses_page.verify_license_status_for_actionnote_competent
end

Then(/^The status of the license will be updated to Full valid$/) do

end