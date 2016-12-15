Then(/^I see "([^"]*)" on assessment management page$/) do |bookassessment|
expect(page).to have_css("#menu-book-assessment", text: bookassessment, visible: true)
end

And (/^I can see number of assessments to book$/)do
  expect(page.find_all(".dors-table"))
end

Then(/^I will be redirected to Book Assessment page$/) do
  expect(page).to have_css("h1", text: 'Book Assessment', visible: true)
end

When(/^I select 'Pick a course' on Book Assessment Page for "([^"]*)"$/) do|trainer_name|
  if(trainer_name == 'auto1 trainer')
    find_all(".dors-table-row.row .btn", visible: true)[0].click
  else
    (trainer_name == 'auto7 trainer')
       find_all(".dors-table-row.row .btn",visible: true)[1].click
  end
end

Then(/^I will be redirected to the Pick a course page$/) do
  #expect(page).to have_css(".breadcrumb li)
  expect(find_all(".breadcrumb li"))
  expect(page).to have_selector(".breadcrumb .active>span", text: "Pick a Course")
end

And (/^I click "([^"]*)" on Pick a course page$/)do|button|
    expect(find_all(".btn.btn-primary", match: :first ,text: button))
    find_all('.btn.btn-primary', visible: true)[0].click
  end

Then(/^I will be redirected to Course Detail page$/) do
  #expect(page).to have_css(".breadcrumb")
  expect(page).to have_css(".breadcrumb .active>span", text:'Summary')
end

Then(/^Course Detail page does not show the Assessor information$/) do
 expect(page).to have_no_css(".dors-well-other .span")
end

Then(/^I can select "([^"]*)" for which an assessment needs to be added$/) do|trainer_name|
  if trainer_name == 'auto7 trainer'
    expect(page).to have_css(".nearby-trainer-fullname", text: 'Steve _Auto')
    expect(find_all(".include-nearby-trainer-checkbox").count>0)
    find_all(".include-nearby-trainer-checkbox")[0].click
  end
  if trainer_name == 'auto1 trainer'
  expect(page).to have_css(".nearby-trainer-fullname", text: 'auto2 trainer')
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

Then(/^I should see an "([^"]*)" messages on Summary page$/) do|error_msg|
expect(page).to have_css(".help-block", text:error_msg )
end

Then(/^the NGU user is redirected to the Assessment Management screen$/) do
expect(page).to have_css("h1", text: "Assessments")
end

Then(/^a Confirmation message is shown$/) do
expect(page).to have_css("#requested-assessment-info", visible: true)
end

Then(/^I should see Assessment Request is automatically Approved$/) do
expect(page).to have_css(".dors-table", :count=>1, visible: true)
expect(page).to have_css(".assessment-status", text: 'Approved')
end

And (/^I should see Approved Assessment trainer "([^"]*)", assessor "([^"]*)" details$/)do|trainer_name,assessor_name|
 expect(page).to have_css(".trainer-full-name", text: trainer_name)
 expect(page).to have_css(".assessor-name", text: assessor_name)
end

And (/^I enter data into mileage and notes on summary page of bookassessment$/)do
  expect(page).to have_css("label[for='mileage']", text:'Total Mileage')
  expect(page).to have_css("#mileage")
  expect(page).to have_css('#notes')
  expect(page).to have_css("label[for='notes']", text:'Notes')
  fill_in('mileage', :with => '700')
  fill_in('notes', :with => 'test NGU BOOKASSESSMENT ON BEHALF OF ASSESSOR')
end

When (/^I start enter assessor as "([^"]*)" in 'Book Assessment on behalf of' field$/)do |assessor_name|
fill_in("txt-assessor-name", :with=> assessor_name)
expect(page).to have_css("#txt-assessor-name + ul")
find('#txt-assessor-name').send_keys(:enter)
sleep 3
end

And (/^Course Detail page shows the Assessor information$/)do
expect(page).to have_css(".col-md-12 span", visible: true)
end

And(/^I can't see text saying "([^"]*)"$/)do|text|
  expect(page).to have_no_css(".well p", text: text)
end

Then (/^I can't see "([^"]*)" field to search for assessor$/)do|text|
  expect(page).to have_no_css("label.required-field", text: text , visible: true)
  expect(page).to have_no_css("#txt-assessor-name")
end

And (/^I should see "([^"]*)"$/)do|text|
  expect(page).to have_css(".well p", text: text, visible: true)
end

And (/^I should see total mileage filed$/)do
expect(page).to have_css("#mileage", visible: true)
end

And (/^I enter force area as 'CHESHIRE'$/)do
find("#txt-force-filter-search").set('cheshire')
find("#txt-force-filter-search").send_keys(:enter)
end
