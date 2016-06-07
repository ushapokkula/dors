Then (/^I will be directed to my landing page \(i.e. My Licences\)$/)do
@trainers.trainer_landing_page_and_permissions_page.should have_page_title
@trainers.trainer_landing_page_and_permissions_page.page_title.text.should eql "My Licenses"
expect(page).to have_css('.dors-well')
@trainers.trainer_landing_page_and_permissions_page.should have_trainer_name
@trainers.trainer_landing_page_and_permissions_page.should have_trainer_id
@trainers.trainer_landing_page_and_permissions_page.should have_course_name
@trainers.trainer_landing_page_and_permissions_page.should have_license_status
@trainers.trainer_landing_page_and_permissions_page.should have_expiry_date
end

And (/^I will also have access to "(.*?)" page from the navigation menu$/) do |tab|
expect(page).to have_content('MY PROFILE')
  click_link_or_button(tab)
  expect(page).to have_css('h1', text: 'My Profile')
end

When (/^I access any system resource that I am not authorized to access$/)do
  @adminURL = "https://auto.trainer.dors.wtg.co.uk/#/admin/"
  visit @adminURL
  puts current_url
  @trainers.trainer_landing_page_and_permissions_page.current_url.should eql "https://auto.trainer.dors.wtg.co.uk/#/my-licenses"
end

Then(/^I should see "(.*?)" No Licenses Message$/)do |message|
expect(page).to have_css(".alert.alert-info", text: message, visible:true)
end
