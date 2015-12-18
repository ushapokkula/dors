Then(/^I will see  list of all Assessments Requests with status requested$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.request_assessment
  @trainers.ngu_search_assessment_id_page.request_assessment
  click_link_or_button("ASSESSMENT MANAGEMENT")
 @trainers.assessment_management_default_view_page.verify_list_of_assessment_requests
end

Then(/^Each assessment request will include following details$/) do |table|
  new_table=table.hashes
  @trainers.assessment_management_default_view_page.verify_assessment_default_view_details(new_table)
end

When(/^There are no assessments with status requested$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  sleep 3
end