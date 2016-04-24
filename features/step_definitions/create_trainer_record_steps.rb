Then(/^the system will load the page where I can create a new trainer record with the following fields$/) do |table|
  new_table = table.hashes
  @trainers.create_trainer_record_page.verify_trainer_record_details(new_table)
end

Then(/^I see the following fields as "([^"]*)" with "([^"]*)" on create trainer form$/) do |fields, error_msgs|
  @trainers.create_trainer_record_page.verify_mandatory_field_err_msgs(fields, error_msgs)
end

Then(/^I see the following fields as "([^"]*)" on create trainer form$/) do |optional_field|
  @trainers.create_trainer_record_page.verify_optional_fields_on_trainer_form(optional_field)

end

When(/^I start searching for existing "([^"]*)" in the trainer search field$/)do |chars|
  fill_in('txt-trainer-name', :with => chars)
  find("#txt-trainer-name").send_keys(:enter)
end

Then(/^I should see existing trainer details on trainer management page$/)do
expect(page).to have_selector(:css,"h3.panel-title",match: :first,text:'Update Trainer')
expect(page).to have_selector(:css,"h3.panel-title",match: :'one',text:'Licences')
expect(page).to have_selector(:css,"#licenseStatuses_2 > option:nth-child(2)", text:'Full') #verifying 'Full' licence state#
expect(page).to have_selector(:css,"#licenseStatuses_3 > option:nth-child(1)",text:'Provisional/Conditional') #verifying 'Provisional' licence state#
end

Then(/^I see "Trainers management" page$/)do
  expect(page).to have_content("Trainers management")
  expect(page).to have_content("Licences")
  @trainers.create_trainer_record_page.verify_default_trainer_licence_details
end

Then(/^I see the following default Licence status fields$/) do |table|
  new_table = (table.hashes)
  @trainers.create_trainer_record_page.verify_default_licence_fields(new_table)
end

And (/^I try to update "([^"]*)" and "([^"]*)"$/) do |status,date|
  @trainers.create_trainer_record_page.update_diff_licence_status_with_expiry_date(status,date)
end

And (/^I click update Trainer button$/)do
  @trainers.create_trainer_record_page.updateTrainer_button.click
end

Then(/^the system will trigger the user with an error message "([^"]*)" on trainer page$/)do |message|
  expect(page).to have_selector(:css,".help-block p", text: message)
end

And(/^I change "([^"]*)" in past for trainer which has Licence state of 'Full' or 'Provisional'$/)do |date|
 if(page.should have_css("#licenseStatuses_2 > option:nth-child(2)", text:'Full'))
    page.find("#licenseExpiryDate_2").set(date)
    page.find("#licenseExpiryDate_2").send_keys(:enter)
 end

if(page.should have_css("#licenseStatuses_3 > option:nth-child(1)",text:'Provisional/Conditional'))
    page.find("#licenseExpiryDate_3").set(date)
    page.find("#licenseExpiryDate_3").send_keys(:enter)
  end
end

Then (/^I should see a message saying "([^"]*)"$/)do |message|
  expect(page).to have_selector(:css,".toast-message", text: message)
end


#DR-39#
When (/^I select the "([^"]*)" as 'Expired' or 'Suspended'$/)do
expect(page).to have_selector()
end





