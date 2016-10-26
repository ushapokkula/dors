Given(/^I search for "([^"]*)" and "([^"]*)" in the trainer search field$/) do |firstname, lastname|
  @trainers.edit_or_update_trainer_record_page.search_trainer_field.set(firstname + " " + lastname)
  sleep 1 # for some reason i needed this sleep, need to figure out why
  @trainers.edit_or_update_trainer_record_page.search_trainer_field.send_keys(:enter)
end


Then(/^I see "Trainers management" page$/) do
  expect(page).to have_content("Trainers management")
  expect(page).to have_content("Licences")
  expect(page).to have_css(".ui-select-container", visible: true)
  expect(page).to have_css("#licenseStatuses", visible: true)
end


Then(/^I should see searched "([^"]*)" and "([^"]*)" trainer details$/) do |firstname, lastname|
  WaitUtil.wait_for_condition("waiting for first name and last name", :timeout_sec => 5, :delay_sec => 0.5) do
    @trainers.edit_or_update_trainer_record_page.trainer_first_name.value == firstname
    @trainers.edit_or_update_trainer_record_page.trainer_last_name.value == lastname
  end
end

Then(/^I see the following default Licence status in Licence status dropdown$/) do |table|
  expected_options = table.hashes.map { |x| x['Licence Status'] }
  actual_options = @trainers.edit_or_update_trainer_record_page.licence_status_options.map { |x| x.text }
  expect(actual_options).to match_array(expected_options)
end

And(/^I change "([^"]*)" in past for trainer which has Licence state of 'Full' or 'Provisional'$/) do |date|
  if find("#licenseStatuses_2").value.to_i == 1
    page.find("#licenseExpiryDate_2").set(date)
    page.find("#licenseExpiryDate_2").send_keys(:enter)
  end

  if find("#licenseStatuses_3").value.to_i == 2
    page.find("#licenseExpiryDate_3").set(date)
    page.find("#licenseExpiryDate_3").send_keys(:enter)
  end
end

Then(/^the system will trigger the user with an error message "([^"]*)" on trainer page$/) do |message|
  expect(page).to have_selector(:css, ".help-block p", text: message)
end


When (/^I select the "([^"]*)" as 'Expired' or 'Suspended'$/) do |status|
  if find("#licenseStatuses_2").value.to_i == 1
    select(status, :from => 'licenseStatuses_2')
  end
end


Then(/^the system will default the Expiry Date to today's date$/) do
  t = Time.now()
  expiry_date = t.strftime("%d/%m/%Y")
  page.find("#licenseExpiryDate_2").value== expiry_date
end

And(/^I can change today's date to any other "([^"]*)" not in past$/) do |date|
  if find("#licenseStatuses_2").value.to_i == 1
    find("#licenseExpiryDate_2").click
    find("#licenseExpiryDate_2").set(date)
    find("#licenseExpiryDate_2").send_keys(:enter)
  end
end

When(/^I select the status as to 'Full' from any other value$/) do
  if find("#licenseStatuses_3").value.to_i == 2
    page.find("#licenseStatuses_3").click
    select('Full', :from => 'licenseStatuses_3')
  end
end

Then(/^the system will default the Expiry Date to 730 days from current date$/) do
  expiry_date = '(Date.today) + 730).to_s'
  page.find("#licenseExpiryDate_3").value == expiry_date #Verify adding 730 days to todays date#
end


And (/^I can change Expiry Date value to any other "([^"]*)" not in past$/) do |date|
  if find("#licenseStatuses_3").value.to_i == 2
    find("#licenseExpiryDate_3").click
    find("#licenseExpiryDate_3").set(date)
    find("#licenseExpiryDate_3").send_keys(:enter)
  end
end


When (/^I select the "([^"]*)" as 'Provisional or Conditional'$/) do |status|
  if find("#licenseStatuses_2").value.to_i == 1
    page.find("#licenseStatuses_2").click
    select(status, :from => 'licenseStatuses_2')
  end
end

