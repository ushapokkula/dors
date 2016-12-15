Then(/^I see the message "([^"]*)" after creating trainer$/) do |text|
  expect(page).to have_css(".toast-message", text: text)
end


And(/I will be shown password policy requirements to set the password$/)do
puts expect(page).to have_css(".popover.ng-isolate-scope.fade.in.bottom", visible:true)
puts expect(page).to have_css(".password-policy-requirement",visible:true)
end

And(/^I close the broswer window$/)do
  page.execute_script "window.close();"
end