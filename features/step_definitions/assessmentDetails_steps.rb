When(/^I click one of the items in the list$/) do
  sleep 5
  page.find('.btn.btn-default').all[1].click
  #(page.all('.btn.btn-default')[1]).click
end

Then(/^The system will load "([^"]*)" page$/) do |text|
  page.has_content?(text)
end

Then(/^The page will display the Assessor and Trainer details$/) do |table|
  new_table=table.hashes
  @trainers.assessment_details_page.verify_assessor_and_trainer_details(new_table)
end

And(/^The mileage and expenses claimed  will be shown$/) do
  @trainers.assessment_details_page.verify_mileage_expenses_fields
end

And(/^The Notes field will be displayed$/) do
  @trainers.assessment_details_page.verify_notes_field
end

And(/^I will be re-direct to My Assessments page$/)do
   expect(page).to have_content("My assessments")
end