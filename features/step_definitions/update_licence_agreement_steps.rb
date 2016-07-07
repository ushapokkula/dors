Given(/^I have licence agreement as "([^"]*)" for trainer Id "([^"]*)"$/) do |agreement_status, trainer_id|
  click_link("TRAINERS")
  fill_in('txt-trainer-name', :with => trainer_id).send_keys(:enter)
  select(agreement_status, :from=>'licenseAgreementStatus')
  click_button("Update Trainer")
  expect(page).to have_css(".taost-message", text:'New trainer updated successfully')
end


And(/^I will be redirected to "([^"]*)" page$/) do |page|
 expect(page).to have_css('h1',text: page)
end

And(/^search for trainer "([^"]*)"$/) do |arg|
  fill_in('txt-trainer-name', :with => trainer_id).send_keys(:enter)
end

And(/^I can see "([^"]*)" as Licence Agreement$/) do |agreement_status|
  expect(page).to have_select('licenseAgreementStatus', :selected=> agreement_status)
end

And(/^I can see the last changed details with user fullname and updated date$/) do

end