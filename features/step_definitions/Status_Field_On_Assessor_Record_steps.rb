Then (/^status set as 'Active' by default$/)do
  expect(page).to have_content("Status")
  find_all(('label.radio-inline')[0], text: 'Active')
find(:xpath, "//input[@value='true']").should be_visible
  find_all(('label.radio-inline')[1], text:'Inactive')
end

And (/^status field will be disabled$/)do
#find_all("//input[@disabled='disabled']",  visible:true )
#field_labeled(""", disabled:true)
  page.should have_xpath("//input[@disabled='disabled']")
end

Then (/^I can not set status as 'Inactive'$/)do
  find_all(('label.radio-inline')[1], text:'Inactive')
  find(:xpath, "//input[@value='false']").text == 'Inactive'

end

And (/^I loads an existing Assessor "([^"]*)" record$/)do |user|
  page.find("#txt-assessor-name").click
  fill_in('txt-assessor-name', :with=> user)
  find("#txt-assessor-name").send_keys(:enter)
  expect(page).to have_content("Update Assessor")
  expect(page).to have_content("Status")
end

Then (/^status field will be editable$/)do
  page.should have_xpath("//input[@disabled='disabled']")
end

Then (/^I set status as 'Inactive'$/)do
  find_all('label.radio-inline')[1].click
end

And (/^I update Assessor record$/)do
page.find("#btnCreateUpdateAssessor").click
expect(page).to have_css(".toast-message", text: 'Assessor record successfully updated.')
  sleep 5
end

Then (/^will get the standard invalid credentials login failure message$/)do
  page.should have_css('.alert.alert-danger', visible: true)
end

And (/^message will appear as: "([^"]*)"$/)do|errormessage|
  expect(page).to have_css(".alert.alert-danger", text: errormessage)
end