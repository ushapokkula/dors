Then(/^I see "([^"]*)" button for each assessment request$/) do |button|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.request_assessment
  @trainers.ngu_search_assessment_id_page.request_assessment
  click_link_or_button("ASSESSMENT MANAGEMENT")
  sleep 5
  @trainers.compliance_unit_authorises_assessment_req_page.verify_visibility_of_approve_button
end

When(/^I click "([^"]*)" against one of the items on the list$/) do |button|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.request_assessment
  sleep 5
  click_link_or_button("ASSESSMENT MANAGEMENT")
  sleep 2
  first(:button, button).click
end

Then(/^The request will be accepted and status of assessment request will be updated to Booked$/) do
  @trainers.compliance_unit_authorises_assessment_req_page.verify_approved_status_in_DB
end

Then(/^The trainers on this request will not be available for further bookings$/)do
  @trainers.compliance_unit_authorises_assessment_req_page.verify_trainers_after_approve
end
