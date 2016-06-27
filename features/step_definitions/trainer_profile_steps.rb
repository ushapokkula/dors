Then (/^I will be shown below fields of trainer record$/)do |table|
  new_table = table.hashes
  columns = new_table.map { |x| x['Update Trainer Fields'] }
  for i in 1..columns.size
    expect(page).to have_content(columns[i])
  end
end

Then (/^the system will load the page where I can update trainer record$/)do
  expect(page).to have_css("h1", text:'My Profile')
  page.should have_css("#lnk-toggle-profile-details-form", text:'Profile details')
  page.should have_css(:button, text: 'Update')
  page.should have_css(:button, text: 'Cancel')
  puts "I am On Trainer Profile Page"
end


And (/^I change Primary Phone Number details$/)do
fill_in('trainerPrimaryPhone', :with=>'07713258468')
end

When (/^I click Cancel button on trainer profile page$/)do
  click_button('Cancel')
end

And (/^I will be redirected to "My Licences" page$/)do
  expect(page).to have_css("h1", text: "My Licenses")
end

Then (/^unsaved changes on trainer profile will be lost$/)do
  find_field('trainerPrimaryPhone').value.should_not eql?("07713258468")   #Verify edited primary phone numbver value is there or not#
end

When (/^I fill fields with empty "([^"]*)"$/)do |value|
  fill_in('trainerPrimaryPhone', :with=>value)
  fill_in('trainerEmail', :with=> value)
  fill_in('trainerAddress', :with=> value)
  fill_in('trainerPostcode', :with=> value)
  fill_in('trainerTown', :with=> value)
end

Then (/^I see the following fields as "([^"]*)" with "([^"]*)" on trainer profile page$/)do|fields, error_msgs|
  expect(page).to have_selector(".has-error", text:error_msgs)

end