Then (/^the system will default the Expiry Date to 183 days from current date$/) do
  expiry_date = '(Date.today) + 183).to_s'
  page.find("#licenseExpiryDate_2").value == expiry_date
end

And (/^I can change Expiry Date to any other "([^"]*)" as well not in past$/) do |date|
  if find("#licenseStatuses_2").value.to_i == 1
    find("#licenseExpiryDate_2").click
    find("#licenseExpiryDate_2").set(date)
    find("#licenseExpiryDate_2").send_keys(:enter)
  end
end

When (/^I manually set the "([^"]*)" to more than 730 days from system or current date$/) do |date|
  if find("#licenseStatuses_2").value.to_i == 3
    find("#licenseExpiryDate_2").click
    find("#licenseExpiryDate_2").set(date)
    find("#licenseExpiryDate_2").send_keys(:enter)
    expiry_date = '((Date.today)+ 730).to_s'
    page.find("#licenseExpiryDate_2").value > expiry_date
  end
end


Then(/^the system will show a soft warning message, "([^"]*)"$/) do |message|
  page.should have_css(".text-danger", text: message)
end

When (/^I have made desired changes for "([^"]*)" and click 'Update Trainer'$/) do |postcode|
  page.find("#trainerPostcode").click
  page.find("#trainerPostcode").set(postcode)
  @trainers.edit_or_update_trainer_record_page.updateTrainer_button.click

end

And (/^the system will show a success message, "([^"]*)"$/) do |message|
  expect(page).to have_css(".toast-message", text: message)
end

Then(/^I can see Legend with "([^"]*)" and "([^"]*)"$/) do |practical, theory|
  expect(page).to have_css(".legend-practical > i", text: '')
  expect(page).to have_css(".legend-practical-label", text: practical)
  expect(page).to have_css(".legend-theory > i", text: '')
  expect(page).to have_css(".legend-theory-label", text: theory)
end

Then(/^I should see added course name field will be disabled$/) do
  find_all(".selected-license-course[disabled='']", visible: true)
end

And(/^I can not see 'X' button to delete the added Course$/) do
  expect(page).to have_no_css(".btn-remove-license")
end

And (/^I can see added course Icon next to the Course Name$/) do
  expect(page).to have_css(".form-group i.glyphicon", visible: true)
  page.find_all(".form-group i.glyphicon") #verifying all added schemes type icons
end

Then (/^I should see selected licence type shown with "([^"]*)", "([^"]*)", "([^"]*)"$/) do |coursename, status, date|
  if coursename == 'Driving For Change'
    find_all(('input.selected-license-course')[0], text: coursename, visible: false) #these are predefined data not sure how this data will appears in auto env ? need to check once its merged
    page.find("#licenseStatuses_0", text: status)
    page.find("#licenseExpiryDate_0").value == date
  end
  if coursename == "What's Driving Us?"
    find_all(('input.selected-license-course')[1], text: coursename, visible: false)
    page.find("#licenseStatuses_1", text: status)
    page.find("#licenseExpiryDate_1").value == date
  end
  if coursename == "National Driver Alertness Course"
    find_all(('input.selected-license-course')[2], text: coursename, visible: false)
    page.find("#licenseStatuses_2", text: status)
    page.find("#licenseExpiryDate_2").value == date
  end


end

Then (/I should see number of "([^"]*)" of type "([^"]*)"$/) do |course_type, course_name|
  if course_type == "Theory Course"
    expect(page).to have_css(".ui-select-choices-row-inner", :count => 1)
    expect(page).to have_css(".ui-select-choices-row-inner", text: course_name)
    page.find(".ui-select-search").send_keys(:enter)
    expect(page).to have_css(".ui-select-match-text")
    expect(page).to have_css("span.glyphicon-book")
  end
  if course_type == "Practical Course"
    expect(page).to have_css(".ui-select-choices-row-inner", :count => 1)
    expect(page).to have_css(".ui-select-choices-row-inner", text: course_name)
    page.find(".ui-select-search").send_keys(:enter)
    expect(page).to have_css(".ui-select-match-text")
    expect(page).to have_css("span.glyphicon-road")
  end
end

