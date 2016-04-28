Given(/^I am on Assessment Request Summary page$/) do
  #@trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.auto_authorise_assessment_request_page.navigate_assessment_request_summary_page
end

Given(/^I have multiple trainers included in  my request$/) do
  @trainers.auto_authorise_assessment_request_page.validate_and_check_include_box
end

Given(/^no mileage expenses claimed$/) do

end

And(/^The status of the assessment request will be marked Booked in the database$/) do
  @trainers.auto_authorise_assessment_request_page.check_status_in_DB
end

Then(/^I will be redirected to Request Assessment page$/) do
  expect(page).to have_selector(:css, "h1", text: "Request Assessment")

end

Then(/^A message will be displayed "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

And(/^I have not included multiple trainers in my request$/) do

end

And(/^I click "([^"]*)" button without entering data$/) do |button|
  click_link_or_button(button)
  sleep 2
end

And(/^I should be redirected to Pick a slot page$/) do
  expect(page).to have_content("Request Assessment")
end

And(/^I will see only those trainers whose linked Force Areas match to those linked to my record$/) do
  @trainers.auto_authorise_assessment_request_page.verify_force_area_linked_to_assessor
end


When(/^I start typing three letters as "([^"]*)" in the trainer search force areas$/) do |chars|
  find('.ui-select-search').set(chars)
end

Then(/^The system will start autopredicting it and the list of highlight "([^"]*)" appear$/) do |forceareaname|
  expect(page).to have_css('.ui-select-container', visible: true)
  expect(page).to have_css("#ui-select-choices-row-0-0", text: forceareaname)
end

And (/^I hit enter to see the selected "([^"]*)" in Force Area filter$/)do|forceareaname|
  find('.ui-select-search').send_keys(:enter)
  expect(page).to have_css(".selectedForceAreaFilter", match: :first, text: forceareaname)
end

And (/^I should see the matching Force Area in Force Area Filters$/)do
  expect(page).to have_css(".selectedForceAreaFilter", match: :first, text: 'CHESHIRE')
end


Then(/^I should see message for "([^"]*)"$/) do |message|
  expect(page).to have_selector(:css, ".alert.alert-info", text: message)
end


And (/^I won't see trainers who have a Force Area assigned which I am not linked to$/) do
  find_all('span.ui-select-match-close')[1].click
  puts page.find(:css, ".selectedForceAreaFilter", match: :first).text
end

And (/^the Force Areas filter control on the page will have my linked Force Areas pre-selected as default$/) do
  @trainers.auto_authorise_assessment_request_page.verify_defalut_preselected_forcearea
end
