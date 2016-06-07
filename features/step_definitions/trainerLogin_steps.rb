Given(/^that I have licence\.ndors\.org\.uk page opened$/) do
  visit $Trainers_Link
end

Given(/^I login as an "([^"]*)"$/) do |user|
  @trainers.trainer_login_page.login_as(user)
end

When(/^I login as an "([^"]*)" as accessor$/) do |user|
  @trainers.trainer_login_page.login_as(user)
end

When(/^I login as a "([^"]*)" user$/)do |user|
  @trainers.trainer_login_page.login_as(user)
end


When(/^I enter valid username$/) do

end

When(/^I enter valid password$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see this message "([^"]*)" on the page$/) do |text|
  expect(page).to have_css(".alert.alert-danger", text: text)
end


When(/^I enter valid "([^"]*)" username$/) do |user|
  @trainers.trainer_login_page.enter_valid_username(user)
end

When(/^I enter Invalid assessor username$/) do
  fill_in('txtemail', :with => 'sudiv123')
end

When(/^I enter valid "([^"]*)" password$/) do |user|
  @trainers.trainer_login_page.enter_valid_password(user)
end

When(/^I enter Invalid assessor password$/) do
  fill_in('txtpassword', :with => 'Password!')
end

When(/^I enter only assessor username$/) do
  fill_in('txtemail', :with => 'sudiv1')
end

When(/^I enter only assessor password$/) do
  fill_in('txtpassword', :with => 'P@ssw0rd1')
end

When(/^click Sign in$/) do
  click_button("Sign in")

end

Then(/^I will be granted access to the system$/) do
  expect(page).to have_css("#btn-signout", text: "Sign out")
end

Then(/^I will not be granted access to the system$/) do
  expect(page).to have_no_css('#btn-signout')
end

When(/^I make five failed login attempts as "([^"]*)"$/) do |user|
  @trainers.trainer_login_page.verify_no_user_is_signed_in
  5.times do
    @trainers.trainer_login_page.enter_valid_username(user)
    @trainers.trainer_login_page.enter_invalid_password
    @trainers.trainer_login_page.click_login
  end
end


And(/^I enter valid "([^"]*)" credentials$/) do|user|
  @trainers.trainer_login_page.enter_valid_username(user)
  @trainers.trainer_login_page.enter_valid_password(user)
  @trainers.trainer_login_page.click_login
end

Then(/^My account will be locked and I will be shown a message, "([^"]*)"$/) do |text|
   expect(page).to have_css(".alert.alert-danger",text: text)
end