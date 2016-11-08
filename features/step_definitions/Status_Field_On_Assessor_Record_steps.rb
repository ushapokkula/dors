Then (/^I see Assessor status set as 'Active' by default$/)do
  expect(page).to have_css("#asssessor-status", text:'Status')
  page.should have_selector "input[type='radio'][disabled='disabled'][value='true']"
  find_all('label.radio-inline')[0].text == 'Active'
end

And (/^status fields will be disabled$/)do
  field_labeled('Active', :disabled => true)
  field_labeled('Inactive', :disabled => true)
end

Then (/^I can not set status as 'Inactive'$/)do
  find_all(('label.radio-inline')[1], text:'Inactive')
  page.should have_selector "input[type='radio'][disabled='disabled'][value='false']"
end

And(/^'Inactive' status field will be disabled$/)do
  field_labeled('Inactive', :disabled => true)
end

And (/^I loads an existing "([^"]*)" record$/)do |assessor|
  expect(page).to have_css("#txt-assessor-name", visible: true)
  fill_in('txt-assessor-name', :with=> assessor)
  find("#txt-assessor-name + ul li", match: :first).click
end

Then (/^I should see the Assessor details$/)do
  expect(page).to have_content("Update Assessor")
  expect(page).to have_content("Status")
end

Then (/^status field will be editable$/)do
  # if find("#assessor-status-inactive").value == 'true'
  #   page.find("#assessor-status-active").click
  #    puts "status changed to 'Active'."
  # else
  find("#assessor-status-active").click
  # end

  end

Then (/^I set status as 'Inactive'$/)do
  page.find("#assessor-status-inactive").click
end

Then (/^I set status as 'Active'$/)do
page.find("#assessor-status-active").click
end


And (/^I update Assessor record$/)do
page.find("#btnCreateUpdateAssessor").click
expect(page).to have_css(".toast-message", text: 'Assessor record successfully updated.')
expect(page).to have_no_css(".toast-message") #To verify the signout button #
end


Then (/^will get the standard invalid credentials login failure message$/)do
  page.should have_css('.alert.alert-danger', visible: true)
end

And (/^message will appear as: "([^"]*)"$/)do|loginfailure_message|
  expect(page).to have_css(".alert.alert-danger", text: loginfailure_message)
end


And(/^I will be directed to "Forgot your password?" page$/)do
  expect(page).to have_css("h1", text: 'Forgot your password?')
  expect(page).to have_css("h3", text: 'Complete your profile')
  expect(page).to have_xpath("//button[@type='submit']", text: 'Reset Password')
end

When (/^I enter "([^"]*)" as 'Username'$/)do |matchingusername|
  fill_in('username', :with=> matchingusername)
end

Then (/^I enter "([^"]*)" as 'Email'$/)do |matchingemail|
  fill_in('email', :with=>matchingemail)
end

And (/^I will be re-directed to login page$/)do
  expect(page).to have_css("#txtemail")
  expect(page).to have_xpath("//button[@type='submit']", text: 'Sign in')
end

Then (/^I should see the message as "([^"]*)"$/)do |message|
  expect(page).to have_css(".alert.alert-info", text: message)
end

And (/^I should not see that the email generated and sent to the registered email address  with "([^"]*)"$/)do|subject|
  @trainers.create_assessor_record_page.verify_no_change_password_email_received(subject)
end