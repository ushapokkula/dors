And(/^the option to filter the list by courses is displayed$/) do
  #expect(page).to have_css("")
  expect(page).to have_css("#scheme-filter-container", visible: true)
end

And(/^no course filters are selected$/) do
  expect(find("#scheme-filter-container").value).to eq(nil)
end

And(/^no course filters are applied$/) do
  expect(page).to have_no_content("New Trend")
end

When(/^I select one "([^"]*)" from the dropdown$/) do |course_name|
  find("#scheme-filter-container > div> input").set(course_name)
  puts expect(page).to have_css(".ui-select-choices", visible:true)
  find("#scheme-filter-container > div> input").send_keys(:enter)
  find("#scheme-filter-container > div> input").click   #to collpase the filter
end

And(/^no other filters are applied$/) do
  expect(find("#txt-trainer-name").value).to eq("")
  expect(find("#force-areas-filter-container").value).to eq(nil)
end

Then(/^the results are displayed showing only those trainers who fall under the selected course "([^"]*)"$/) do |course_name|
  expect(page).to have_content(course_name)
  expect(page).to have_no_content("Speed Control")
end

When(/^I select  multiple courses "([^"]*)", "([^"]*)","([^"]*)" from the dropdown$/) do |arg1, arg2, arg3|
  pending
end


And(/^also apply trainer filter for trainer id "([^"]*)"$/) do |arg|
  pending
end

Then(/^the results are displayed based on filters applied for course and trainer$/) do
  pending
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
  pending
end