Given(/^I am on Assessment Request Summary page$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
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

And(/^I have not included multiple trainers in my request$/) do
  puts "No trainer include in the assessment request"
end

And(/^I click "([^"]*)" button without entering data$/) do |button|
  click_link_or_button(button)
end

Then(/^I will see only those trainers whose linked Force Areas match to those linked to my record$/) do
  page.find_all(('linked_force_area_name')[0], text: 'GREATER MANCHESTER POLICE')
  expect(page).to have_css("#assessmentExpiringIntro", text: 'Trainer licenses expiring within the next 365 days:')
  page.find_all('.dors-table', count: 1)
  expect(page).to have_css(".trainer-licenseCode", text: '268721')
  expect(page).to have_css(".license-expiry-date", text: '16-May-2017')
end

And (/^I should see the matching Force Area Name in Force Area Filters$/) do
  page.find_all(('linked_force_area_name')[0], text: 'NORTHUMBRIA POLICE')
end

When(/^I start typing three letters as "([^"]*)" in the trainer search force areas$/) do |chars|
  find('.ui-select-search').set(chars)
end

Then(/^The system will start autopredicting it and the list of highlight "([^"]*)" appear$/) do |forceareaname|
  expect(page).to have_css('.ui-select-container', visible: true)
  expect(page).to have_css("#ui-select-choices-row-0-0", text: forceareaname)
end

And (/^I hit enter to see the selected "([^"]*)" in Force Area filter$/) do |forceareaname|
  find('.ui-select-search').send_keys(:enter)
  page.find_all(('linked_force_area_name')[0], text: forceareaname)
end

Then(/^I should see message for "([^"]*)"$/) do |message|
  expect(page).to have_selector(:css, ".alert.alert-info", text: message)
end

And (/^I won't see trainers who have a Force Area assigned which I am not linked to$/) do
  @trainers.auto_authorise_assessment_request_page.verify_list_of_trainers_not_related_to_assessor
end

And (/^the Force Areas filter control on the page will have my linked Force Areas pre-selected as default$/) do
  @trainers.auto_authorise_assessment_request_page.verify_defalut_preselected_forcearea
end


And(/^I can see "([^"]*)" field available on the page$/) do |filter_label|
  find('label', text: filter_label, visible: true)
  expect(page).to have_css("#txt-trainer-name", visible: true)

end

When(/^I start typing atleast three characters as "([^"]*)"in the 'filter by trainer' field$/) do |chars|
  fill_in('txt-trainer-name', :with => chars)
end

Then(/^The system will auto\-predict and show possible trainer names and IDs in a dropped down list$/) do
  expect(page).to have_css(".dropdown-menu li", minimum: 1)
end

When(/^I enter a valid and existing trainer ID of six digits as "([^"]*)" in the filter by trainer field$/) do |trainer_id|
  fill_in('txt-trainer-name', :with => trainer_id)
end

When(/^The search criteria "([^"]*)" does'nt match any trainer record$/) do |search_criteria|
  fill_in('txt-trainer-name', :with => search_criteria)
end

Then(/^The second value will be selected from the auto predict list of trainer filter "([^"]*)"$/) do |trainer_id|
  expect(page).to have_content(trainer_id)
end

Then(/^The first name will be selected from the auto predict list of trainer filter "([^"]*)"$/) do |trainer_id|
  expect(page).to have_content(trainer_id)
end

When(/^I hit UP arrow key from the trainer filter auto predict list$/) do
  fill_in('txt-trainer-name', :with => "_auto")
  find("#txt-trainer-name").native.send_keys(:arrow_down)
  find("#txt-trainer-name").native.send_keys(:arrow_up)
  find("#txt-trainer-name").send_keys(:enter)
end

Then(/^The first trainer name will be selected from the drop down list by default$/) do
  expect(page).to have_css(".trainer-licenseCode", count: 2, text: '111222')
end

When(/^I hit enter after typing first three characters of trainer name$/) do
  find("#txt-trainer-name").send_keys(:enter)
end

Then(/^I see "([^"]*)" button is visible within filters section$/) do |button_name|
  within(".well") do
     expect(page).to have_button(button_name, visible:true)
  end
end

When(/^I select a trainer from auto predict list of trainer filter$/) do
  fill_in('txt-trainer-name', :with => "_auto")
  expect(page).to have_css(".dropdown-menu li", minimum: 1)
  find("#txt-trainer-name").send_keys(:enter)
end

Then(/^the system will show the trainer licence records they hold on the "([^"]*)" page$/) do |request_page|
  expect(page).to have_css("h1", text: request_page)
  expect(page).to have_css(".dors-table", count:2, visible: true)
end

And(/^the listing will include the fields as below$/) do |table|
  new_table = table.hashes
  @trainers.auto_authorise_assessment_request_page.verify_trainer_licence_records_listing(new_table)
end

And(/^the listing will also include Trainer Name and course name$/) do
expect(page).to have_css(".primary-color.trainer-full-name", visible:true)
expect(page).to have_css(".license-scheme-name", visible:true)
end

When(/^I click X to remove trainer in filter by trainer field$/) do
  find(".glyphicon.glyphicon-remove").click
end

Then(/^the list of all licence records matching 'Essex Police'  force will be displayed$/) do
  expect(page).to have_css(".dors-table",visible:true , count:8)
end