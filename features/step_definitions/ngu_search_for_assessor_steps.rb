And(/^I see the search field on the page to search an assessor$/) do
  expect(page).to have_css("#txt-assessor-name")
  expect(page).to have_css(".form-group>div>em")
end

And(/^I start typing atleast three characters as an "([^"]*)" in the search field$/) do |chars|
  fill_in('txt-assessor-name', :with => chars)
end

And(/^The system will start autopredicting it and the list appears$/) do
  if (page.should have_no_css(".text-danger"))
    expect(page.all("#txt-assessor-name + ul li").count).to be > 0
  end
end

Then(/^The auto predicted dropdown list will display the names in this format "([^"]*)"$/) do |format|
  expect(page).to have_css("#txt-assessor-name + ul", text: format)
end

Then(/^The search criteria does'nt match any record on the database$/) do
  fill_in('txt-assessor-name', :with => "QAZ")
end

Then(/^I see the message "([^"]*)"$/) do |message|
  expect(page).to have_css(".text-danger", text: message)
end

When(/^I hit enter after typing first three characters as "([^"]*)"$/) do |chars|
  fill_in('txt-assessor-name', :with => chars)
  find('#txt-assessor-name').send_keys(:enter)

end

Then(/^The first name will be selected from the drop down list by default "([^"]*)"$/) do |username|
  find("#assessorUsername").text == username
end

When(/^I hit DOWN arrow key from the list$/) do
  find("#txt-assessor-name").native.send_keys(:arrow_down)
  find('#txt-assessor-name').send_keys(:enter)
end

Then(/^The second value will be selected from the drop down list "([^"]*)"$/) do |down_selected_value|
  find("#assessorUsername").value == down_selected_value
end

When(/^I hit UP arrow key from the list$/) do
  fill_in('txt-assessor-name', :with => "sud")
  find("#txt-assessor-name").native.send_keys(:arrow_down)
  find("#txt-assessor-name").native.send_keys(:arrow_up)
  find('#txt-assessor-name').send_keys(:enter)
end

Then(/^The first name will be selected from the drop down list "([^"]*)"$/) do |up_selected_value|
  find("#assessorUsername").value == up_selected_value
end