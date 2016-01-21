Then(/^I see "([^"]*)" button for each assessment request$/) do |button|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.request_assessment
  @trainers.ngu_search_assessment_id_page.request_assessment
  click_link_or_button("ASSESSMENT MANAGEMENT")
  @trainers.compliance_unit_authorises_assessment_req_page.verify_visibility_of_approve_button
end