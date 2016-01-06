Given(/^I navigate to Summary page$/) do
@trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_link_or_button("REQUEST ASSESSMENT")
  first(:button, 'Pick a slot').click
  sleep 5
  first(:button, 'Request Assessment').click
  sleep 5
end

When(/^I enter "([^"]*)" miles$/) do |miles|
  fill_in('mileage', :with => miles)
end

Then(/^The expenses claimed will be "([^"]*)" for "([^"]*)"$/) do |expenses_claimed,miles|
@trainers.mileage_expense_calculation_page.mileage_calculation(expenses_claimed,miles)
end

Then(/^below the message i see "([^"]*)" and "([^"]*)" fields$/) do |mileage, expenses|
   page.has_content?(mileage)
   page.has_content?(expenses)
end

When(/^I enter "([^"]*)" in mileage field$/) do |mileage|
  fill_in('mileage', :with => mileage)
end

Then(/^I see that the mileage field is restricted to "([^"]*)"$/) do |mileage|
  @trainers.mileage_expense_calculation_page.verify_mileage_restriction(mileage)
end

And(/^I see that the mileage field does not accept alphabets$/)do
  @trainers.mileage_expense_calculation_page.verify_mileage_with_alphabets
end

And(/^I see that the mileage field does not accept numbers and displays as "([^"]*)"$/)do|mileage_value|
  @trainers.mileage_expense_calculation_page.verify_decimal_inclusion_in_mileage_field(mileage_value)
end

And(/^The mileage and expenses will be saved with the assessment request record as ([^"]*) and "([^"]*)"$/)do|expected_mileage,expected_expense|
 @trainers.mileage_expense_calculation_page.verify_DB_for_mileage_and_expense(expected_mileage,expected_expense)
end
