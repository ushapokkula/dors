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

When (/^I search for (.*?)in the trainer search field$/)do |trainerid|
  fill_in('txt-trainer-name', :with=>trainerid)
  sleep 2
  page.find('#txt-trainer-name').native.send_keys(:enter)
end

Then (/^the system will load trainer record in edit or update mode$/)do
expect(page).to have_css("#trainer-status-active", visible: true)

end

And (/^I see 'Licence Agreement' field in enabled state$/)do
  expect(page).to have_css("#licenseAgreementStatus", visible: true)
  page.find("#licenseAgreementStatus").click
end


When (/^I set trainer 'Licence Agreement' to (.*?) value$/)do |option|
  page.find("#licenseAgreementStatus").click
  select(option, :from => 'licenseAgreementStatus')
end

When(/^I will see a (.*?)$/) do|action|
page.find("#licenseAgreementStatus")
end

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