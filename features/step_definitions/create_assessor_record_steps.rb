Then(/^the system will load the page where I can create a new assessor record with the following fields$/) do |table|
  new_table = table.hashes
  @trainers.create_assessor_record_page.verify_assessor_record_details(new_table)
end

Given(/^I see that the page includes "([^"]*)" and "([^"]*)" buttons$/) do |cancel_button, create_button|
   find_button(cancel_button).visible?
   find_button(create_button).visible?
end

