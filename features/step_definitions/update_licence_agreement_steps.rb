Given(/^I have licence agreement as "([^"]*)" for trainer Id "([^"]*)"$/) do |agreement_status, trainer_id|
  click_link("TRAINERS")
  fill_in('txt-trainer-name', :with => trainer_id)
  find("#txt-trainer-name + ul li",match: :first).click
  #if((expect(page). to_have_select('licenseAgreementStatus', :selected=> agreement_status))== false)
    select(agreement_status, :from=>'licenseAgreementStatus')
    click_button("Update Trainer")
  expect(page).to have_css(".toast.toast-success", text:'Trainer record successfully updated')

end


And(/^I will be redirected to "([^"]*)" page$/) do |page_title|
 expect(page).to have_css("#auto-page-title", text: page_title)
end

And(/^search for trainer "([^"]*)"$/) do |trainer_id|
  fill_in('txt-trainer-name', :with => trainer_id)
  find("#txt-trainer-name + ul li",match: :first).click
end

And(/^I can see "([^"]*)" as Licence Agreement$/) do |agreement_status|
  expect(page).to have_select('licenseAgreementStatus', :selected=> agreement_status)
end

And(/^I can see the last changed details with user fullname and updated date$/) do
 expect(page).to have_css(".text-s>small strong")
end