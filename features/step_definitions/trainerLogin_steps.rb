Given(/^that I have licence\.ndors\.org\.uk page opened$/) do
  @trainers.trainer_login_page.load
  # visit $Trainers_Link
  @trainers.trainer_login_page.verify_no_user_is_signed_in
 end

Given(/^I login as an "([^"]*)"$/) do |user|
  @trainers.trainer_login_page.log_in(user)
end

When(/^I enter valid username$/) do

end

When(/^I enter valid password$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


When(/^I enter valid assessor username$/) do
  fill_in('txtemail', :with=> 'sudiv')
end

When(/^I enter Invalid assessor username$/)do
  fill_in('txtemail', :with=> 'sudiv123')
end

When(/^I enter valid assessor password$/) do
  fill_in('txtpassword', :with=> 'P@ssw0rd')
end

When(/^I enter Invalid assessor password$/)do
  fill_in('txtpassword', :with=> 'Password!')
end

When(/^I enter only assessor username$/)do
  fill_in('txtemail', :with=> 'sudiv1')
end

When(/^I enter only assessor password$/)do
  fill_in('txtpassword', :with=> 'P@ssw0rd1')
end

When(/^click Sign in$/) do
  click_button("Sign in")
  sleep 5
end

Then(/^I will be granted access to the system$/) do
   expect(page).to have_content("Sign out")
end

Then(/^I will not be granted access to the system$/)do
  expect(page).to have_no_content("Sign out")
end

When(/^I make five failed login attempts$/) do
  5.times do
    @trainers.trainer_login_page.enter_valid_username
    @trainers.trainer_login_page.enter_invalid_password
    @trainers.trainer_login_page.click_login
  end
end

And(/^I enter valid credentials$/)do
  @trainers.trainer_login_page.enter_valid_username
  @trainers.trainer_login_page.enter_valid_password
  @trainers.trainer_login_page.click_login
end

Then(/^My account will be locked and I will be shown a message, "([^"]*)"$/) do |text|
 page.should have_content(text)
end