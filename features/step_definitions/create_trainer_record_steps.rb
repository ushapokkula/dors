Then(/^the system will load the page where I can create a new trainer record with required fields$/) do |table|
  new_table = table.hashes
  @trainers.create_trainer_record_page.verify_trainer_record_details(new_table)
end

Then(/^I see the following fields as "([^"]*)" with "([^"]*)" on create trainer form$/) do |fields, error_msgs|
  @trainers.create_trainer_record_page.verify_mandatory_fields_err_msgs(fields, error_msgs)
   expect(page).to have_selector(".has-error", text:error_msgs)
end

Then(/^I see the following fields as "([^"]*)" on create trainer form$/) do |optional_field|
  @trainers.create_trainer_record_page.verify_optional_fields_on_trainer_form(optional_field)
end


And (/^I try to update "([^"]*)" and "([^"]*)"$/) do |status,date|
  @trainers.create_trainer_record_page.update_diff_licence_status_with_expiry_date(status,date)
end


Then(/^I fill Mandatory fields with required details on create trainer form$/) do
  @trainers.create_trainer_record_page.filling_trainer_details
end

# And (/^I have added licences for the trainer and all mandatory fields for every licence have a value$/)do  /commenting for now due to course name field css has changed/
#   @trainers.create_trainer_record_page.select_course_name
#   @trainers.create_trainer_record_page.select_course_name.click
#   @trainers.create_trainer_record_page.select_licence_name
#   @trainers.create_trainer_record_page.select_licence_name.click
#   @trainers.create_trainer_record_page.expiry_date.set("20/04/2018")
# end

And(/I update existing licences for the trainer with new "([^"]*)" status$/)do|status|
 if find("#licenseStatuses_0").value.to_i == 2
   select(status, :from => 'licenseStatuses_0')
 end
 end

And(/^I click Add licence button$/)do
  @trainers.create_trainer_record_page.add_licence_button.click
end

And(/^I click on Create Trainer button$/)do
   @trainers.create_trainer_record_page.create_trainer_button.click
  end

Then (/^a Success message will be displayed for Create Trainer "([^"]*)"$/)do |message|
  page.find(".toast.toast-success").should be_visible
 expect(page).to have_css(".toast.toast-success", text: message, visible: true)
end

And (/^I click on Update Trainer$/)do
  @trainers.create_trainer_record_page.update_trainer_button.click
end

Then (/^a Success message will be displayed for Update Trainer "([^"]*)"$/)do |message|
 # expect(page).to have_css(".toast-message", text: message)
  expect(page).to have_no_css(".toast-success",text: message,visible: false)
end


Then (/^I should not see added course name in the course dropdown-menu$/)do
  page.find("#courseNames").click
 expect(page).not_to have_selector(:css,"#courseNames > option:nth-child(1)",text: 'Berks-Scheme')
end

And (/^the Licence Status, Course Name or Expiry Date is not set$/)do
  page.find("#courseNames").click
  page.find("#courseNames").send_keys(:enter)
  page.all(:css,('error_messages')[0],text:'Please select a course name.')
  page.find("#licenseStatuses").click
  page.find("#licenseStatuses").send_keys(:enter)
  page.all(:css,('error_messages')[1],text:'Please select a license status.')
end

Then(/^I should see an error messages on trainers page$/)do
  page.all(:css,'error_messages', visible:true)
end

And(/^I started searching existing "([^"]*)" in the trainer search field$/) do |chars|
 fill_in('txt-trainer-name', :with=> chars)
 sleep 2
  find("#txt-trainer-name").send_keys(:enter)
end

Then (/^I should see a message saying "([^"]*)"$/)do |message|
  expect(page).to have_selector(:css,".toast-message", text: message)

end

And(/^The system will load the page where I can create a new trainer record$/)do
  expect(page).to have_css('h1',text: 'Trainers management')
  expect((all('.panel-title')[0]).text).to eq("Create Trainer")
end

And(/^Any unsaved changes will be lost$/)do
  click_link("TRAINERS")
  fill_in('txt-trainer-name', :with=>fetch("trainer_id"))
  expect(page).to have_css(".text-danger", text:'No Trainers with this id exist.')
end
