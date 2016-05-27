Then(/^The email will be generated with subject "([^"]*)"$/) do |subject|
  @trainers.create_assessor_record_page.email_generation(subject)
end

And(/^I fill all assessor fields on the create assessor form$/) do
  @trainers.create_assessor_record_page.fill_create_assessor_fields
end

And(/^I see that the email is generated and sent to the registered email address  with "([^"]*)" and "([^"]*)"$/) do |subject, body|
   @trainers.create_assessor_record_page.email_generation(subject, body)
end

Then(/^I see the message "([^"]*)" after assessor creation$/) do |text|
  expect(page).to have_css(".toast-message", text: text)
end

And(/^The link will include a crypt nonce making it difficult to guess$/) do
  @trainers.create_assessor_record_page.validate_nonce
end

And(/^The link will be  valid for 48 hours from the point of email send timestamp$/) do
  @trainers.create_assessor_record_page.verify_48_hours_validity
end