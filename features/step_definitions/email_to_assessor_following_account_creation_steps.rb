Then(/^The email will be generated with subject "([^"]*)"$/) do |subject|
  @trainers.create_assessor_record_page.email_generation(subject)
end

And(/^I fill all assessor fields on the create assessor form$/) do
  @trainers.create_assessor_record_page.fill_create_assessor_fields
end

And(/^I see that the email is generated and sent to the registered email address  with "([^"]*)" and "([^"]*)"$/) do |subject, body|
  @trainers.create_assessor_record_page.email_generation(subject, body)
end

Then(/^I see the message "([^"]*)" after assessor creation$/) do |text|
  expect(page).to have_css(".toast-message", text: text)
end

And(/^The link will include a crypt nonce making it difficult to guess$/) do
  @trainers.create_assessor_record_page.validate_nonce
end

And(/^The link will be  valid for 48 hours from the point of email send timestamp$/) do
  @trainers.create_assessor_record_page.verify_48_hours_validity
end

And(/^I fill all fields on the "([^"]*)" form$/) do |page|
  if page == "ASSESSORS"
    @trainers.create_assessor_record_page.fill_create_assessor_fields
  else
    @trainers.create_trainer_record_page.filling_trainer_details
  end
end

And(/^I come back to Trainers portal and I logout$/) do
  visit "https://auto.trainer.dors.wtg.co.uk"
  # page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  # expect(page.title)== "DORS Trainer"
  click_link("Sign out")
end

And(/^I delete all the emails in the user inbox$/) do
  page.driver.browser.switch_to.window(@main)
  all_mail = page.all(:xpath, ".//*[@autoid='_lvv_a']/div")
  all_mail.each do |x|
    x.click
    find("[title='Delete (Del)']").click
    # expect(page).to have_no_selector(:xpath, "#{x.path}")
  end
end


Given(/^I have deleted all the emails in the test email inbox$/) do
  visit "https://outlook.live.com/owa/"
  unless page.has_css?("[aria-label='Open menu']", wait: 4)
    find("input[type='email']").set("dors_test@outlook.com")
    find("[name='passwd']").set("dorstest123")
    find("[value='Sign in']").click
  end
  # page.should have_content("Inbox")
  all_mail = page.all(:xpath, ".//*[@autoid='_lvv_a']/div")
  all_mail.each do |x|
    x.click
    find("[title='Delete (Del)']").click
  end
end