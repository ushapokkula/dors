And(/^I will be shown my record with below read only "([^"]*)" fields$/) do |field_name|
  expect(page).to have_css("h1", text: "My profile")
  if (field_name == "Force Areas")
    page.should have_no_css("#selected-force-areas .close") #/*need to implement case statement*/
  else
    field_labeled(field_name, :disabled => true)
  end
end

And(/^I will be shown my record with below editable "([^"]*)" fields$/) do |field_name|
  expect(page).to have_css("h1", text: "My profile")
  field_labeled(field_name, :disabled => false)
end


