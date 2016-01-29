Given(/^that I have logged into trainers\.ndors\.org\.uk$/) do
  visit $Trainers_Link
  @trainers.trainer_login_page.verify_no_user_is_signed_in
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