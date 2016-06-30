And(/^I see that the email is generated and sent to the registered email address$/) do
  @trainers.create_assessor_record_page.verify_email_generation
end

When(/^I click the link generated in the email to set password$/) do
  find(:xpath, ".//*[@id='Item.MessageUniqueBody']//a").click
end

Then(/^I will be shown a welcome page with the message "([^"]*)"$/) do |message|
  main = page.driver.browser.window_handles.first
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
  expect(page).to have_css("h1", text: "Signup for DORS+ account")
  expect(page).to have_css(".alert.alert-info", text: message)
end

And(/^I enter Username$/) do
  fill_in('username', :with => fetch("username"))
end

And(/^I enter Email$/) do
  fill_in('email', :with => fetch("email"))
end

And(/^I enter Password$/) do
  fill_in('password', :with => 'P@ssw0rd1')
end

And(/^I enter Confirm Password$/) do
  fill_in('passwordConfirm', :with => 'P@ssw0rd1')
end

And(/^When the password and confirm password both match$/) do
  password = find('#password').text
  confirm_password = find('#passwordConfirm').text
  expect(confirm_password).to eq password
end

Then(/^I see a success message displayed as "([^"]*)"$/) do |message|
  expect(page).to have_css(".alert.alert-success", text: message)
end

And(/^I enter the Username which does'nt match against the record created$/) do
  fill_in('username', :with => 'AutoUser')
end

Then(/^I see a validation message displayed as "([^"]*)"$/) do |message|
  puts expect(page).to have_css(".form-group.has-error p", text: message)
  puts message
end

When(/^I enter the Email which does'nt match against the record created$/) do
  fill_in('email', :with => 'test@wtg.co.uk')
end

And(/^I enter email which has invalid format$/) do
  fill_in('email', :with => 'invalidemailformat')
end

And(/^I enter confirm password which does'nt match with password$/) do
  fill_in('passwordConfirm', :with => 'P@ssw0rd2')
end

When(/^I enter the password which does'nt meet password policy requirements$/) do
  fill_in('password', :with => 'password')
end

And(/^I navigate to outlook web email$/) do
  page.driver.browser.switch_to.window(page.driver.find_window("https://mail.wtg.co.uk/owa/#path=/mail"))
  # visit "https://mail.wtg.co.uk/owa/"
end

And(/^I open the email which i have already used to set the password successfully$/) do
  find(:xpath, ".//span[text()='DORS Test']", match: :first).click
end

When(/^I try to access the link again$/) do
  expect(page).to have_xpath(".//*[@id='Item.MessageUniqueBody']//a", visible: true)
  find(:xpath, ".//*[@id='Item.MessageUniqueBody']//a").click
end

And(/^I see this message on the page "([^"]*)"$/) do |message|
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  expect(page.title)== "DORS Trainer"
  expect(page).to have_css(".alert.alert-danger", text: message)
end

And(/^I set the mandatory field "([^"]*)" as blank$/) do |fields|
  @trainers.create_assessor_record_page.verify_signup_mandatory_fields(fields)
  if fields == "Confirm Password"
    click_button("Create Account")
  end
end

When(/^I enter the password less than minimum limit$/) do
  @trainers.create_assessor_record_page.password_length_validation(7)
  page.find('#password').native.send_keys(:tab)
end

And(/^I refresh the page$/) do
  # page.driver.browser.navigate.refresh
  visit current_url
end

Then(/^The field is restricted to 26 characters$/) do
  find('#password').value.length == 26
end

When(/^I enter the password containing more than two consecutive chars of Username$/)do
  @user = $username_value.split(//).first(3).join.to_s
  fill_in('password', :with =>@user+"1234!")
  page.find('#password').native.send_keys(:tab)
end

When(/^I enter the password more than than the maximum limit$/) do
  @trainers.create_assessor_record_page.password_length_validation(30)
  page.find('#password').native.send_keys(:tab)
end

And(/^I close browser window at end$/) do
  page.driver.browser.close
end