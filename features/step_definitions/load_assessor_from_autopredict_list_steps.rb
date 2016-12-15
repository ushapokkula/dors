When(/^I click on the assessor item from the list which i want to edit$/)do
  find("#txt-assessor-name + ul li", match: :first).click
 end

Then(/^The system will load the assessor record with "([^"]*)"$/)do |username|
  find("#assessorUsername").value == username
end

And(/^The username will not be editable$/)do
   field_labeled('Username', :disabled=> true)
end

Then(/^The following fields with full details are displayed in the editable mode$/) do |table|
  new_table = table.hashes()
  columns = new_table.map { |x| x['Assessor Input Fields'] }
  for  i in 1...columns.size
    field_labeled(columns[i], :disabled=> false)
  end
end

Then(/^The following fields are displayed in this below mentioned order$/) do |table|
  new_table = table.hashes()
@trainers.create_assessor_record_page.verify_order_of_assessor_input_fields(new_table)
end