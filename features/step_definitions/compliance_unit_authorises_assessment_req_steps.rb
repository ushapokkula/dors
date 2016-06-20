Then(/^I see "([^"]*)" button for each assessment request$/) do |button|
  @trainers.compliance_unit_authorises_assessment_req_page.verify_visibility_of_approve_button(button)
end

And(/^I have all assessments requested$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.request_assessment
end

When(/^I click "([^"]*)" against one of the items on the list$/) do |button|
  find(:button, button, match: :first).click
end

Then(/^The request will be accepted and status of assessment request will be updated to Booked$/) do
  @trainers.compliance_unit_authorises_assessment_req_page.verify_approved_status_in_DB
end

Then(/^The trainers on this request will not be available for further bookings$/) do
  expect(page).to have_selector("h1", text:"Request Assessment")
  @trainers.compliance_unit_authorises_assessment_req_page.verify_trainers_after_approve
end

And(/^I see a message displaying that the assessment has been booked with assessment Id and date$/)do
  assessment_id = find("#modified-assessment-id").text
  assessment_date = find("#modified-assessment-date").text
 puts  expect(page).to have_css(".alert.alert-success", text:"Assessment #{assessment_id} scheduled for #{assessment_date} has been marked Booked")
end

