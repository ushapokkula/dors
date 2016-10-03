And(/^the option to filter the list by courses is displayed$/) do
  #expect(page).to have_css("")
  expect(page).to have_css("#scheme-filter-container", visible: true)
end

And(/^no course filters are selected$/) do
  expect(find("#scheme-filter-container").value).to eq(nil)
end

And(/^no course filters are applied$/) do
  expect(find("#scheme-filter-container > div> input").value).to eql('')
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

Then(/^the results are displayed based on filters applied for courses "([^"]*)", "([^"]*)","([^"]*)" and trainer "([^"]*)"$/) do |course1, course2, course3, trainer_id|
  @trainers.course_filter_on_request_assessment_page.verify_trainer_list_multiple_courses(course1, course2, course3)
  @trainres.course_filter_on_request_assessment_page.verify_result_on_trainer_id_filter(trainer_id)
end

And(/^also apply force filter for force "([^"]*)"$/) do |arg|
  pending
end

Then(/^the results are dispalyed based on filters applied for course and force$/) do
  pending
end

Then(/^the results are displayed based on filters applied for course ,force and trainer$/) do
  pending
end

Then(/^all the filters should be cleared$/) do
  pending
end

Then(/^the results are displayed showing only those trainers who fall under the selected course "([^"]*)", "([^"]*)","([^"]*)"$/) do |course1, course2, course3|
  @trainers.course_filter_on_request_assessment_page.verify_trainer_list_multiple_courses(course1, course2, course3)
end