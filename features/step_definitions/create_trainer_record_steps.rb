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

And (/^I add Licences$/)do
  @trainers.create_trainer_record_page.add_course
  @trainers.create_trainer_record_page.add_licences
  @trainers.create_trainer_record_page.add_expiry_date
end
And(/^I click Add licence button$/)do
  @trainers.create_trainer_record_page.add_licence_button
end

And(/^I click on create trainer button$/)do
   @trainers.create_trainer_record_page.create_trainer_button
  end

Then (/^I see success message$/)do
  page.find(".toast.toast-success").should be_visible
 expect(page).to have_selector(:css, ".toast.toast-success", text: "New trainer successfully created.")
end

And (/^I click update Trainer$/)do
  @trainers.create_trainer_record_page.update_trainer
end
Then (/^I see update message$/)do
  page.find(".toast-message").should be_visible
  expect(page).to have_selector(:css, ".toast-message", text: "Trainer record successfully updated.")
end

When(/^I hit enter after typing characters of trainer name$/)do
  find('#txt-trainer-name').set("roopa test")
  find('#txt-trainer-name').send_keys(:enter)

end

Then (/^I should not see added course$/)do
  page.find("#courseNames").click
  $find_current_course=page.find(:css,"#courseNames > option:nth-child(2)").text
  p($find_current_course)
  page.find(:css,"#courseNames > option:nth-child(2)").should_not have_text("Berks-Scheme")
end

Then (/^I should see error message on trainers page$/)do
  $error_mssg=page.find(:css,".help-block p").text
  p($error_mssg)
  page.find(:css,".help-block p", text: "Please select a course name.")
end
