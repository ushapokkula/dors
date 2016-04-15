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

Then(/^I fill Mandatory fields with required details on create trainer form$/) do
  @trainers.create_trainer_record_page.filling_trainer_details
end

  And(/^I click on create trainer button$/)do
   @trainers.create_trainer_record_page.create_trainer
  end

Then (/^I see success message$/)do
  page.find(".alert.alert-success").should be_visible
 expect(page).to have_selector(:css, ".alert.alert-success", text: "New trainer successfully created.")
end