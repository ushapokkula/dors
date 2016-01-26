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


