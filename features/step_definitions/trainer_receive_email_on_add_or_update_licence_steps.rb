And(/^I am on update trainer page$/)do
  expect(page).to have_button('Update Trainer')
end

When(/^I add new licence with "([^"]*)" course and "([^"]*)" licence status$/) do |course, licence_status|
  page.find(".ui-select-container").click
  page.find(".ui-select-search").set(course)
  page.find(".ui-select-search").send_keys(:enter)
  select(licence_status,:from=> 'licenseStatuses')
end

And(/^only one email is sent with the subject "([^"]*)" after updating$/) do|subject|
  puts expect(page).to have_css(".rpHighlightAllClass.rpHighlightSubjectClass", text: subject, count:1)
end

When(/^I update licence status of Berks-Scheme course to "([^"]*)"$/) do |new_licence_status|
  select(new_licence_status,:from=> 'licenseStatuses_0')
end

And(/^I update licence status of Driver Alertness course to "([^"]*)"$/) do |new_licence_status|
  select(new_licence_status,:from=> 'licenseStatuses_1')
end

When(/^I set the trainer as inactive$/) do
  find("#trainer-status-inactive").click
end

And(/^the licence statuses  will be changed to "([^"]*)"$/)do |licence_status|
  expect(page).to have_css("#licenseStatuses_0", text: licence_status)
  expect(page).to have_css("#licenseStatuses_1", text: licence_status)
end

# When(/^I select "([^"]*)" as licence agreement$/) do |licnece_agreement|
#   select(licnece_agreement, :from=> 'licenseAgreementStatus')
# end


When(/^I change the expiry date of both the licences to "([^"]*)"$/) do |expiry_date|
  fill_in('licenseExpiryDate_0', :with=> expiry_date)
  fill_in('licenseExpiryDate_1', :with=> expiry_date)
end

And(/^licence status of Driver Awareness is "([^"]*)"$/) do |licence_status|
  select(licence_status, :from=> 'licenseStatuses_0') unless page.has_css?("licenseStatuses_0" ,text:licence_status)
end

And(/^I search for Booked assessment$/) do
  @trainers.ngu_search_assessment_id_page.verify_booked_assessmemt_id_in_DB
  fill_in('txt-assessment-id', :with => $booked_status)
end

And(/^the "([^"]*)" page will be displayed$/) do |header_text|
  expect(page).to have_css("#assessment-title-header", text: header_text)
end

And(/^I select "([^"]*)" as outcome for both the trainers in the assessment$/) do |outcome|
  select(outcome, :from=> 'status-864')
  select('Absent', :from=> 'status-866')
end

And(/^two emails are received with the subject "([^"]*)" after updating$/) do |subject|
  find(:xpath, ".//span[text()='DORS Test']", match: :first).click
  expect(page).to have_xpath(".//span[text()='#{subject}']", count:2)
end

And(/^I request assessment to be Booked$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  find('a', text: "REQUEST ASSESSMENT").click
  find(:button, 'Pick a course', match: :first).click
  find(:button, 'Request Assessment', match: :first).click
  find(".include-nearby-trainer-checkbox", match: :first).click
  #all('.include-main-trainer-checkbox')[0].click
  click_link_or_button("Submit")
end


Then(/^I see that the email is generated and sent to the registered email address  with "([^"]*)" and "([^"]*)" once assessment is completed$/) do |subject, body|
  @trainers.create_assessor_record_page.login_to_outlook
  find(:xpath, ".//span[text()='Your NDORS Trainer Licence schedule has been updated']", match: :first).click
  expect(page).to have_css(".rpHighlightAllClass.rpHighlightSubjectClass", text: subject)
  expect(page).to have_xpath("//*[@id='Item.MessageUniqueBody']", :text => body)
end

Then(/^I see that the email is generated and sent to the registered email address  with "([^"]*)" and "([^"]*)" after the changes\.$/) do |subject, body|
  @trainers.create_assessor_record_page.login_to_outlook
  sleep 30
  find(:xpath, ".//span[text()='Your NDORS Trainer Licence schedule has been updated']", match: :first).click
  expect(page).to have_css(".rpHighlightAllClass.rpHighlightSubjectClass", text: subject)
  expect(page).to have_xpath("//*[@id='Item.MessageUniqueBody']", :text => body)
end