Given(/^I am on Pick a Slot Page$/) do

end

And(/^The mileage field will only take numbers$/)do
  fill_in('mileage', :with => '500')
  find("#mileage").value == '500'
end

And(/^The notes field will take free text upto 1000 characters$/)do
@trainers.submit_assessment_request_page.verify_notes_field_limit(1000)
end

And(/^I enter characters in the mileage field apart from numbers$/)do
  fill_in('mileage', :with => 'ABC')
end

And(/^more than 1000 characters in notes field$/)do
  @trainers.submit_assessment_request_page.verify_notes_field_limit(1500)
end

Then(/^I should not be able to enter Invalid or morethan 1000 characters in mileage and notes field respectively$/)do
  find("#mileage").value == ''
  find("#notes").value.length
  find("#notes").value.length == 1000
end

And(/^I fill Optional mileage and Notes fields$/)do
  fill_in('mileage', :with => '500')
end

And(/^The assessment request will be submitted and saved in the database$/)do
  expect(page).to have_css(".alert.alert-success",visible:true)
  @trainers.ngu_search_assessment_id_page.verify_requested_assessment_status_in_DB
  expect($assessment_status).to equal(1)
end

And(/^An assessment ID will be generated in the format 100xxx$/)do
  @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
    expect($requested_status).to match(/100[0-9][0-9][0-9]/)
  end

And(/^I see the success message "([^"]*)" on the page$/)do |text|
  expect(page).to have_css(".alert.alert-success", text: "The assessment has been Requested")
end

And(/^The status of the assessment request will be marked as Requested$/)do
  expect($assessment_status).to equal(1)
end

And(/^I click Cancel on this page without entering any data into mileage and notes field$/)do
click_button("Cancel")
end

And(/^I will be redirected back to the Pick a Slot page$/)do
  expect(page).to have_css('h1', text: "Request Assessment")
end

And(/^I enter data into mileage and notes field$/)do
  @trainers.auto_authorise_assessment_request_page.navigate_assessment_request_summary_page
  fill_in('mileage', :with => '500')
  @trainers.submit_assessment_request_page.verify_notes_field_limit(780)
end


Then(/^The system will load Assessment Request Summary page with following Assessor details$/) do
  expect(page).to have_css(".assessor-details-label", visible:true)
  expect(page).to have_css(".assessor-full-name", visible:true)
  expect(page).to have_css(".assessor-full-address", visible:true)
end

And(/^I see a message displaying that the assessment has been requested with assessment Id and date$/)do
  expect(page).to have_css(".alert.alert-success")
  assessment_id = find("#requested-assessment-id").text
  assessment_date = find("#requested-assessment-date").text
  expect(page).to have_css(".alert.alert-success", text:"Assessment #{assessment_id} scheduled for #{assessment_date} has been Requested")
end


Then(/^The page will display with the following Trainer Details$/) do |table|
  new_table = table.hashes
  columns = new_table.map { |x| x['Trainer Details'] }
  for i in 1..columns.size
    expect(page).to have_content(columns[i])
  end
  end


Then(/^I see that the primary trainer is included by default$/) do
  all("input.include-main-trainer-checkbox[type='checkbox']")[1].should be_visible == false
  #@trainers.auto_authorise_assessment_request_page.primary_trainer_include_bydefault
end

Then(/^I will be able to Include or Exclude other trainer$/) do
  expect(page).to have_css(".include-main-trainer-checkbox", visible:true)

end

When(/^I check "([^"]*)" for second trainer$/) do |checkbox_label|
   # puts expect(page).to have_css(".include-main-trainer-checkbox", text:checkbox_label)
    (page.find_all(".include-main-trainer-checkbox")[1]).click

end

Then(/^I uncheck "([^"]*)" for second trainer$/) do |checkbox_label|
  page.find_all(".include-main-trainer-checkbox")[1].click
end

Then(/^The system will not include the secondary trainer in the booking request$/) do
 find_all(".include-main-trainer-checkbox")[1].should_not be_checked == true
end

And(/^I see that licence code is replaced by "([^"]*)" on summary page$/) do |label_name|
 expect(page).to have_css(".trainer-id-label", text: label_name)
 expect(page).to have_css(".nearby-trainer-id-label", text: label_name)
end

Then(/^the primary trainer will be shown with "([^"]*)" checkbox on summary page$/) do |checkbox_label|
  expect(page).to have_css(".include-main-trainer-checkbox[disabled='disabled']:nth-child(1)", visible:true)
