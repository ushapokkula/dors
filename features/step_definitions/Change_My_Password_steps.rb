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
  @current_pwd = "P@s5w0rd1"
    if page.find('#currentPassword').value.should_not be_(@current_pwd)
    end
    end


And (/^the system will show validation error message, "([^"]*)"$/)do |current_pwd_invalid_msg|
expect(page).to have_css("p.help-block", text: current_pwd_invalid_msg)
end

And (/^password will not be changed$/)do
  expect(page).to have_no_css(".toast-message")
end


When (/^the new password and the confirmation of new password mismatch$/)do
  new_password =find("#password").value
  confirm_new_password = find("#passwordConfirm").value
  expect((new_password != confirm_new_password))
end

And (/^I will see a validation error message on the password confirmation field "([^"]*)"$/)do |password_confirm_mismatch_msg|
  expect(page).to have_css("p.help-block", text: password_confirm_mismatch_msg )
end

And (/^the current password is correct$/)do

end

When (/^the new password does not meet the password policy requirement$/)do

end

Then (/^the system will highlight the validation error message on the new password field,"([^"]*)"$/)do|password_ploicy_req_msg|

end

And (/^I will be shown the password policy requirements$/)do

end

When (/^I am on 'My Profile' page in default view$/)do
  expect(page.should have_css(".panel-group .panel:nth-child(2).panel-open", visible:true))
  expect(page.should have_button("Update", visible: true))
  expect(page.should have_button("Cancel", visible: true))
  expect(page.should_not have_css(".panel-group .panel:nth-child(1).panel-open", visible:false))
end

And (/^I have changed my password within the last 24 hours$/)do

end

Then (/^I will see the your password changed recently message,"([^"]*)"$/)do |password_recently_changed_msg|

end