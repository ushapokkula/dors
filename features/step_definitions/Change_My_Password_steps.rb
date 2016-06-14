Then (/^the system will show user 'Profile details' in expand section$/)do
  expect(page.should have_css(".panel-open", visible:true))
  expect(page.should have_button("Update", visible: true))
  expect(page.should have_button("Cancel", visible: true))
end

And (/^the 'Change password' section will be collapsed by default$/)do

end

When (/^I request to expand the 'Change password' section$/)do

end

Then (/^'Change password' section will be expanded$/)do

end

And (/^'Profile details' section will be collapsed$/)do

end