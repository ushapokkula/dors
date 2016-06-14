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

And(/^The Expiry Date will be defaulted to "([^"]*)"$/)do |days|
  @trainers.ngu_adds_licence_to_a_trainer_page.verify_default_expiry_date(days)
end

And(/^I select "([^"]*)" to add a licence$/)do |data|
   if data == "Motorway Course"
  select(data, :from=>'courseNames')
   else
     select(data, :from=>'licenseStatuses')
end
end

And(/^I see 'X' button for added new licence which is not saved to dataabase$/)do
  expect(page).to have_css(".btn.btn-danger", visible: true)
end

And(/^The licence row will be deleted$/)do
  expect(page).to have_no_css(".btn.btn-danger", visible: true)
end

And(/^The X button will not be available for licences persisted in the DB$/)do
  expect(page).to have_no_css(".btn.btn-danger.ng-hide", visible: true)
end

And(/^I click X button$/)do
  find(".btn.btn-danger").click
end

And(/^Changes will be reflected on page$/)do
  find("#courseNames").click
  expect(page).to have_select('courseNames', :with_options => ['Motorway Course'])
 # page.should have_select('#courseNames', :options => 'Motorway Course')
end

And(/^I click "([^"]*)" without setting the data$/)do|field_name|
  find_field(field_name).click
end

Then(/^I see "([^"]*)" against each "([^"]*)"$/)do |message, field|
  error_message = find(:xpath, ".//*[text()='#{field}']/parent::Div//p").text
  expect(error_message).to eq(message)
end

And(/^The "([^"]*)" is not available in the Course dropdown to select for another licence$/)do |course_name|
  find("#courseNames").click
  expect(page).to have_no_select('courseNames', :with_options => [course_name])
end


And(/^I add two licences to the trainer with "([^"]*)" and "([^"]*)" with status as "([^"]*)"$/)do|course1,course2,status|
  select(course1, :from=>'courseNames')
  select(status, :from=>'licenseStatuses')
  click_button('Add licence')
  select(course2, :from=>'courseNames')
  select(status, :from=>'licenseStatuses')
end

And(/^I see there are no multiple licences for "([^"]*)" and "([^"]*)"$/)do |course1,course2|
  find("#courseNames").click
  expect(page).to have_no_select('courseNames', :with_options => [course1,course2])
end

And(/^I will be redirected to the Update trainer page$/)do
    expect(page).to have_no_css(".toast-message", text: "New trainer successfully created.")
 expect(page).to have_button('Update Trainer', visible:true)
end