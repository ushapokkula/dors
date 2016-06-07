Then(/^I see that I have access to "([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |tab1, tab2, tab3, tab4|
  page.has_link?(tab1, {}).should == true
  page.has_link?(tab2, {}).should == true
  page.has_link?(tab3, {}).should == true
  page.has_link?(tab4, {}).should == true
end

And(/^I see that I have access to "([^"]*)","([^"]*)","([^"]*)" as an assessor$/) do |tab1, tab2, tab3|
  expect(page).to have_link(tab1)
  expect(page).to have_link(tab2)
  expect(page).to have_link(tab3)
end

Then(/^I will be directed to Assessment Management page$/) do
  expect(page).to have_css(".title-header", text: 'Assessments')
end

Then(/^The page will show the list of assessments with status Requested$/) do
  expect(page).to have_css(".title-header", text: 'Assessments')
  @trainers.ngu_role_and_permissions_page.verify_assessments_list_with_status_requested
end

And(/^I request assessments as requested$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.request_assessment
end

Then(/^The page will show the list of requested assessments made by "([^"]*)" and "([^"]*)"$/) do|user1,user2|
  @trainers.ngu_role_and_permissions_page.verify_all_assessor_requested_assessments(user1,user2)
end

And(/^I login as two different assessors and request assessments as requested$/)do ||
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.trainer_login_page.login_as("Assessor")
  @trainers.ngu_search_assessment_id_page.request_assessment
  @trainers.trainer_login_page.login_as("Assessor1")
  @trainers.ngu_search_assessment_id_page.request_assessment
end

Then(/^I see that I have no access to these "([^"]*)","([^"]*)","([^"]*)"$/) do |tab1, tab2, tab3|
  expect(page).to have_no_link(tab1)
  expect(page).to have_no_link(tab2)
  expect(page).to have_no_link(tab3)
  end

And(/^I login as "([^"]*)" and "([^"]*)" and request assessments as requested$/)do|user1,user2|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.trainer_login_page.login_as(user1)
  @trainers.ngu_search_assessment_id_page.request_assessment
  @trainers.trainer_login_page.login_as(user2)
  @trainers.ngu_search_assessment_id_page.request_assessment
end