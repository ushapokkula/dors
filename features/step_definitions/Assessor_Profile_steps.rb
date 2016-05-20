Then (/^I will be shown these fields of my record$/) do |table|
  new_table = table.hashes
  @trainers.assessor_profile_page.profile_details(new_table)
end

Then (/^the system will load the page where I can update assessor record$/)do
  @trainers.assessor_profile_page.verify_user_is_on_assessor_profile_page
  fill_in('assessorFirstName', :with=> 'test')
end

When (/^I click Cancel button on profile page$/)do
  fill_in('assessorFirstName', :with=> 'test')
  click_button('Cancel')
end

And(/^I will be redirected to "MY ASSESSMENTS" page$/)do
  expect(page).to have_css("h1", text: "My assessments")
end

Then (/^unsaved changes will be lost$/)do
click_link_or_button('MY PROFILE')
  find_field('assessorFirstName').value.should_not eql?("test")   #Verify edited first name value is there or not#
end

Then(/^I enter firstname value "([^"]*)"$/) do |firstName|
  @trainers.assessor_profile_page.fillinAssessorfirstName(firstName)
end

Then(/^I enter lastname value "([^"]*)"$/) do |lastName|
  @trainers.assessor_profile_page.fillinAssessorlastName(lastName)
end

Then(/^I enter primary phone number "([^"]*)"$/) do |primaryPhoneNumber|
  @trainers.assessor_profile_page.fillinAssessorprimaryPhoneNumber(primaryPhoneNumber)
end

Then(/^I enter secondary phone number "([^"]*)"$/) do |secondaryPhoneNumber|
  @trainers.assessor_profile_page.fillinAssessorsecondaryPhoneNumber(secondaryPhoneNumber)

end

Then(/^I enter email "([^"]*)"$/) do |email|
  @trainers.assessor_profile_page.fillinAssessoremail(email)
end

Then(/^I enter address "([^"]*)"$/) do |address|
  @trainers.assessor_profile_page.fillinAssessoraddress(address)
end

Then(/^I enter town "([^"]*)"$/) do |town|
  @trainers.assessor_profile_page.fillinAssessortown(town)
end

Then(/^I enter postcode "([^"]*)"$/) do |postcode|
  @trainers.assessor_profile_page.fillinAssessorpostcode(postcode)
end

When (/^I request to updated my profile data$/)do
  @trainers.assessor_profile_page.update_assessor_profile
end

And(/^"([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)" fields not meet the below validation requirements $/)do |firstName,lastName,primaryPhoneNumber,secondaryPhoneNumber,email,address,town,postcode|
  @trainers.assessor_profile_page.validateAssessorfirstName(firstName)
  @trainers.assessor_profile_page.validateAssessorLastName(lastName)
  @trainers.assessor_profile_page.validateAssessorPrimaryPhoneNumber(primaryPhoneNumber)
  @trainers.assessor_profile_page.validateAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
  @trainers.assessor_profile_page.validateAssessorEmail(email)
  @trainers.assessor_profile_page.validateAssessorAddress(address)
  @trainers.assessor_profile_page.validateAssessorTown(town)
  @trainers.assessor_profile_page.validateAssessorPostcode(postcode)

end

Then(/^the system will highlight those fields$/)do

end

And(/^show validation requirements against those fields$/)do


end

And (/^record will not be updated$/)do

end

And (/^I will remain on the same page$/)do

end