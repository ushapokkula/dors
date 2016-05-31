And(/^I see that the email is generated and sent to the registered email address$/)do
  @trainers.create_assessor_record_page.email_generation
end

When(/^I click the link generated in the email to set password$/)do
  find(:xpath, ".//*[@id='Item.MessageUniqueBody']//a").click
end

Then(/^I will be shown a welcome page with the message "([^"]*)"$/)do |message|
  main = page.driver.browser.window_handles.first
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
  expect(page).to have_css("h1", text:"Signup for DORS+ account")
  expect(page).to have_css(".alert.alert-info", text: message)
end

And(/^I enter Username$/)do
  fill_in('username', :with=> $username_value)
end

And(/^I enter Email$/)do
  fill_in('email', :with=> $email_value)
end

And(/^Enter Password and Confirm Password$/)do
  fill_in('password', :with=> 'P@ssw0rd1')
  fill_in('passwordConfirm', :with=> 'P@ssw0rd1')
end

And(/^When the password and confirm password both match$/)do
  password = find('#password').text
  confirm_password = find('#passwordConfirm').text
  expect(confirm_password) ==  password
end

Then(/^I see a success message displayed as "([^"]*)"$/)do |message|
  expect(page).to have_css(".alert.alert-success", text: message)
end

And(/^I enter the Username which does'nt match against the record created$/)do
  fill_in('username', :with=> 'AutoUser')
end

Then(/^I see a valiadation message displayed as "([^"]*)"$/)do |message|
  expect(page).to have_css(".form-group.has-error p", text:message)
end

When(/^I enter the Email which does'nt match against the record created$/)do
  expect(page).to have_css(".form-group.has-error p", text:message)
end

And(/^I enter email which has invalid format$/)do
  fill_in('email', :with=> 'invalidemailformat')
end

And(/^I enter password and confirm password which does'nt match$/)do
  fill_in('password', :with=> 'P@ssw0rd1')
  fill_in('passwordConfirm', :with=> 'P@ssw0rd2')
end

When(/^I enter the password which does'nt meet password policy requirements$/)do
  fill_in('password', :with=> 'password')
end