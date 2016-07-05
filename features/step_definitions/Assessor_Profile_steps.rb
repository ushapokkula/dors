Then (/^I will be shown these fields of my record$/) do |table|
  new_table = table.hashes
  @trainers.assessor_profile_page.profile_details(new_table)
end

Then (/^the system will load the page where I can update assessor record$/) do
  expect(page).to have_css("h1", "My profile")
  page.should have_css("#lnk-toggle-profile-details-form", text: 'Profile details')
end

When (/^I click Cancel button on profile page$/) do
  fill_in('assessorPhone', :with => '079999945566')
  click_button('Cancel')
end

And(/^I will be redirected to "MY ASSESSMENTS" page$/) do
  expect(page).to have_css("h1", text: "My assessments")
end

Then (/^unsaved changes will be lost$/) do
  click_link_or_button('MY PROFILE')
  find_field('assessorPhone').value.should_not eql?("079999945566") #Verify edited first name value is there or not#
end

Then(/^I enter firstname field value as "([^"]*)"$/) do |firstName|
  @trainers.create_assessor_record_page.fillinAssessorfirstName(firstName)
end

Then(/^I enter lastname field value as "([^"]*)"$/) do |lastName|
  @trainers.create_assessor_record_page.fillinAssessorlastName(lastName)
end

Then(/^I enter primary phone number field value as "([^"]*)"$/) do |primaryPhoneNumber|
  @trainers.create_assessor_record_page.fillinAssessorprimaryPhoneNumber(primaryPhoneNumber)
end

Then(/^I enter secondary phone number field value as "([^"]*)"$/) do |secondaryPhoneNumber|
  @trainers.create_assessor_record_page.fillinAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
end

Then(/^I enter primary email address field value as "([^"]*)"$/) do |primaryEmail|
  @trainers.create_assessor_record_page.fillinAssessorprimaryEmail(primaryEmail)
end

Then(/^I enter secondary email address field value as "([^"]*)"$/) do |secondaryEmail|
  @trainers.create_assessor_record_page.fillinAssessorsecondaryEmail(secondaryEmail)
end

Then(/^I enter address field value as "([^"]*)"$/) do |address|
  @trainers.create_assessor_record_page.fillinAssessoraddress(address)
end

Then(/^I enter town field value as "([^"]*)"$/) do |town|
  @trainers.create_assessor_record_page.fillinAssessortown(town)
end

Then(/^I enter postcode field value as "([^"]*)"$/) do |postcode|
  @trainers.create_assessor_record_page.fillinAssessorpostcode(postcode)
end

And(/^"([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)" fields not meet below validation requirements$/) do |primaryPhoneNumber, secondaryPhoneNumber, primaryEmail, secondaryEmail, address, town, postcode|
  # @trainers.assessor_profile_page.validateAssessorfirstName(firstName)
  # @trainers.assessor_profile_page.validateAssessorLastName(lastName)
  @trainers.assessor_profile_page.validateAssessorPrimaryPhoneNumber(primaryPhoneNumber)
  @trainers.assessor_profile_page.validateAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
  @trainers.assessor_profile_page.validateAssessorPrimaryEmail(primaryEmail)
  @trainers.assessor_profile_page.validateAssessorSecondaryEmail(secondaryEmail)
  @trainers.assessor_profile_page.validatePrimaryEmailMaxCHARS
  @trainers.assessor_profile_page.validateAssessorAddress(address)
  @trainers.assessor_profile_page.validateAddressMaxCHARS
  @trainers.assessor_profile_page.validateTownfield(town)
  @trainers.assessor_profile_page.validateTownMaxCHARS
  @trainers.assessor_profile_page.validateAssessorPostcode(postcode)
  @trainers.assessor_profile_page.validatePostcodeMaxCHARS
  @trainers.assessor_profile_page.verifyPostcodeAutoCapital(postcode)
end

Then (/^the system will highlight those fields$/) do
  @trainers.assessor_profile_page.verify_highlighted_fields
end

And(/^show "([^"]*)" against those fields$/) do |validations_requirements|
  validations_requirements = @trainers.assessor_profile_page.validation_requirement_messages.map { |x| x.text }
  puts validations_requirements
end

When (/^I request to updated my profile data$/) do
  @trainers.assessor_profile_page.update_assessor_profile
end

And (/^record will not be updated$/) do
  expect(page.should_not have_css(".toast-message", text: 'Your profile has been successfully updated.'))
end

And (/^I will remain on the same page$/) do
  @trainers.assessor_profile_page.verify_user_is_on_assessor_profile_page
end


When(/^I set (.*) to value (.*)$/) do |field, value|
  el = find('label', text: /\A#{field}\z/, visible: true)
  # value = '' if value == 'empty'
  find("##{el[:for]}").set(value)
end

Then(/^I get the error message as (.*)$/) do |error_message|
  expect(page).to have_content(error_message)
end


def random_string(x)
  #string = ([*('A'..'Z'),*('0'..'9'),]+ %w(- _ )).sample(x).join
  chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
  string = (0..x).map { chars.sample }.join
end

And(/^the user enters the "([^"]*)" with "([^"]*)" characters$/) do |field, length|
  el = find('label', text: /\A#{field}\z/, visible: true)
  find("##{el[:for]}").set random_string(length)
end

And(/^changes have been successfully saved$/) do
  expect(find("#assessorEmail").value).to eq("Roopa.Ramisetty@wtg.co.uk")
end

Then(/^I will receive the email notification with "([^"]*)" and "([^"]*)"$/) do |subject, body|
  @trainers.create_assessor_record_page.email_generation(subject, body)
end

When(/^I change the assessors primary address from 'old email address' to "([^"]*)"$/) do |updated_email|
    fill_in('assessorEmail', :with => updated_email)
  end

Given(/^I am on accessors details page$/) do
  expect(page).to have_css("h1", text: 'My profile')
end

And(/^I see that email is sent To the (.*) address with (.*)$/) do |name, email_address|
  find(:xpath,".//*[text()='#{name};']").right_click
  find(:xpath,".//span[text()='details']").click
  actual_email = find(:xpath,".//a/span[text()='#{email_address}']").text
  expect(actual_email).to eq(email_address)
  find(:xpath,".//*[text()='#{name};']").click
end

And(/^I see that email is Cced to the (.*) address with (.*)$/) do |name, email_address|
  find(:xpath,".//*[text()='#{name};']").right_click
  find(:xpath,".//span[text()='details']").click
  actual_email = find(:xpath,".//a/span[text()='#{email_address}']").text
  expect(actual_email).to eq(email_address)
  find(:xpath,".//*[text()='#{name};']").click
end

And(/^I see the primary email address as "([^"]*)"$/)do |old_email_addr|
  fill_in('assessorEmail', :with => old_email_addr) unless (find("#assessorEmail").value)== old_email_addr
  expect(find("#assessorEmail").value).to eq(old_email_addr)
end