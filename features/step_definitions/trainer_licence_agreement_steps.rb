And (/^I will see a 'Licence Agreement' field on the trainer form$/) do
  expect(page).to have_css("[for='licenseAgreementStatus']", text: 'Licence Agreement')
  expect(page).to have_css("#licenseAgreementStatus")
end

And (/^I see 'Licence Agreement' field will be set to Unspecified by default$/) do
  expect(page).to have_css("#licenseAgreementStatus > option:nth-child(3)", text: 'Unspecified', visible: true)
end

And (/^'Licence Agreement' field will be disabled or read-only$/) do
  field_labeled('Licence Agreement', :disabled => true)
end

And (/^the 'Licence Agreement' will be shown as Unspecified$/) do
  find("#licenseAgreementStatus > option:nth-child(3)").should be_selected

end

And (/^'Licence Agreement' field will have three possible options$/) do |table|
  field_labeled('Licence Agreement', :disabled => false)
  actual = table.raw.flatten
  expected = all("#licenseAgreementStatus option").map { |x| x.text }
  expect(actual).to match_array(expected)
end

Then(/^I see the "([^"]*)" field is set to "([^"]*)"$/) do |arg1, arg2|
  expect(find("#trainer-status-active").checked?).to be true
 # page.find("#trainer-status-active").click
end

Then (/^I will be redirected to Licence Agreement screen$/) do
  expect(page).to have_css("h1", text: 'NDORS Licence Agreement')
end

And (/^I see licence agreement text with an option to Accept or Reject$/) do
  expect(page).to have_css(:button, text: 'Reject')
  expect(page).to have_css(:button, text: 'Accept')
end

And (/^I will not have access to any other system resources$/) do
  expect(page).to have_no_css("#btn-signout", text: 'Sign out')
end

When (/^I access any other system resource\(using URL\)$/) do
  @adminURL = "https://auto.trainer.dors.wtg.co.uk/#/admin/"
  visit @adminURL
  expected = page.current_url
  puts expected
end


And (/^I will not see 'Licence Agreement' field on my profile page$/) do
  expect(page).to have_no_css("#licenseAgreementStatus")
end

When (/^I search for (.*?)in the search trainer field$/) do |trainerid|
  fill_in('txt-trainer-name', :with => trainerid)
  sleep 2
  page.find('#txt-trainer-name').native.send_keys(:enter)
end

Then (/^the system will load trainer record in edit or update mode$/) do
  expect(page).to have_css("#trainer-status-active", visible: true)
end

And (/^I see Licence Agreement field in enabled state$/) do
  expect(page).to have_css("#licenseAgreementStatus", visible: true)
  page.find("#licenseAgreementStatus").click
end


When (/^I set trainer Licence Agreement to (.*?) value$/) do |agreement_status|
  select(agreement_status, :from => 'licenseAgreementStatus')
end

And (/^I set Status field to Inactive value$/) do
  expect(page).to have_css("#trainer-status", text:'Status')
  find("#trainer-status-inactive").click
end

And (/^I can see Status field value changes to Inactive$/) do
  page.find("#trainer-status-inactive").value == true
 # puts expect(find_field("Inactive")).to be_checked
end

When (/^I see 'Licence Agreement' field$/) do
  field_labeled('Licence Agreement', :disabled => false)
end

Then (/^I will remain on Update Trainers form$/) do
  expect(page.find_all('h3'[0], text: 'Update Trainer'))
  expect(page).to have_css(:button, text: 'Update Trainer')
end

And (/^I change 'Licence Agreement' to 'Unspecified'$/) do
  select('Unspecified', :from => 'licenseAgreementStatus')
end

And (/^I change 'Licence Agreement' to 'Accepted'$/) do
  select('Accepted', :from => 'licenseAgreementStatus')
end


And (/^I set Status field to Active value$/) do
  find("#trainer-status-active").click
end

Then (/^the system will load the trainer record in edit or update mode$/) do
  expect(page).to have_css("h3", text: 'Update Trainer')
  expect(page).to have_css("#btnCreateUpdateTrainer", text: 'Update Trainer')
end


Then(/^I see the Status field will be enabled$/) do
  expect(page).to have_css("#trainer-status-active")
  expect(page).to have_css("#trainer-status-inactive")
end


And (/^I can see updated Licence Agreement as "([^"]*)"$/) do |agreement_status|
   expect(page).to have_css("#licenseAgreementStatus", text: agreement_status, visible: true)
   expect(page).to have_no_css(".toast-success",text: agreement_status, visible: false)
end

Then (/^the Status field will be set to Inactive and disabled on the UI$/) do
  page.find("#trainer-status-inactive").value == false
end

Then (/^I will see a Inactive Trainer message with text, "([^"]*)"$/) do |confirmation_message|
  expect(page).to have_css(".modal-body", text: confirmation_message, visible: true)
end

Then (/^the message will close and no further action will be taken$/) do
  expect(page).to have_no_css(".modal-body", visible: false)
end

And (/^the status of every "([^"]*)" changed to 'Surrendered'$/) do |licences|
  expect(page).to have_css("#licenseStatuses_0", text: licences)
end

And (/^the expiry date of every licence changed to 'system date'$/) do
  t = Time.now()
  system_date = t.strftime("%d/%m/%Y")
  expect(find("#licenseExpiryDate_0").value).to eq(system_date)
  # page.find("#licenseExpiryDate_0").value== system_date  #changed as the assertion
end

Then (/^I will be redirected to login page$/) do
  expect(page).to have_css(:button, text: 'Sign in', visible: true)
end

Then(/^Reject Licence Agreement "([^"]*)" will display$/) do |licence_text|
  expect(page).to have_css(".modal-body", text: licence_text)
end

And (/^I reset cookies$/) do
  # page.execute_script "window.close();"
  Capybara.reset_sessions!
end


