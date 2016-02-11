Then(/^I see that I have access to "([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |tab1, tab2, tab3, tab4|
  page.has_link?(tab1, {}).should == true
  page.has_link?(tab2, {}).should == true
  page.has_link?(tab3, {}).should == true
  page.has_link?(tab4, {}).should == true
end

Then(/^I will be directed to Assessment Management page$/)do
  page.has_content?("Assessments")
end

Then(/^The page will show the list of assessments with status Requested$/)do
  sleep 3
@trainers.ngu_role_and_permissions_page.verify_assessments_list_with_status_requested
end

And(/^I request assessments as requested$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.request_assessment
end

Then(/^The page will show the list of requested assessments made by all assessors$/)do
  @trainers.ngu_role_and_permissions_page.verify_all_assessor_requested_assessments
end

And(/^I login as two different assessors and request assessments as requested$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.trainer_login_page.log_in("Assessor")
  @trainers.ngu_search_assessment_id_page.request_assessment
  @trainers.trainer_login_page.log_in("Assessor1")
  @trainers.ngu_search_assessment_id_page.request_assessment
end