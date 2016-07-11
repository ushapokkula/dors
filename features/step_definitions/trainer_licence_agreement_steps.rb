And (/^I will see a 'Licence Agreement' field on the trainer form$/)do
expect(page).to have_xpath("//label[@for= 'licenseAgreementStatus']", text: 'License Agreement')
expect(page).to have_css("#licenseAgreementStatus")
end

And (/^I see 'Licence Agreement' field will be set to Unspecified by default$/)do
  expect(page).to have_css("#licenseAgreementStatus > option:nth-child(3)", text: 'Unspecified', visible: true)
end

And (/^'Licence Agreement' field will be disabled or read-only$/)do
  field_labeled('License Agreement', :disabled => true)
end

And (/^the 'Licence Agreement' will be shown as Unspecified$/)do
  expect(page).to have_css("#licenseAgreementStatus > option:nth-child(3)", text: 'Unspecified')
end

And (/^'Licence Agreement' field will have three possible options$/)do |table|
default_options = table.hashes.map { |x| x['Unspecified'] }
puts default_options
  licenseagreement_status = find_all("#licenseAgreementStatus option")
  possible_options = licenseagreement_status.map{ |x| x.text}
  puts possible_options
end

And (/^I see 'Status' field default value set to 'Active'$/)do

end

Then (/^I will be redirected to Licence Agreement screen$/)do

end

And (/^I see licence text with an option to Accept or Reject$/)do

end

And (/^I will not have access to any other system resources$/)do

end

And (/^I will not see 'Licence Agreement' field on my profile page$/)do
  expect(page).to have_no_css("#licenseAgreementStatus")
end

When (/^I search for (.*?)in the search trainer field$/)do |trainerid|
  fill_in('txt-trainer-name', :with=>trainerid)
  sleep 2
  page.find('#txt-trainer-name').native.send_keys(:enter)
end

Then (/^the system will load trainer record in edit or update mode$/)do
expect(page).to have_css("#trainer-status-active", visible: true)

end

And (/^I see Licence Agreement field in enabled state$/)do
  expect(page).to have_css("#licenseAgreementStatus", visible: true)
  page.find("#licenseAgreementStatus").click
end


When (/^I set trainer Licence Agreement to (.*?) value$/)do |agreement_status|
  select(agreement_status, :from => 'licenseAgreementStatus')
end

And (/^I set Status field to Inactive value$/)do
  find("#trainer-status-inactive").click
end

And (/^I can see Status field value changes to Inactive$/)do
page.find("#trainer-status-inactive").value == true
end

And (/^I can see Licence Agreement field value changes$/)do
end

And(/^I will see a (.*?) with Yes or NO buttons $/)do|confirmation_message|

end

Then (/^I will remain on Update Trainers form$/)do

end


# When(/^I will see a (.*?)$/) do|action|
# page.find("#licenseAgreementStatus")
# end

When (/^I see 'Licence Agreement' field$/)do
page.find("#licenseAgreementStatus").visible?
end

And (/^I change 'Licence Agreement' to 'Unspecified'$/)do
  if page.find("#licenseAgreementStatus").text == 'Accepted'
    select('Unspecified', :from=> 'licenseAgreementStatus')
  end
end

When (/^I click on $/)do

end

Then (/^the system will load the trainer record in edit or update mode$/)do
expect(page).to have_css("h3", text: 'Update Trainer')
expect(page).to have_css("#btnCreateUpdateTrainer", text: 'Update Trainer')
end

And (/^'Licence Agreement' field will have 'Accept', 'Rejected', 'Unspecified' options$/)do
page.find("#licenseAgreementStatus").click
find_all("#licenseAgreementStatus option", visible: true)
find_all('#licenseAgreementStatus option'[1], text: 'Accepted', visible: true)
find_all('#licenseAgreementStatus option'[2], text: 'Rejected', visible: true)
find_all('#licenseAgreementStatus option'[3], text: 'Unspecified', visible: true)
end

Then(/^I see the Status field will be in enabled$/)do
expect(page).to have_css("#trainer-status-active", visible: true)
expect(page).to have_css("#trainer-status-inactive", visible: true)
end


And (/^I can see updated Licence Agreement as "([^"]*)"$/)do|agreement_status|
 puts page.find("#licenseAgreementStatus").value
  expect(page).to have_css("#licenseAgreementStatus", text: agreement_status, visible: true)
end

Then (/^the Status field will be set to Inactive and disabled on the UI$/)do
  page.find("#trainer-status-inactive").value == false
end

Then (/^I will see a confirmation message with text, "([^"]*)"$/)do|confirmation_message|
expect(page).to have_css(".modal-content", text: confirmation_message, visible: true)
end

Then (/^the message will close and no further action will be taken$/)do
expect(page).to have_no_css(".modal-content", visible: false)
end