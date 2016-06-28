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
  expected_options = table.hashes.map { |x| x['Unspecified'] }
  licenseagreement_status = find_all("#licenseAgreementStatus option")
  actual_options = licenseagreement_status.map{ |x| x.text}
  puts actual_options
  expect(actual_options).to match_array(expected_options)
end
