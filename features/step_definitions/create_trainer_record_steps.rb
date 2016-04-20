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


When (/^the default view of the trainer page loaded$/)do
  expect(page).to have_content("Trainers management")
  expect(page).to have_content("Licences")
  @trainers.create_trainer_record_page.verify_default_Licence_trainer_page
end

Then(/^I see the following default Licence status fields$/) do |table|
  new_table = (table.hashes)
  @trainers.create_trainer_record_page.verify_default_licence_fields(new_table)
end

And (/^I should able to edit exisiting licences status "([^"]*)" and "([^"]*)"$/) do |status,date|
  @trainers.create_trainer_record_page.verify_error_message_for_diff_licence_status(status,date)
end

And (/^I click update Trainer button$/)do
  page.find("#btnCreateUpdateTrainer").click
end

Then(/^I should see an error message "([^"]*") on trainer page$/)do |message|
  page.find(".help-block p").should have_text(message)

end





#@trainers.create_trainer_record_page.verify_editable_fields_of_trainer_licences






