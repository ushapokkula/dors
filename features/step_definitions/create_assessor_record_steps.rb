Then(/^the system will load the page where I can create a new assessor record with the following fields$/) do |table|
  new_table = table.hashes
  @trainers.create_assessor_record_page.verify_assessor_record_details(new_table)
end

Given(/^I see that the page includes "([^"]*)" and "([^"]*)" buttons$/) do |cancel_button, create_button|
   find_button(cancel_button).visible?
   find_button(create_button).visible?
end

Then(/^I see the following fields as Mandatory$/)do |table|
  click_link_or_button("Create Assessor")
  new_table = table.hashes
  @trainers.create_assessor_record_page.verify_assessor_mandatory_fields(new_table)
end

Then(/^I see the following fields as "([^"]*)" with "([^"]*)"$/) do |fields, error_msgs|
  @trainers.create_assessor_record_page.verify_mandatory_field_err_msgs(fields, error_msgs)

end

Then(/^I see the following fields as "([^"]*)"$/) do |optional_field|
  @trainers.create_assessor_record_page.verify_optional_fields(optional_field)

end

Then(/^the system will load the page where I can create a new assessor record$/) do

  @trainers.create_assessor_record_page.isAssessorCreatePage()

end

When(/^I click Cancel button$/) do
 @trainers.create_assessor_record_page.clickOnCancelButton()

end

Then(/^then unsaved changes will be lost and I will be redirected to my homepage \(Assessments Management\)$/) do

  @trainers.create_assessor_record_page.isYourHomePage()

end

Then(/^I click on create assessor button$/) do

  @trainers.create_assessor_record_page.createAssessor()

end


Then(/^I enter field1 "([^"]*)"$/) do |username|

  @trainers.create_assessor_record_page.fillinUserName(username)

end

Then(/^I enter field2 "([^"]*)"$/) do |assessorNumber|

  @trainers.create_assessor_record_page.fillinassessorNumber(assessorNumber)


end

Then(/^I enter field3 "([^"]*)"$/) do |firstName|


  @trainers.create_assessor_record_page.fillinfirstName(firstName)

end

Then(/^I enter field4 "([^"]*)"$/) do |lastName|

  @trainers.create_assessor_record_page.fillinlastName(lastName)

end

Then(/^I enter field5 "([^"]*)"$/) do |primaryPhoneNumber|

  @trainers.create_assessor_record_page.fillinprimaryPhoneNumber(primaryPhoneNumber)

end

Then(/^I enter field6 "([^"]*)"$/) do |secondaryPhoneNumber|
  @trainers.create_assessor_record_page.fillinsecondaryPhoneNumber(secondaryPhoneNumber)

end

Then(/^I enter field7 "([^"]*)"$/) do |email|
  @trainers.create_assessor_record_page.fillinemail(email)


end

Then(/^I enter field8 "([^"]*)"$/) do |address|

  @trainers.create_assessor_record_page.fillinaddress(address)

end

Then(/^I enter field9 "([^"]*)"$/) do |town|
  @trainers.create_assessor_record_page.fillintown(town)

end

Then(/^I enter field10 "([^"]*)"$/) do |postcode|
  @trainers.create_assessor_record_page.fillinpostcode(postcode)

end

Then(/^I enter field11 "([^"]*)"$/) do |forceareas|
  @trainers.create_assessor_record_page.selectForceAreas(forceareas)
end

Then(/^I see validation messages for "([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |username,assessorNumber,firstName,lastName,primaryPhoneNumber,secondaryPhoneNumber,email,address,town,postcode,forceareas|

  @trainers.create_assessor_record_page.validateUsername(username)
  @trainers.create_assessor_record_page.validateAssessorNumber(assessorNumber)
  @trainers.create_assessor_record_page.validatefirstName(firstName)
  @trainers.create_assessor_record_page.validateLastName(lastName)
  @trainers.create_assessor_record_page.validatePrimaryPhoneNumber(primaryPhoneNumber)
  @trainers.create_assessor_record_page.validatesecondaryPhoneNumber(secondaryPhoneNumber)
  @trainers.create_assessor_record_page.validateEmail(email)
  @trainers.create_assessor_record_page.validateAddress(address)
  @trainers.create_assessor_record_page.validateTown(town)
  @trainers.create_assessor_record_page.validatePostcode(postcode)
end