end

And(/^the primary trainer by default it will be checked and disabled$/) do
   expect(page).to have_css(".include-main-trainer-checkbox[disabled='disabled']:nth-child(1)", visible:true)
   find_all((".include-main-trainer-checkbox[type='checkbox']:nth-child(1)")).should be_checked
end


Then(/^the assessment id is displayed under main trainer details against the trainer who is already in assessment$/) do
  @trainers.ngu_search_assessment_id_page.verify_requested_assessmemt_id_in_DB
  find(:button, 'Request Assessment', match: :first).click
  expect(page).to have_css(".auto-main-trainer-on-assessment", text:$requested_status)
end

Then(/^the assessment id is displayed under nearby trainer details against the trainer who is already in assessment$/) do
  @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
  find(:button, 'Request Assessment', match: :first).click
  expect(page).to have_css(".auto-trainer-on-assessment", text:$booked_status)
end

And(/^I Pick first slot$/) do
  find(:button, 'Pick a slot', match: :first).click
end

And(/^I include all the trainers from "([^"]*)" scheme as the trainer who is in assessment$/) do |scheme_name|
  expect(page).to have_css(".breadcrumb .active>span", text:'Summary')
 find_all(".include-nearby-trainer-checkbox",visible: true)[0].click
end

Then(/^the "([^"]*)" scheme courses are hidden as all the trainers from that scheme are in assessment$/) do |scheme_name|
    expect(page).to have_no_content(scheme_name)
end

Then(/^I can see the Scheme Name for main trainer$/)do
  expect(page).to have_css(".dors-well .col-lg-offset-3 h4")  #verify main trainer scheme name
end


Then(/^I can see the Scheme Name for nearBy trainer$/)do
  expect(page).to have_css('.dors-well-other .col-md-offset-3 h4', match: :first, visible: true)  #Verify near By trainer scheme name
  find_all('.dors-well-other .col-md-offset-3 h4', match: :first, text: "Speed Control")
end


Then(/^I should see License Type for main trainer$/) do
  within('.dors-well')do
expect(page).to have_css('.trainer-license-type-label', text: 'License Type')    #verify main trainer Licence name label
expect(page).to have_css('.trainer-license-type')                                 #verify main trainer Licence name
end
end


Then(/^I should see License Type for nearBy trainer$/) do
    expect(page).to have_css('.dors-well-other .trainer-license-type-label',text: 'License Type')   #verify nearBy trainer Licence name label
    expect(page).to have_css('.dors-well-other .trainer-license-type')                                 #verify nearBy trainer Licence name
  end


Then(/^I should see Expiry Date for main trainer$/) do
  within('.dors-well')do
  expect(page).to have_css(".main-license-expirydate-label", text: 'Expiry Date')      #verify main trainer Expiry date label
 expect(page).to have_css(".main-license-expirydate")                                  #verify main trainer Expiry date value
  end
  end

Then(/^I should see Expiry Date for nearBy trainer$/) do
  expect(page).to have_css(".dors-well-other .nearBy-license-expirydate-label", text: 'Expiry Date')     #verify nearBy trainer Expiry date label
  expect(page).to have_css(".dors-well-other .nearBy-license-expirydate")                                 #verify nearBy trainer Expiry date value
end


Then(/^I can see "([^"]*)" has "([^"]*)" type licence on summary page$/)do |name, licence_type|
  find_all(".main-trainer-fullname", match: :first, text: name)
expect(page).to have_css(".dors-well .trainer-license-type", match: :first, text: licence_type)
end

And (/^I can see "([^"]*)" has "([^"]*)" course on summary page$/)do|name, course|
 find_all(".main-trainer-fullname", match: :first, text: name)
  expect(page).to have_css(".dors-well .col-lg-offset-3 h4", text: course)
end

When (/^I 'Pick a slot' on Request Assessment Page for "([^"]*)"$/)do |name|
if (name == 'Heather Mcqueen_Auto')
  expect(page).to have_css("h1", text:'Request Assessment')
  find(:button, 'Pick a slot', match: :first).click if find(:button, 'Pick a slot', match: :first)
end
  if(name == 'Chris_Auto')
    expect(page).to have_css("h1", text:'Request Assessment')
    find_all(".dors-table-row.row .btn",visible: true)[1].click
  end
  end
