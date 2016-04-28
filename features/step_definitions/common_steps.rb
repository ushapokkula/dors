When(/^I click "(.*?)"$/) do |link_or_button|
  click_link_or_button(link_or_button)

end

When(/^I click "(.*?)" tab$/) do |tab|
  click_link_or_button(tab)
end

When(/^I navigate to "([^"]*)" page$/) do |tab|
  click_link_or_button(tab)
  # find(:xpath,)
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


And(/^I logout$/) do
  find('#btn-signout').click
  # Capybara.reset_sessions!
end


And(/^I click Save$/) do
 find("#btnSaveSettings").click
end

