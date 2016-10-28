Then(/^I see "([^"]*)" on assessment management page$/) do |bookassessment|

end

And (/^I can see number of assessments to book$/)do
  expect(page.find_all(".dors-table"))
end

Then(/^I will be redirected to Book Assessment page$/) do
  expect(page).to have_css("h1", text: 'Book Assessment', visible: true)
end

When(/^I select 'Pick a course' on Book Assessment Page for "([^"]*)"$/) do|trainer_name|
  if(trainer_name == 'auto2 trainer')
    find_all(".dors-table-row.row .btn", visible: true)[4].click
  else
    (trainer_name == 'auto7 trainer')
       find_all(".dors-table-row.row .btn",visible: true)[5].click
  end
end

Then(/^I will be redirected to the Pick a course page$/) do
  #expect(page).to have_css(".breadcrumb li)
  expect(find_all(".breadcrumb li"))
  expect(page).to have_selector(".breadcrumb .active>span", text: "Pick a Course")
  expect(find_all(".btn.btn-primary", match: :first ,text: "BookAssessment"))
end

And (/^I click "([^"]*)" on Pick a course page$/)do|button|
find_all('.btn.btn-primary', visible: true)[0].click
end

Then(/^I will be redirected to Course Detail page$/) do
  #expect(page).to have_css(".breadcrumb")
  expect(page).to have_css(".breadcrumb .active>span", text:'Summary')
end

Then(/^does not show the Assessor information$/) do
 expect(page).to have_no_css(".dors-well-other .span")
end

Then(/^I can select "([^"]*)" for which an assessment needs to be added$/) do|trainer_name|
  if trainer_name == 'auto7 trainer'
    expect(page).to have_css(".nearby-trainer-fullname", text: trainer_name)
    expect(find_all(".include-nearby-trainer-checkbox").count>0)
    find_all(".include-nearby-trainer-checkbox")[1].click
  end
  if trainer_name == 'auto2 trainer'
  expect(page).to have_css(".nearby-trainer-fullname", text: trainer_name)
 expect(page).to have_css(".include-nearby-trainer-checkbox",:count=> 1, visible: true)
  find(".include-nearby-trainer-checkbox").click
  end
end
Then(/^I can see text saying "([^"]*)"$/) do |message|
  expect(page).to have_css(".well p", text: message, visible: true)
end

Then(/^I can see "([^"]*)" field to search for assessor$/) do |text|
  expect(page).to have_css("label.required-field", text: text , visible: true)
  expect(page).to have_css("#txt-assessor-name", visible: true)
end

When(/^I start typing assessor as "([^"]*)" in 'Book Assessment on behalf of' field$/)do|chars|
expect(page).to have_css('#txt-assessor-name', visible:true)
fill_in('txt-assessor-name', :with => chars)
end

Then(/^I enter "([^"]*)" in 'Book Assessment on behalf of' field$/) do |arg1|

end

Then(/^I should see an "([^"]*)" messages on Summary page$/) do|error_msg|
expect(page).to have_css(".help-block", text:error_msg )
end

Then(/^the Assessment Request is automatically Approved$/) do

end

Then(/^the NGU user is redirected to the Assessment Management screen$/) do
expect(page).to have_css("h1", text: "Assessments")
end

Then(/^a Confirmation message is shown$/) do

end

