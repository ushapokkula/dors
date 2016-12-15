Given(/^I navigate to Summary page$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  find('a', text: "REQUEST ASSESSMENT").click
  find(:button, 'Pick a course', match: :first).click
  find(:button, 'Request Assessment', match: :first).click

end

When(/^I enter "([^"]*)" miles$/) do |miles|
  fill_in('mileage', :with => miles)
end

Then(/^The expenses claimed will be "([^"]*)" for "([^"]*)"$/) do |expenses_claimed, miles|
  @trainers.mileage_expense_calculation_page.mileage_calculation(expenses_claimed, miles)
end

Then(/^I see this message "([^"]*)"$/)do |label_text|
 expect(page).to have_css(".well p", text:label_text)
end

Then(/^below the message i see "([^"]*)" and "([^"]*)" fields$/) do |mileage, expenses|
  find_all("label", text:mileage, visible: true)
  find_all("label", text:expenses, visible: true)
end

When(/^I enter "([^"]*)" in mileage field$/) do |mileage|
  fill_in('mileage', :with => mileage)
end

Then(/^I see that the mileage field is restricted to "([^"]*)"$/) do |mileage|
  @trainers.mileage_expense_calculation_page.verify_mileage_restriction(mileage)
end

And(/^I see that the mileage field does not accept alphabets$/) do
  @trainers.mileage_expense_calculation_page.verify_mileage_with_alphabets
end

And(/^I see that the mileage field does not accept numbers and displays as "([^"]*)"$/) do |mileage_value|
  @trainers.mileage_expense_calculation_page.verify_decimal_inclusion_in_mileage_field(mileage_value)
end

And(/^The mileage and expenses will be saved with the assessment request record as "([^"]*)" and "([^"]*)"$/) do |expected_mileage, expected_expense|
  @trainers.mileage_expense_calculation_page.verify_DB_for_mileage_and_expense(expected_mileage, expected_expense)
end
