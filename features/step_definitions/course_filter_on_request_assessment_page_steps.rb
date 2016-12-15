And(/^the option to filter the list by courses is displayed$/) do
  expect(page).to have_css("label[for='txt-scheme-filter-search']" ,visible: true, text: 'Course')
  expect(page).to have_css("#scheme-filter-container", visible: true)
end

And(/^no course filters are selected$/) do
  #expect(find("#scheme-filter-container").value).to eq(nil)
  expect(find("#txt-scheme-filter-search").value).to eq('')
end

And(/^no course filters are applied$/) do
  expect(find("#txt-scheme-filter-search").value).to eql('')
end

When(/^I select one "([^"]*)" from the dropdown$/) do |course_name|
  @trainers.course_filter_on_request_assessment_page.verify_filter_for_one_course(course_name)

end

And(/^no other filters are applied$/) do
  expect(page).to have_css(".dors-table", visible:true, count:4)
  @trainers.course_filter_on_request_assessment_page.verify_no_trainer_filter_have_applied
  @trainers.course_filter_on_request_assessment_page.verify_no_force_filter_have_applied
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

Then(/^I can see icons for practical and theory course are visible$/) do
  within(".theory-practical-legend") do
    expect(page).to have_css(".glyphicon.glyphicon-road", visible: true)
    expect(page).to have_css(".glyphicon.glyphicon-book", visible: true)
  end
end

And(/^also labels "([^"]*)" and "([^"]*)" for practical and theory icons$/) do |practical_value, theory_value|
  within(".theory-practical-legend") do
    expect(page).to have_css(".legend-practical-label", visible: true, text: practical_value)
    expect(page).to have_css(".legend-theory-label", visible: true, text: theory_value)
  end
end

When(/^I select "([^"]*)" from course filter of "([^"]*)"$/) do |course_name, course_type|
  @trainers.course_filter_on_request_assessment_page.scheme_filter.set(course_name)
  expect(page).to have_css(".ui-select-choices-row-inner", visible: true)
  if (course_name == "National Driver Alertness Course" && course_type == "Practical")
    find("#ui-select-choices-row-3-1", visible: true).click
  else
    @trainers.course_filter_on_request_assessment_page.scheme_filter.send_keys(:enter)
  end
end

And(/^the licences are of type "([^"]*)"$/) do |course_type|
  @trainers.course_filter_on_request_assessment_page.verify_type(course_type)
end

And(/^I select "([^"]*)" of "([^"]*)"$/) do |course_name, course_type|
  @trainers.course_filter_on_request_assessment_page.scheme_filter.set(course_name)
  if (course_type == "Practical")

  end
end

When(/^I select  multiple courses "([^"]*)", "([^"]*)" from the dropdown$/) do |course1, course2|
  @trainers.course_filter_on_request_assessment_page.scheme_filter.set(course1)
  @trainers.course_filter_on_request_assessment_page.scheme_filter.send_keys(:enter)
  @trainers.course_filter_on_request_assessment_page.scheme_filter.set(course2)
  @trainers.course_filter_on_request_assessment_page.scheme_filter.send_keys(:enter)
  @trainers.course_filter_on_request_assessment_page.trainer_filter.click
end

And(/^"([^"]*)" will be displayed of "([^"]*)" part of trainer licence$/) do |course_name, course_type|
  if (course_type == "Theory" and course_name == "National Driver Alertness Course")
    expect(all(".license-scheme-name")[3].text).to eq(course_name)
    expect(all(".license-type")[0].text).to eq(course_type)
    expect(all(".license-scheme-name")[4].text).to eq(course_name)
    expect(all(".license-type")[4].text).to eq(course_type)
  else
    expect(all(".license-scheme-name")[1].text).to eq(course_name)
    expect(all(".license-type")[1].text).to eq(course_type)
  end
end

Then(/^the results are displayed based on filters applied for courses "([^"]*)", "([^"]*)", "([^"]*)" of "([^"]*)" for  trainer "([^"]*)"$/) do |course1, course2, course3, type, trainer_id|
  expect(page).to have_css(".dors-table", visible: true, count: 1)
  expect(page).to have_css(".trainer-licenseCode", visible: true, text: trainer_id)
  expect(page).to have_css(".license-scheme-name", visible: true, text: course3)
  expect(page).to have_css(".license-type", visible: true, text: type)
end