Then(/^I see the message "([^"]*)" after creating trainer$/) do |text|
  expect(page).to have_css(".toast-message", text: text)
end