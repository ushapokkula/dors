And(/^I have no assessments on My Assessments page$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
end

Then(/^I will see the message "([^"]*)" on the page$/) do |text|
  expect(page).to have_css(".alert.alert-info", text: text)
end

And(/^I configure the days in assessmnet window$/) do
  @trainers.my_assessments_default_view_page.configure_days_in_assessment_window
end

And(/^I will be shown list of all assessments i requested$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
  expect(page).to have_css(".alert.alert-success")
  click_link_or_button("MY ASSESSMENTS")
  expect(page).to have_css(".dors-well-other")
  expect(page.all('.dors-well-other').count).to be >0

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
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
  expect(page).to have_css(".alert.alert-success")
  click_link_or_button("MY ASSESSMENTS")
  expect(page).to have_css(".my-assessments-count-label", text: 'Assessments')
  assessment_label = page.all(".my-assessments-count-label").count
  expect(assessment_label).to be > 1
end

Then(/^This column will show count of trainers for assessment$/) do
  assessment_count = page.all(".my-assessments-count").count
  expect(assessment_count).to be > 1
end

Then(/^Trainer names are not displayed on summary page$/) do
  expect(page).not_to have_css(".trainer-fullname")
end

Then(/^I see Trainer names included in an assessment request$/) do
  expect(page).to have_css(".trainer-fullname")
  expect(page.all(".trainer-fullname").count).to be >0
end

