Given(/^I am logged into the "([^"]*)" Portal$/)do |data|
 visit "https://auto.new.#{data}.r2.dors.wtg.co.uk/login.aspx"
end


And(/^I login as "([^"]*)" user$/)do|user|
  fill_in('DORSLogin_UserName', :with=> ($users[user]['username']))
  fill_in('DORSLogin_Password', :with=>($users[user]['password']))
  find("#DORSLogin_LoginImageButton").click
end

And(/^I click Edit button$/)do
  find("#ctl00_ctl00_MainContent_Content_MainWizard_EditWizardStep1ImageButton").click
end

And(/^I click Save button$/)do
find(".button-save").click
end

And(/^I click Review button$/)do
  find(".button-next").click
end

And(/^I enter password to authenticate$/)do
fill_in('ctl00_ctl00_MainContent_Content_MainWizard_PasswordTextBox', :with=> 'P@ssw0rd1')
end

Given(/^the primary address on "([^"]*)" is "([^"]*)"$/)do |portal,old_email|
 if (((find(".email-short").text)==(old_email))== false)
   find("#ctl00_ctl00_MainContent_Content_MainWizard_EditWizardStep1ImageButton").click
   fill_in('ctl00_ctl00_MainContent_Content_MainWizard_EditUserDetailsControl_EmailTextBox', :with => old_email)
   find(".button-next").click
   find(".button-save").click
   fill_in('ctl00_ctl00_MainContent_Content_MainWizard_PasswordTextBox', :with=> 'P@ssw0rd1')
   find(".button-save").click
   find(".button-finish").click
 else
   puts "Primary Email address is #{old_email} on #{portal}"
 end
end

And(/^I click Finish$/)do
  find(".button-finish").click
end

And(/^I change email address of "([^"]*)" user from "([^"]*)" to "([^"]*)"$/)do|user,old_email, new_email|
  if find("#ctl00_ctl00_MainContent_Content_MainWizard_EditUserDetailsControl_EmailTextBox").value == old_email
     fill_in('ctl00_ctl00_MainContent_Content_MainWizard_EditUserDetailsControl_EmailTextBox', :with => new_email)
  end
end

And(/^I see the message "([^"]*)" on my account page$/)do|message|
  puts expect(page).to have_css("#ctl00_ctl00_MainContent_Content_MainWizard_ReceiptLabel", text: message)
end

And(/^I revert back to "([^"]*)" for the "([^"]*)" on "([^"]*)" portal$/)do |old_email,user,portal|
  visit "https://auto.new.#{portal}.r2.dors.wtg.co.uk/login.aspx"
  fill_in('DORSLogin_UserName', :with=> ($users[user]['username']))
  fill_in('DORSLogin_Password', :with=>($users[user]['password']))
  find("#DORSLogin_LoginImageButton").click
  click_link("My Account")
  find("#ctl00_ctl00_MainContent_Content_MainWizard_EditWizardStep1ImageButton").click
  fill_in('ctl00_ctl00_MainContent_Content_MainWizard_EditUserDetailsControl_EmailTextBox', :with => old_email)
  find(".button-next").click
  find(".button-save").click
  fill_in('ctl00_ctl00_MainContent_Content_MainWizard_PasswordTextBox', :with=> 'P@ssw0rd1')
  find(".button-save").click
  find(".button-finish").click
  click_link("Logout")
end
