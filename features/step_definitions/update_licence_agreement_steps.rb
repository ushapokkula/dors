Given(/^I have licence agreement as "([^"]*)" for trainer Id "([^"]*)"$/) do |agreement_status, trainer_id|
  click_link("TRAINERS")
  fill_in('txt-trainer-name', :with => trainer_id)
  find("#txt-trainer-name + ul li", match: :first).click
  select(agreement_status, :from => 'licenseAgreementStatus')
  click_button("Update Trainer")
  expect(page).to have_no_css(".toast-success",visible: false) # wait until the loader diss-appears
end


And(/^I will be redirected to "([^"]*)" page$/) do |page_title|
  expect(page).to have_css("#auto-page-title", text: page_title)
end

And(/^search for trainer "([^"]*)"$/) do |trainer_id|
  fill_in('txt-trainer-name', :with => trainer_id)
  find("#txt-trainer-name + ul li", match: :first).click
end

And(/^I can see "([^"]*)" as Licence Agreement$/) do |agreement_status|
  expect(page).to have_css("#trainerFirstName",visible:true)
  expect(page).to have_css('#licenseAgreementStatus', visible: true, text: agreement_status)
  #expect(page).to have_select('licenseAgreementStatus', :selected => agreement_status)
end

And(/^I can see the last changed details with user fullname and updated date$/) do
  expected_text = find(".text-s").text
  @trainers.create_trainer_record_page.verify_fullname_updated_time_stamp
  actual_text = "Last changed by #{fetch('user_full_name')} (#{fetch('changed_by_username')}) on #{fetch('changed_time_stamp')}"
  expect(actual_text).to eq(expected_text)
end

Then(/^I will be logged out$/) do
  expect(page).to have_css("#txtemail")
end

When(/^I select "([^"]*)" as licence agreement$/) do |agreement_status|
  select(agreement_status, :from => 'licenseAgreementStatus')
end