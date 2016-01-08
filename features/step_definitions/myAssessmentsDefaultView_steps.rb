And(/^I have no assessments on My Assessments page$/) do
  @trainers.my_assessments_default_view_page.delte_assessments_details_from_db
end

And(/^I will be shown list of all assessments i requested$/) do
  @trainers.my_assessments_default_view_page.delte_assessments_details_from_db
  @trainers.ngu_search_assessment_id_page.book_assessment
  clink_link_or_button("MY ASSESSMENTS")
   page.should have_css('.dors-well-other.ng-scope')
end

And(/^The status are "([^"]*)"$/) do |status|
  @trainers.my_assessments_default_view_page.check_booked_status(status)

end

And(/^The view will only show assessments for which the daya are configured$/) do
  @trainers.my_assessments_default_view_page.verify_assessments_within_configured_days
end

And(/^I will not be able to view dates which fall out of 30 calendar days$/) do
  @trainers.my_assessments_default_view_page.verify_assessment_date_out_of_30_days
end

