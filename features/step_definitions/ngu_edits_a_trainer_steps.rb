Then(/^I have trainer record loaded in editable view$/) do
  expect(page).to have_css("#btnCreateUpdateTrainer", text: 'Update Trainer')
end

Then(/^I see that "([^"]*)" and "([^"]*)" are not editable$/) do |field1, field2|
  id1 = find_id_by_label(field1)
  id2 = find_id_by_label(field2)
  expect(page).to have_css("##{id1}[disabled='disabled']")
  expect(page).to have_css("##{id2}[disabled='disabled']")
end

Then(/^The following fields are editable$/) do |table|
  fields = table.raw.flatten
  fields.each do |x|
    id = find_id_by_label(x)
    expect(page).to have_no_css("##{id}[disabled='disabled']")
  end
end

Given(/^Force Areas linked to Trainer record will be displayed$/) do
  expect(page).to have_css(".list-group-item.ng-binding", :count => 2)
end

When(/^I click the cross on one of the assigned force areas from the list$/) do
  @removed_force = all('.list-group-item.ng-binding')[0].text
  all('.close')[0].click
end

Then(/^The force will be removed from the list of assigned Force Areas$/) do
  expect(page).to have_css(".list-group-item.ng-binding", :count => 1)
  expect(page).to have_no_css(".list-group-item.ng-binding", text: @removed_force)
end

When(/^I leave the mandatory fields "([^"]*)" blank$/) do |field|
  fill_in(field, :with => '')
end

Then(/^I see the error message "([^"]*)" against the field$/) do |error_message|
  expect(page).to have_css(".form-group.has-error p", text: error_message)
end

When(/^I edit "([^"]*)"$/) do |field|
  @trainers.create_trainer_record_page.primary_phone.set Faker::PhoneNumber.numerify('0##########')
  @updated_primary_phone_number = find("#trainerPrimaryPhone").value
end

Then(/^I see message "([^"]*)" after updating the trainer$/) do |message|
  expect(page).to have_css(".toast-message", text: message)
end

And(/^I see the updated phone number in database$/) do
  @trainers.create_trainer_record_page.verify_updated_phone_no_in_db
  @updated_primary_phone_number == @updated_record_in_db
end

Then(/^I will see the error messages for missing mandatory fields as per the below table$/) do |table|
  # table is a table.hashes.keys # => [:First Name, :Please provide a first name.]
  y = convert_table_hash(table)
  y.each do |k, v|
    fill_in(k, :with => '')
    click_link_or_button("Update Trainer")
    expect(page).to have_css(".form-group.has-error p", text: v)
  end
end

And(/^I will be shown "([^"]*)" force areas linked to trainer "([^"]*)"$/) do |force_count, first_name|
  expect(find("#trainerFirstName").value).to eq(first_name)
  expect(page).to have_css(".list-group-item.ng-binding", :count => force_count)
end

When(/^I remove the first force area from the list$/) do
  @removed_force = all('.list-group-item.ng-binding')[0].text
  all('.close')[0].click
end

Then(/^I see the force area is removed$/) do
  expect(page).to have_no_css(".list-group-item.ng-binding", text: @removed_force)
end