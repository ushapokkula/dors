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


Then (/^I fill all Profile fields to meet their validation rules$/)do
  @trainers.assessor_profile_page.filling_all_fields_with_allowed_validation
  @trainers.assessor_profile_page.update_assessor_profile
end

And(/^the system will refresh My Profile page to show updated record$/)do
  @trainers.assessor_profile_page.postcode.value == @post_code
end

And (/^a message "([^"]*)" will be displayed.$/)do |message|
  page.find(".toast-message").should be_visible
  expect(page).to have_selector(:css, ".toast-message", text: message)
end


Then(/^I enter firstname value "([^"]*)"$/) do |firstName|


  @trainers.create_assessor_record_page.fillinAssessorfirstName(firstName)

end

Then(/^I enter lastname value "([^"]*)"$/) do |lastName|

  @trainers.create_assessor_record_page.fillinAssessorlastName(lastName)

end

Then(/^I enter primary phone number "([^"]*)"$/) do |primaryPhoneNumber|

  @trainers.create_assessor_record_page.fillinAssessorprimaryPhoneNumber(primaryPhoneNumber)

end

Then(/^I enter secondary phone number "([^"]*)"$/) do |secondaryPhoneNumber|
  @trainers.create_assessor_record_page.fillinAssessorsecondaryPhoneNumber(secondaryPhoneNumber)

end

Then(/^I enter email "([^"]*)"$/) do |email|
  @trainers.create_assessor_record_page.fillinAssessoremail(email)


end

Then(/^I enter address "([^"]*)"$/) do |address|

  @trainers.create_assessor_record_page.fillinAssessoraddress(address)

end

Then(/^I enter town "([^"]*)"$/) do |town|
  @trainers.create_assessor_record_page.fillinAssessortown(town)

end

Then(/^I enter postcode "([^"]*)"$/) do |postcode|
  @trainers.create_assessor_record_page.fillinpostcode(postcode)

end
