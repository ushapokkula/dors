Then(/^I see the search field is visible on the page to search a trainer$/) do
  expect(page).to have_css("#txt-trainer-name")
end

Then(/^The input field will include a placeholder info text$/) do
  expect(page).to have_css(".form-group>div>em", text: '3 characters or 6 digits required')
end

When(/^I start typing six digits as "([^"]*)" in the trainer search field$/) do |chars|
  fill_in('txt-trainer-name', :with => chars)
end

Then(/^The system will start autopredicting it and the list of trainer appears$/) do
  expect(page).to have_css("#txt-trainer-name + ul li")
  #WaitUtil.wait_for_condition("waiting for Trainer details", :timeout_sec => 10, :delay_sec => 0.5) do
    if (page.should have_no_css(".text-danger"))
    expect(page.all("#txt-trainer-name + ul li").count).to be > 0
  end
  end
 # end

And(/^I start typing atleast three characters as "([^"]*)" in the trainer search field$/) do |chars|
  fill_in('txt-trainer-name', :with => chars)

end

When(/^I hit enter after typing first three characters of trainer name as "([^"]*)"$/) do |chars|
  expect(page).to have_css("#txt-trainer-name + ul")
  find('#txt-trainer-name').send_keys(:enter)
  sleep 3
end

Then(/^The first trainer name will be selected from the drop down list by default "([^"]*)"$/) do |trainer_name|
  expect(find("#trainerFirstName").value).to be == trainer_name
end

And(/^The search criteria does'nt match any trainer record on the database$/) do
  fill_in('txt-trainer-name', :with => "IOP")
end

And(/^The auto predicted dropdown list will display the names in the format "([^"]*)"$/) do |format|
  expect(page).to have_css("#txt-trainer-name + ul", text: format)
end

When(/^I hit DOWN arrow key from the trainer auto predict list$/) do
  find("#txt-trainer-name").native.send_keys(:arrow_down)
  find("#txt-trainer-name").send_keys(:enter)
end

Then(/^The second value will be selected from the auto predict list "([^"]*)"$/) do |selected_trainer|
  expect(find("#trainerFirstName").value).to eq(selected_trainer)
end

When(/^I hit UP arrow key from the trainer auto predict list$/) do
  find("#txt-trainer-name").native.send_keys(:arrow_down)
  find("#txt-trainer-name").native.send_keys(:arrow_up)
  find("#txt-trainer-name").send_keys(:enter)
end

Then(/^The first name will be selected from the auto predict list "([^"]*)"$/) do |selected_trainer|
  expect(find("#trainerFirstName").value).to eq(selected_trainer)
end

