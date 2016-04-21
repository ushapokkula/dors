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


Then(/^I see "Trainers management" page$/)do
  expect(page).to have_content("Trainers management")
  expect(page).to have_content("Licences")
  @trainers.create_trainer_record_page.verify_default_Licence_trainer_page
end

Then(/^I see the following default Licence status fields$/) do |table|
  new_table = (table.hashes)
  @trainers.create_trainer_record_page.verify_default_licence_fields(new_table)
end

And (/^I try to update "([^"]*)" and "([^"]*)"$/) do |status,date|
  @trainers.create_trainer_record_page.update_diff_licence_status_with_expiry_date(status,date)
end

And (/^I click update Trainer button$/)do
  page.find("#btnCreateUpdateTrainer").click
end

Then(/^the system will trigger the user with an error message "([^"]*)" on trainer page$/)do |message|
  expect(page).to have_selector(:css,".help-block p", text: message)


end

Then(/^trainer record page get displayed with Licence state of 'Full or Provisional' with Expiry date$/)do
  expect(page).to have_css("#licenseStatuses_2", text: 'Full',visible:true)
  puts page.find("#licenseExpiryDate_2").text
  expect(page).to have_css("#licenseStatuses_3", text: 'Provisional/Conditional',visible:true)
  puts page.find("#licenseExpiryDate_3").text
end

And (/^I try to change "([^"]*)" in past$/)do |date|
  page.find("#licenseExpiryDate_2").set(date)
  page.find("#licenseExpiryDate_2").send_keys(:enter)
  page.find("#licenseExpiryDate_3").set(date)
  page.find("#licenseExpiryDate_3").send_keys(:enter)
end

Then (/^I should see a message saying "([^"]*)"$/)do |message|
  expect(page).to have_selector(:css,".toast-message", text: message)
end







