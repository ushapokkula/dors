And(/^the option to filter the list by courses is displayed$/) do
  expect(page).to have_css(".col-md-4.has-feedback>label" ,visible: true, text: 'Filter By Course')
  expect(page).to have_css("#scheme-filter-container", visible: true)
end

And(/^no course filters are selected$/) do
  expect(find("#scheme-filter-container").value).to eq(nil)
end

And(/^no course filters are applied$/) do
  expect(find("#scheme-filter-container input").value).to eql('')
end

When(/^I select one "([^"]*)" from the dropdown$/) do |course_name|
  @trainers.course_filter_on_request_assessment_page.verify_filter_for_one_course(course_name)

end

And(/^no other filters are applied$/) do
  expect(find("#txt-trainer-name").value).to eq("")
  expect(find("#force-areas-filter-container").value).to eq(nil)
end

Then(/^the results are displayed showing only those trainers who fall under the selected course "([^"]*)"$/) do |course_name|
  @trainers.course_filter_on_request_assessment_page.verify_trainers_list_single_course(course_name)
end

When(/^I select  multiple courses "([^"]*)", "([^"]*)","([^"]*)" from the dropdown$/) do |course1, course2, course3|
  @trainers.course_filter_on_request_assessment_page.verify_filter_for_multiple_course(course1, course2, course3)
end


And(/^also apply trainer filter for trainer id "([^"]*)"$/) do |trainer_id|
  @trainers.course_filter_on_request_assessment_page.filter_by_trainer_id(trainer_id)
end

Then(/^the results are displayed based on filters applied for courses "([^"]*)", "([^"]*)" and trainer "([^"]*)"$/) do |course1, course2, trainer_id|
  @trainers.course_filter_on_request_assessment_page.verify_list_on_course_and_trainer_filter(course1, course2)
  @trainers.course_filter_on_request_assessment_page.verify_result_on_trainer_id_filter(trainer_id)
end

And(/^also apply force filter for force "([^"]*)" and "([^"]*)"$/) do |force1, force2|
  @trainers.course_filter_on_request_assessment_page.apply_force_filter(force1, force2)
end

Then(/^the results are displayed based on filters applied for courses "([^"]*)", "([^"]*)","([^"]*)" and forces "([^"]*)","([^"]*)"$/) do |course1, course2, course3, force1, force2|
  @trainers.course_filter_on_request_assessment_page.verify_trainer_list_multiple_courses(course1, course2, course3)
  @trainers.course_filter_on_request_assessment_page.verify_list_based_on_forcefilter(force1,force2)
end

Then(/^the results are displayed based on filters applied for course "([^"]*)" ,forces "([^"]*)","([^"]*)" and trainer "([^"]*)"$/) do |course_name,force1,force2,trainer_id|
  @trainers.course_filter_on_request_assessment_page.verify_combination_filter(force1, force2,course_name,trainer_id)
end

Then(/^all the filters should be cleared$/) do
  @trainers.course_filter_on_request_assessment_page.verify_reset
end

Then(/^the results are displayed showing only those trainers who fall under the selected course "([^"]*)", "([^"]*)","([^"]*)"$/) do |course1, course2, course3|
  @trainers.course_filter_on_request_assessment_page.verify_trainer_list_multiple_courses(course1, course2, course3)
end


Then(/^I see message "([^"]*)" on request assessment page$/) do |message|
 expect(page).to have_css(".alert.alert-info", text: message)
end