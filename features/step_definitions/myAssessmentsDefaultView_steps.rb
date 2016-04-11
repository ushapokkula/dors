And(/^I have no assessments on My Assessments page$/) do
  @trainers.my_assessments_default_view_page.delte_assessments_details_from_db
end

And(/^I configure the days in assessmnet window$/)do
  @trainers.my_assessments_default_view_page.configure_days_in_assessment_window
end

And(/^I will be shown list of all assessments i requested$/) do
  @trainers.my_assessments_default_view_page.delte_assessments_details_from_db
  @trainers.ngu_search_assessment_id_page.book_assessment
  sleep 5
  click_link_or_button("MY ASSESSMENTS")
  page.should have_css('.dors-well-other')
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
  @trainers.my_assessments_default_view_page.delte_assessments_details_from_db
  @trainers.ngu_search_assessment_id_page.book_assessment
  click_link_or_button("MY ASSESSMENTS")
  sleep 3
  assessment_label = page.all(".my-assessments-count-label").count
   expect(assessment_label).to be > 1
end

Then(/^This column will show count of trainers for assessment$/) do
  assessment_count = page.all(".my-assessments-count").count
  expect(assessment_count).to be > 1
end

Then(/^Trainer names are not displayed on summary page$/) do
   expect(page).not_to have_css(".col-md-3.vertical-center.text-md")
end

Then(/^I see Trainer names included in an assessment request$/) do
   expect(page).to have_css(".col-md-3.vertical-center.text-md")
end

