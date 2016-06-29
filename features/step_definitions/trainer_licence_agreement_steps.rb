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
  expect(page).not_to have_css("//label[@for= 'licenseAgreementStatus']", text: 'License Agreement')

end
