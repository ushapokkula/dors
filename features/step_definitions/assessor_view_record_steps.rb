And(/^I will be shown my record with below read only "([^"]*)" fields$/) do |field_name|
  expect(page).to have_css("h1", text: "My profile")
  if (field_name == "Force Areas")
    page.should have_no_css("#selected-force-areas .close") #/*need to implement case statement*/
  else
    field_labeled(field_name, :disabled => true)
  end
end

And(/^I will be shown my record with below editable "([^"]*)" fields$/)do |field_name|
  if(field_name == "Force Areas")
    page.should have_no_css("#selected-force-areas .close")
    else
   field_labeled(field_name, :disabled=> false)
  end
  end

Then (/^I see Assessor "([^"]*)" field is an optional field$/)do |optional_fields|
   if(optional_fields == "Assessor Number")
      field_labeled(optional_fields, :disabled=> true)
   end

  if(optional_fields == "Secondary Phone Number")
     field_labeled(optional_fields, :disabled=> false)
    click_button('Update')
    expect(page.should_not have_css(".help-block p"))
  end

  if(optional_fields == "Force Areas")
     page.should have_no_css("#selected-force-areas .close")
    page.should have_css("#selected-force-areas li")
  #else
   # page.should have_content("No force areas have been assigned.")
   end
end