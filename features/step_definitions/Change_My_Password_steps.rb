Then (/^the system will show user 'Profile details' in expand section$/)do
  expect(page.should have_css(".panel-group .panel:nth-child(2).panel-open", visible:true))
  expect(page.should have_button("Update", visible: true))
  expect(page.should have_button("Cancel", visible: true))
end

And (/^the 'Change password' section will be collapsed by default$/)do
  expect(page.should_not have_css(".panel-group .panel:nth-child(1).panel-open", visible:false))
end

When (/^I request to expand the 'Change password' section$/)do
  find("#lnk-toggle-change-password-form").click
end

Then (/^'Change password' section will be expanded$/)do
  expect(page.should have_css(".panel-group .panel:nth-child(1).panel-open", visible:true))
  expect(page.should have_css(".alert.alert-info", text: 'Please enter your current password and the new password you want to set on your account. Your new password must meet the password policy requirements.',visible: true))
  expect(page.should have_css("#currentPassword", visible: true))
end

And (/^'Profile details' section will be collapsed$/)do
  expect(page.should_not have_css(".panel-group .panel:nth-child(2).panel-open", visible:false))
  expect(page.should_not have_button("Update", visible: true))
end


And (/^I entered the password change data as "([^"]*)","([^"]*)","([^"]*)"$/)do |current_pwd, password, confirm_pwd|
   fill_in('currentPassword', :with=> current_pwd)
   fill_in('password', :with=> password)
   fill_in('passwordConfirm', :with=> confirm_pwd)
end

When (/^the current password is incorrect$/)do
  @current_pwd = find("#currentPassword").value
  if find("#currentPassword").vlaue.not.eq?(@current_pwd)
    puts "@current_pwd"
    end
end

And (/^the system will show validation error message, "([^"]*)"$/)do |current_pwd_invalid_msg|
expect(page).to have_css("p.help-block", text: current_pwd_invalid_msg)
end

And (/^password will not be changed$/)do
  expect(page).to have_no_css(".toast-message")
end

