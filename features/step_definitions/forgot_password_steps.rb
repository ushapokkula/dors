Given(/^I am on the login page$/) do
  expect(page).to have_css('#txtemail')
end

And(/^I see "([^"]*)" link  on the login page$/) do |link|
  expect(page).to have_link(link)
end

Then(/^I will be directed to "([^"]*)" page$/) do |page_header|
  expect(page).to have_css("h1", text: page_header)
end

And(/^I leave the "([^"]*)" blank$/) do |field|
  fill_in(field, :with => '')
end

And(/^Enter remaining field leaving the "([^"]*)"$/) do |field|
  if field == "Username"
    fill_in('email', :with => 'swapna.gopu@wtg.co.uk')
  else
    fill_in('username', :with => 'sudiv')
  end
end

And(/^I click Logo to come out from that page$/) do
  find('.dors-logo').click
end

And(/^I enter "([^"]*)" as "([^"]*)"$/) do |data, field|
  fill_in(field, :with => data)
end

And(/^I see a validation message displayed "([^"]*)" against the field$/) do |message|
  expect(page).to have_css(".form-group.has-error", text: message)
end

And(/^I will remain on the same Forgot Password page$/) do
  expect(page).to have_css("h1", text: 'Forgot your password')
end

And(/^I enter valid "([^"]*)"$/) do |field|
  fill_in(field, :with => 'sudiv')
end

And(/^I enter Invalid "([^"]*)" format$/) do |field|
  fill_in(field, :with => 'test.com')
end

# And(/^I will be re-directed to login page$/) do
#   expect(page).to have_css("#txtemail")
# end

And(/^I request the reset password for the same user twice$/) do
  2.times do
    expect(page).to have_link('Forgot Your Password?')
    click_link("Forgot Your Password?")
    expect(page).to have_css("h1", text: "Forgot your password?")
    fill_in('username', :with => 'sudiv')
    fill_in('email', :with => 'dors_test@outlook.com')
    click_button("Reset Password")
    expect(page).to have_css(".alert.alert-info")
    find(".dors-logo").click
    sleep 10 #to have time gap in between old email and latest email
  end
end

And(/^I access the latest link$/) do
  find(:xpath, ".//*[@id='Item.MessageUniqueBody']//a").click
end

And(/^I will be taken to the password page to reset$/) do
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  expect(page).to have_css("h1", text: 'Reset your password')
end

And(/^I access the expired link$/) do
  page.driver.browser.switch_to.window(page.driver.find_window("https://outlook.live.com/owa/"))
  all(:xpath, ".//span[text()='DORS Test']")[1].click
  find(:xpath, ".//*[@id='Item.MessageUniqueBody']//a").click
end

Then(/^I will be taken to the error page displaying the message as "([^"]*)"$/) do |message|
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  expect(page).to have_css(".alert.alert-danger", text: message)
end

And(/^local administrator contact information is displayed in the email body as "([^"]*)"$/) do |local_administrator_information|
  puts expect(find(:xpath, "//*[@id='Item.MessageUniqueBody']").text).to include(local_administrator_information)
end

And(/^I can see two emails with "([^"]*)"$/) do |subject|
  @trainers.create_assessor_record_page.login_to_outlook
  expect(page).to have_no_css(".rpHighlightAllClass.rpHighlightSubjectClass", text: subject, count: 2)
#  expect(page).to have_xpath(".//span[text()='#{subject}']", count:2)
end

And(/^I request the forgot password for the same user twice after account creation$/) do
  2.times do
    expect(page).to have_link('Forgot Your Password?')
    click_link("Forgot Your Password?")
    expect(page).to have_css("h1", text: "Forgot your password?")
    fill_in('username', :with => fetch("username"))
    fill_in('email', :with => 'dors_test@outlook.com')
    click_button("Reset Password")
    expect(page).to have_css(".alert.alert-info")
    find(".dors-logo").click
    sleep 10 #to have time gap in between old email and latest email
  end
end

And(/^I click "([^"]*)" on signup page$/) do |button_name|
  click_button(button_name)
  if page.has_css?('.alert.alert-danger')
  click_button(button_name)
  end
end