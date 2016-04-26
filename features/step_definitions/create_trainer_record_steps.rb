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


And (/^I try to update "([^"]*)" and "([^"]*)"$/) do |status,date|
  @trainers.create_trainer_record_page.update_diff_licence_status_with_expiry_date(status,date)
end

And (/^I click update Trainer button$/)do
  @trainers.create_trainer_record_page.updateTrainer_button.click
end


Then (/^I should see a message saying "([^"]*)"$/)do |message|
  expect(page).to have_selector(:css,".toast-message", text: message)
end
