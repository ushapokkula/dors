Given(/^I am on Assessment Request Summary page$/) do
  #@trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.auto_authorise_assessment_request_page.navigate_assessment_request_summary_page
end

Given(/^I have multiple trainers included in  my request$/) do
  @trainers.auto_authorise_assessment_request_page.validate_and_check_include_box
end

Given(/^no mileage expenses claimed$/) do

end

And(/^The status of the assessment request will be marked Booked in the database$/)do
@trainers.auto_authorise_assessment_request_page.check_status_in_DB
end

Then(/^I will be redirected to Request Assessment page$/) do
  expect(page).to have_selector(:css,"h1",text: "Request Assessment")

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



And (/^I should see linked Force Areas$/)do
  @trainers.auto_authorise_assessment_request_page.verify_linked_force_areas
end


And(/^I should see list of trainers match to my record$/)do
expect(page.all(".dors-table").count).to be >0
$primary_trianer=page.all('.dors-table')[0].text
p($primary_trianer)
end

When(/^I start typing three letters as "([^"]*)" in the trainer search force areas$/) do |chars|

  find('.ui-select-search').set(chars)
  find('.ui-select-search').send_keys(:enter)
end

Then(/^The system will start autopredicting it and the list of force area appear$/) do
  if ( page.should have_no_css(".alert.alert-info"))
    $List_of_force_area=page.find(".ui-select-container").should be_visible
    p($List_of_force_area)
    expect(page.all(".ui-select-choices").count).to be > 0
  end
end

And(/^I should see selected force areas in search force area filter$/) do
  expect(page).to have_selector(:css,".selectedForceAreaFilter")
end

And(/^I should see selected "([^"]*)" in search force area filter$/) do |name|
 $Force_name=expect(page).to have_selector(:css,".selectedForceAreaFilter", match: :'one', text: name)
p($Force_name)
end


Then (/^The selected force area name will not be in the drop down list$/) do
  expect(page).to have_selector(:css, ".selectedForceAreaFilter",match: :'one', text: 'CITY OF LONDON POLICE')
  page.find(".ui-select-choices", match: :'one').should_not have_text('CITY OF LONDON POLICE')


end

Then(/^I should see message for no trainers to match requirements$/) do
  expect(page).to have_selector(:css,".alert.alert-info", text: "No assessments available to book.")
end


And (/^I should not see trainers Force Area not linked to Assessor$/)do
  @trainers.auto_authorise_assessment_request_page.verify_linked_force_areas_not_related_to_assessor
end

And (/^I should see default pre-selected Force Area$/)do
  @trainers.auto_authorise_assessment_request_page.verify_defalut_preselected_forcearea
end