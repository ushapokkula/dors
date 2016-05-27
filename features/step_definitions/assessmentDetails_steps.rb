When(/^I click one of the items in the list$/) do

  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
  within('.alert.alert-success.ng-binding') do
    expect(page).to have_content("The assessment has been Booked")
  end
  click_link("MY ASSESSMENTS")
  find(:button, 'View Details', match: :first).click
end

Then(/^The system will load "([^"]*)" page$/) do |text|
  expect(page).to have_content(text)
end

Then(/^The page will display the Assessor and Trainer details$/) do |table|
  new_table=table.hashes
  @trainers.assessment_details_page.verify_assessor_and_trainer_details(new_table)
end

And(/^The mileage and expenses claimed  will be shown$/) do
  @trainers.assessment_details_page.verify_mileage_expenses_fields
end

And(/^The Notes field will be displayed$/) do
  expect(@trainers.assessment_details_page).to have_notes
end


Then(/^I will be re\-directed to "([^"]*)" page$/) do |text|
  expect(page).to have_css("h1",text:text)
end