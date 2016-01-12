And(/^I have no assessments on My Assessments page$/) do
  @trainers.my_assessments_default_view_page.delte_assessments_details_from_db
end

And(/^I configure the days in assessmnet window$/)do
  @trainers.my_assessments_default_view_page.configure_days_in_assessment_window
end

And(/^I will see a message for assessments for configured days$/)do
  expect(page).to have_content("Assessments for next 365 days.")
end

And(/^I will be shown list of all assessments i requested$/) do
  @trainers.my_assessments_default_view_page.delte_assessments_details_from_db
  @trainers.ngu_search_assessment_id_page.book_assessment
  click_link_or_button("MY ASSESSMENTS")
   page.should have_css('.dors-well-other.ng-scope')
end

And(/^The status are "([^"]*)"$/) do |status|
  @trainers.my_assessments_default_view_page.check_booked_status(status)

end

And(/^The view will only show assessments for which the days are configured$/) do
  @trainers.my_assessments_default_view_page.verify_assessments_within_configured_days
end

And(/^I will not be able to view dates which fall out of 30 calendar days$/) do
  @trainers.my_assessments_default_view_page.verify_assessment_date_out_of_30_days
end

Then(/^I can see "([^"]*)" label for trainer count$/) do |label|
  within(".dors-well-container") do
    expect(page).to have_content(label)
  end

end

Then(/^This column will show count of trainers for assessment$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Trainer names are not displayed on summary page$/) do
  expect(page).not_to have_css(".col-md-3.vertical-center.text-md")
end

Then(/^I see Trainer names included in an assessment request$/) do
  expect(page).to have_css(".col-md-3.vertical-center.text-md")
end

