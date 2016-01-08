Given(/^I am on Pick a course page$/) do
  expect(page).to have_content("REQUEST ASSESSMENT")
  click_link_or_button("REQUEST ASSESSMENT")
  sleep 5
  first(:button, 'Pick a slot').click
end

When(/^I click Request assessmet button against trainer I want to book an assessment$/) do
  sleep 5
  first(:button, 'Request Assessment').click
end

Then(/^I will be taken to Request Assessment Summary page$/) do
  link = find(".breadcrumb li:last-child > span").text
 expect(link).to be =="Summary"
end

Then(/^I will be shown trainers delivering courses nearby with same postcode whose licenses are expirying soon$/) do
  # .dors-well-container
end

Then(/^The following information will be shown for each of these trainers$/) do |table|
  new_table = table.hashes
@trainers.show_near_by_trainers_page.verify_trainer_details(new_table)
end

Then(/^I see Trainer Full name and site address$/) do
expect(page).to have_css?(".col-md-3.vertical-center.text-md")
  expect(page).to have_css?("")
end