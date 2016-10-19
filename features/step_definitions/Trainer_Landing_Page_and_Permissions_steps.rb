Then (/^I will be directed to my landing page \(i.e. My Licences\)$/)do
@trainers.trainer_landing_page_and_permissions_page.should have_page_title
@trainers.trainer_landing_page_and_permissions_page.page_title.text.should eql "My Licences"
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

Then(/^I can see a table with 4 columns$/) do
expect(page).to have_css(".dors-well")
expect(page).to have_css(".auto-trainer-full-name-label", text:'Trainer Name', visible: true)
expect(page).to have_css(".auto-trainer-full-name", visible: true)
expect(page).to have_css(".auto-trainer-id-label", text:'Trainer Id', visible: true)
expect(page).to have_css(".auto-trainer-id",  visible: true)
expect(page).to have_css(".auto-scheme-name", visible: true)
expect(page).to have_css(".auto-license-type-label", text:'Licence Type', visible: true)
expect(page).to have_css(".auto-license-type",  visible: true)
expect(page).to have_css(".auto-license-status-label", text: 'Status', visible: true)
expect(page).to have_css(".auto-license-status", visible: true)
expect(page).to have_css(".auto-license-expirydate-label", text:'Expiry Date', visible: true)
expect(page).to have_css(".auto-license-expirydate",visible: true)

end

Then(/^I can see table details provided via Trainer Portal are displayed as "([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |scheme_name, licence_type, status, expiry_date|
expect(page).to have_css(".auto-scheme-name", text: scheme_name, visible: true)
expect(page).to have_css(".auto-license-type-label", text:'Licence Type', visible: true)
expect(page).to have_css(".auto-license-type", text: licence_type, visible: true)
expect(page).to have_css(".auto-license-status-label", text: 'Status', visible: true)
expect(page).to have_css(".auto-license-status", text: status)
expect(page).to have_css(".auto-license-expirydate-label", text:'Expiry Date', visible: true)
expect(page).to have_css(".auto-license-expirydate", text:expiry_date)
end

Then(/^I can see "([^"]*)" type "([^"]*)" course details in the table$/) do |licence_type,scheme_name|
    expect(page).to have_css(".auto-scheme-name", text: scheme_name, visible: true)
    expect(page).to have_css(".auto-license-type-label", text:'Licence Type', visible: true)
    expect(page).to have_css(".auto-license-type",text: licence_type, visible: true)
  end

