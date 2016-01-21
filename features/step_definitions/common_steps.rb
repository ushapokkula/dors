When(/^I click "(.*?)"$/) do |link_or_button|
  click_link_or_button(link_or_button)
  sleep 10
end

When(/^I click "(.*?)" tab$/) do |tab|
  click_link_or_button(tab)
end

When(/^I navigate to "([^"]*)" page$/) do |tab|
  click_link_or_button(tab)
end

Then(/^I see a message "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

Then(/^an "(.*?)" button$/) do |button|
  find_button(button)
end

When(/^I click "(.*?)" button$/) do |button|
  click_link_or_button(button)
end

When(/^I click "(.*?)" link$/) do |link|
  click_link_or_button(link)
end

Then(/^I should see error message "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end
