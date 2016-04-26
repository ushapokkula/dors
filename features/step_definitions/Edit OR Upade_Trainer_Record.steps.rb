When(/^I start searching for existing 'Trainer Name' in the trainer search field$/)do
  fill_in('txt-trainer-name', :with => 'roopa trainer')
  find("#txt-trainer-name").send_keys(:enter)
end


Then(/^I should see existing trainer details on trainer management page$/)do
  expect(page).to have_selector(:css,"h3.panel-title",match: :first,text:'Update Trainer')
  expect(page).to have_selector(:css,"h3.panel-title",match: :'one',text:'Licences')
  expect(page).to have_selector(:css,"#licenseStatuses_2 > option:nth-child(2)", text:'Full') #verifying 'Full' licence state#
  expect(page).to have_selector(:css,"#licenseStatuses_3 > option:nth-child(1)",text:'Provisional/Conditional') #verifying 'Provisional' licence state#
end


Then(/^I see "Trainers management" page$/)do
  expect(page).to have_content("Trainers management")
  expect(page).to have_content("Licences")
  @trainers.create_trainer_record_page.verify_default_trainer_licence_details
end

Then(/^I see the following default Licence status in Licence status dropdown$/) do |table|
  new_table = (table.hashes)
  @trainers.EditORUpdate_trainer_record_page.verify_default_licence_fields(new_table)
end

And(/^I change "([^"]*)" in past for trainer which has Licence state of 'Full' or 'Provisional'$/)do |date|
  if(page.should have_css("#licenseStatuses_2 > option:nth-child(2)", text:'Full'))
    page.find("#licenseExpiryDate_2").set(date)
    page.find("#licenseExpiryDate_2").send_keys(:enter)
  end

  if(page.should have_css("#licenseStatuses_3 > option:nth-child(1)",text:'Provisional/Conditional'))
    page.find("#licenseExpiryDate_3").set(date)
    page.find("#licenseExpiryDate_3").send_keys(:enter)
  end
end


Then(/^the system will trigger the user with an error message "([^"]*)" on trainer page$/)do |message|
  expect(page).to have_selector(:css,".help-block p", text: message)
end


#DR-39#
When (/^I select the "([^"]*)" as 'Expired' or 'Suspended'$/)do |status|
  if(page.should have_css("#licenseStatuses_2 > option:nth-child(2)", text:'Full'))
    page.find("#licenseStatuses_2").click
    select(status, :from => 'licenseStatuses_2')
  end
end


Then(/^the system will default the Expiry Date to today's date$/)do
  t = Time.now()
  expiry_date = '(t.strftime("%d/%m/%Y")'
  find("#licenseExpiryDate_2").value== expiry_date
  puts expiry_date
end

And(/^I can change today's date to any other "([^"]*)" not in past$/) do |date|
  if(page.should have_css("#licenseStatuses_2 > option:nth-child(2)", text:'Full'))
    find("#licenseExpiryDate_2").click
    find("#licenseExpiryDate_2").set(date)
    find("#licenseExpiryDate_2").send_keys(:enter)
  end
end

When(/^I select the status as to 'Full' from any other value$/) do
  if(page.should have_css("#licenseStatuses_3 > option:nth-child(1)", text:'Provisional/Conditional'))
    page.find("#licenseStatuses_3").click
    select('Full',:from=>'licenseStatuses_3')
  end
end

Then(/^the system will default the Expiry Date to 730 days from current date$/)do
  expiry_date = '(Date.today) + 730).to_s'
  page.find("#licenseExpiryDate_3").value == expiry_date   #Verify adding 730 days to todays date#
end


And (/^I can change Expiry Date value to any other "([^"]*)" not in past$/)do |date|
  if(page.should have_css("#licenseStatuses_3 > option:nth-child(1)", text:'Provisional/Conditional'))
    find("#licenseExpiryDate_3").click
    find("#licenseExpiryDate_3").set(date)
    find("#licenseExpiryDate_3").send_keys(:enter)
  end
end


When (/^I select the "([^"]*)" as 'Provisional or Conditional'$/)do |status|
  if(page.should have_css("#licenseStatuses_2 > option:nth-child(2)", text:'Full'))
    page.find("#licenseStatuses_2").click
    select(status, :from => 'licenseStatuses_2')
  end
end

Then (/^the system will default the Expiry Date to 183 days from current date$/)do
  expiry_date = '(Date.today) + 183).to_s'
  page.find("#licenseExpiryDate_2").value == expiry_date
end

And (/^I can change Expiry Date to any other "([^"]*)" as well not in past$/)do |date|
  if(page.should have_css("#licenseStatuses_2 > option:nth-child(2)", text:'Full'))
    find("#licenseExpiryDate_2").click
    find("#licenseExpiryDate_2").set(date)
    find("#licenseExpiryDate_2").send_keys(:enter)
  end
end

When (/^I manually set the "([^"]*)" to more than 730 days from system or current date$/)do |date|
  if(page.should have_css("#licenseStatuses_2 > option:nth-child(2)", text:'Full'))
    find("#licenseExpiryDate_2").click
    find("#licenseExpiryDate_2").set(date)
    find("#licenseExpiryDate_2").send_keys(:enter)
    expiry_date = '((Date.today)+ 730).to_s'
    expect(page).should have_css("#licenseExpiryDate_2",).value > expiry_date
  end
end

Then(/^the system will show a soft warning message, "([^"]*)"$/)do |message|
  page.should have_css(".text-danger", text: message)
end

When (/^I have made desired changes as "([^"]*)" and click 'Save'$/)do |postcode|
  page.find("#trainerPostcode").click
  page.find("#trainerPostcode").set(postcode)
  @trainers.create_trainer_record_page.updateTrainer_button.click

end

And (/^the system will show a success message, "([^"]*)"$/)do|message|
#page.should have_css(".toast-message", text: message)
  expect(page).to have_css(".toast-message", text: message)
end

And (/^I will remain on the trainer's record page$/)do
  expect(page).to have_content("Trainers management")
  expect(page).to have_selector(:css,"h3.panel-title",match: :first,text:'Update Trainer')
  expect(page).to have_selector(:css,"h3.panel-title",match: :'one',text:'Licences')
  page.should
end