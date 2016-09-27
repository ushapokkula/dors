Then(/^I see Trainer status set as 'Active' by default$/) do
  expect(page).to have_css("#trainer-status", text:'Status')
  page.should have_selector "input[type='radio'][disabled='disabled'][value='true']"
  find_all('label.radio-inline')[0].text == 'Active'
end

Then(/^the Status fields will be shown enabled now$/) do
  field_labeled('Active', :disabled => false)
  field_labeled('Inactive', :disabled => false)
end

Then (/^I will not see 'Status' field on my profile page$/)do
  expect(page).to have_css("h1",text:"My Profile")
  expect(page).to have_no_css("#trainer-status",text:'Status',visible: false)
end

Then(/^the system will load the trainer form where I can edit or update$/) do
  page.find("#trainer-status-active").click
  page.all("h3", text: 'Update Trainer')
  page.find("#btnCreateUpdateTrainer").click

end

When(/^I set the status to "([^"]*)"$/) do |arg1|
  page.find("#trainer-status-inactive").click
end

Then(/^the message will close and trainer record will be set to inactive$/) do

end

Then(/^I see Trainer status set as 'Inactive'$/) do
  field_labeled('Inactive', :disabled => false)
end

When (/^I click Reject button$/)do
  page.find("#cancel-assessment-yes").click

end

When(/^I click on Cancel button$/)do
  page.find("#cancel-assessment-no").click
end

