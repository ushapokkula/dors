When(/^I click "(.*?)"$/) do |link_or_button|
  click_link_or_button(link_or_button)

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


And(/^I logout$/) do
  find('#btn-signout').click
  # Capybara.reset_sessions!
end


And(/^I click Save$/) do
 find("#btnSaveSettings").click
end

#DR-39# #DR-674#
And (/^I will remain on the trainer's record page$/) do
  expect(page).to have_content("Trainers management")
  expect(page).to have_selector(:css, "h3.panel-title", match: :first, text: 'Update Trainer')
  expect(page).to have_selector(:css, "h3.panel-title", match: :'one', text: 'Licences')
  page.should have_css("#btnCreateUpdateTrainer", text: 'Update Trainer')
end