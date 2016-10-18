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

Then(/^I can see added licences table$/) do
expect(page).to have_css(".dors-well")
expect(page).to have_css(".auto-trainer-full-name-label", text:'Trainer Name', visible: true)
expect(page).to have_css(".auto-trainer-full-name", visible: true)
expect(page).to have_css(".auto-trainer-id-label", text:'Trainer Id', visible: true)
expect(page).to have_css(".auto-trainer-id",  visible: true)
end

Then(/^I can see table has below "([^"]*)","([^"]*)","([^"]*)","([^"]*)" details provided via Trainer Portal$/) do |scheme_name, status, licence_type, expiry_date|
find_all(".auto-scheme-name", text: scheme_name, visible: true)
find_all(".auto-license-status-label", text: 'Status', visible: true)
find_all(".auto-license-status", text: status)
find_all(".auto-license-type-label", text:'Licence Type', visible: true)
find_all(".auto-license-type", text:licence_type, visible: true)
find_all(".auto-license-expirydate-label", text:'Expiry Date', visible: true)
find_all(".auto-license-expirydate", text:expiry_date)
end

Then(/^I can see "([^"]*)" course "([^"]*)" type details on My Licences$/) do |scheme_name,licence_type|
  if scheme_name == 'Driving For Change'
    expect(page).to have_css(".auto-scheme-name", match: :first, text: scheme_name)
    find_all(".auto-license-type", match: :first, text: licence_type)
  else
  find_all(('.auto-scheme-name')[1], text:scheme_name)
  find_all(('.auto-license-type')[1], text:licence_type)
  end
  end

