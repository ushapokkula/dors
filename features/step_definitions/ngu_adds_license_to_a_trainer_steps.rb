And(/^I see button "([^"]*)" available under the licences section$/) do |button|
  within(all(".panel-body")[1]) do
    expect(page).to have_button(button, visible: true)
  end
end

Then(/^The "([^"]*)" button  is not visible when maximum licenses are added to a trainer$/) do |button|
  within(all(".panel-body")[1]) do
    expect(page).to have_no_button(button, visible: true)
  end
end

And(/^I select course name, licence status and expiry date to add a new licence$/) do
  select('Motorway Course', :from => 'courseNames')
  select('Full', :from => 'licenseStatuses')

end

And(/^The system will add another row of licence entry below those already displayed$/) do
  expect(page).to have_xpath("html/body/div[1]/div/div[5]/div[2]/form[1]/div[3]")
end

And(/^"([^"]*)" and "([^"]*)" fields are editable for added licenses$/) do |field1, field2|
  field_labeled(field1, :disabled => false)
  field_labeled(field2, :disabled => false)
end

And(/^Expiry Date will have a date picker calender$/) do
  find("#licenseExpiryDate").click
  expect(page).to have_css(".uib-datepicker-popup", visible: true)
end

When(/^I enter past date in Expiry Date$/) do
  fill_in('licenseExpiryDate', :with => '01/01/2016')
  page.find('#licenseExpiryDate').native.send_keys(:enter)
end

And(/^The user should get an error as "([^"]*)" below "([^"]*)"$/) do |message, field|
  error_message = find(:xpath, ".//*[text()='#{field}']/parent::Div//p").text
  expect(error_message).to eq(message)
end

And(/^The Expiry Date will be defaulted to "([^"]*)"$/) do |days|
  @trainers.ngu_adds_licence_to_a_trainer_page.verify_default_expiry_date(days)
end

And(/^I select Course "([^"]*)" to add a licence$/) do |course_name|
  select(course_name, :from => 'courseNames')
end

And(/^I select licence as "([^"]*)" to add a licence$/) do |licence|
  select(licence, :from => 'licenseStatuses')
end

And(/^I see 'X' button for added new licence which is not saved to dataabase$/) do
  expect(page).to have_css(".btn-remove-license", visible: true)
end

And(/^The licence row will be deleted$/) do
  expect(page).to have_no_css(".btn-remove-license", visible: true)
end

And(/^The X button will not be available for licences persisted in the DB$/) do
  expect(page).to have_no_css(".btn-remove-license", visible: true)
end

And(/^I click X button$/) do
  find(".btn-remove-license").click
end

And(/^Changes will be reflected on page$/) do
  find("#courseNames").click
  expect(page).to have_select('courseNames', :with_options => ['Motorway Course'])
  # page.should have_select('#courseNames', :options => 'Motorway Course')
end

And(/^I click "([^"]*)" without setting the data$/) do |field_name|
  find_field(field_name).click
end

Then(/^I see "([^"]*)" against each "([^"]*)"$/) do |message, field|
  error_message = find(:xpath, ".//*[text()='#{field}']/parent::Div//p").text
  expect(error_message).to eq(message)
end

And(/^The "([^"]*)" is not available in the Course dropdown to select for another licence$/) do |course_name|
  find("#courseNames").click
  expect(page).to have_no_select('courseNames', :with_options => [course_name])
end


And(/^I add two licences to the trainer with "([^"]*)" and "([^"]*)" with status as "([^"]*)"$/) do |course1, course2, status|
  select(course1, :from => 'courseNames')
  select(status, :from => 'licenseStatuses')
  click_button('Add licence')
  select(course2, :from => 'courseNames')
  select(status, :from => 'licenseStatuses')
end

And(/^I see there are no multiple licences for "([^"]*)" and "([^"]*)"$/) do |course1, course2|
  expect(page).to have_no_select('courseNames', :with_options => [course1, course2])
end

And(/^I will be redirected to the Update trainer page$/) do
  expect(page).to have_no_css(".toast-message", text: "New trainer successfully created.")
  expect(page).to have_button('Update Trainer', visible: true)
end

And(/^The system will update the Trainer record in the database and add licenses against it$/) do
  @trainers.create_trainer_record_page.verify_licence_format
end

And(/^licence Id will be generated in this format "([^"]*)"$/) do |format|
  actual_format = $licence_code.split('/')
  expected_format = format.split('/')
  expect(expected_format[0].length).to eq(actual_format[0].length)
  expect(expected_format[1].length).to eq(actual_format[1].length)
   end

And(/^I see that there no licences for the same course$/) do
  @trainers.create_trainer_record_page.verify_duplicate_licences_for_same_course

end

And(/^I will be able to add licences to the trainer record as i create them$/) do
  expect((all('.panel-heading')[1]).text).to eq("Licences")
  expect(page).to have_button('Add licence')
end

And(/^The Course Name dropdown will be populated with current active schemes$/) do
  @trainers.ngu_adds_licence_to_a_trainer_page.verify_active_schemes
end

And(/^Licence section will by default include one licence row with these fields$/) do |table|
  new_table=table.hashes
  @trainers.ngu_adds_licence_to_a_trainer_page.verify_licence_section_labels(new_table)
end

And(/^The "([^"]*)" button is enabled$/) do |button|
  expect(page).to have_button(button, visible: true)
end

And(/^I have not reached the limit of maximum licences possible$/) do
  expect(page).to have_no_css(".alert.alert-info.text-center ", text: "You have reached the maximum number of licences")
end

And(/^I add a new licence with "([^"]*)" course and licence status as "([^"]*)"$/) do |course_name, licence_status|
  select(course_name, :from => 'courseNames')
  select(licence_status, :from => 'licenseStatuses')
end

And(/^I see the message "([^"]*)" under licences section$/) do |message|
  expect(page).to have_css(".alert.alert-info", text: message)
end