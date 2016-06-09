And(/^I see button "([^"]*)" available under the licenses section$/)do |button|
  within(all(".panel-body")[1])do
    expect(page).to have_button(button,visible:true)
  end
end

Then(/^The "([^"]*)" button  is not visible when maximum licenses are added to a trainer$/)do |button|
  within(all(".panel-body")[1])do
    expect(page).to have_no_button(button,visible:true)
  end
end

And(/^I select course name, licence status and expiry date to add a new licence$/)do
  select('Motorway Course', :from=>'courseNames')
  select('Full', :from=> 'licenseStatuses')

  end

And(/^The system will add another row of licence entry below those already displayed$/)do
    expect(page).to have_xpath("html/body/div[1]/div/div[5]/div[2]/form[1]/div[3]")
end

And(/^"([^"]*)" and "([^"]*)" fields are editable for added licenses$/)do |field1,field2|
   field_labeled(field1, :disabled=> false)
   field_labeled(field2, :disabled=> false)
end

And(/^Expiry Date will have a date picker calender$/)do
 find("#licenseExpiryDate").click
 expect(page).to have_css(".uib-datepicker-popup",visible: true)
end

When(/^I enter past date in Expiry Date$/)do
  fill_in('licenseExpiryDate', :with=> '01/01/2016')
  page.find('#licenseExpiryDate').native.send_keys(:enter)
end

  And(/^The user should get an error as "([^"]*)" below "([^"]*)"$/)do |message, field|
    error_message = find(:xpath, ".//*[text()='#{field}']/parent::Div//p").text
    expect(error_message).to eq(message)
end