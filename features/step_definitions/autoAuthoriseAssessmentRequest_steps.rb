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

Then(/^I will see only those trainers whose linked Force Areas match to those linked to my record$/)do
  page.all(:css,('linked_force_area')[0],text: 'METROPOLITAN POLICE')
  if(page.find("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 365 days:'))
    page.all(".dors-table").count == 1
    expect(page).to have_selector(:css,".trainer-licenseCode", text: '525252/002')
  end
  if(page.all(".dors-table").count > 1)
  expect(page).all(:css,".dors-table").should be_visible
  end
  end


When(/^I start typing three letters as "([^"]*)" in the trainer search force areas$/) do |chars|
  find('.ui-select-search').set(chars)
end

Then(/^The system will start autopredicting it and the list of highlight "([^"]*)" appear$/) do |forceareaname|
   expect(page).to have_css('.ui-select-container',visible: true)
   expect(page).to have_css("#ui-select-choices-row-0-0", text: forceareaname)
   find('.ui-select-search').send_keys(:enter)
   expect(page).to have_css(".selectedForceAreaFilter", match: :first, text: forceareaname)
   expect(page).to have_css(".ui-select-choices-row-inner",match: :first,text: 'BEDFORDSHIRE POLICE')
  end

And(/^I should see selected force areas in search force area filter$/) do
  expect(page).to have_selector(:css, ".selectedForceAreaFilter")
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


And (/^I won't see trainers who have a Force Area assigned which I am not linked to$/)do
  @trainers.auto_authorise_assessment_request_page.verify_list_of_trainers_not_related_to_assessor
  page.find(:css,"#btnResetForceAreas").click
  puts page.find(:css,".selectedForceAreaFilter",match: :first).text
end

And (/^the Force Areas filter control on the page will have my linked Force Areas pre-selected as default$/)do
  @trainers.auto_authorise_assessment_request_page.verify_defalut_preselected_forcearea
end
