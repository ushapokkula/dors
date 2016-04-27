Given(/^I am on Pick a course page$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  expect(page).to have_content("REQUEST ASSESSMENT")
  click_link_or_button("REQUEST ASSESSMENT")
  sleep 5
  first(:button, 'Pick a slot').click
end

When(/^I click Request assessmet button against trainer I want to book an assessment$/) do
  sleep 5
  first(:button, 'Request Assessment').click
end

Then(/^I will be taken to Request Assessment Summary page$/) do
  sleep 3
  link = find(".breadcrumb li:last-child > span").text
 expect(link).to be == "Summary"
end

Then(/^I will be shown trainers delivering courses nearby with same postcode whose licenses are expirying soon$/) do
  @trainers.show_near_by_trainers_page.verify_trainer_details_in_nearby_courses
end

Then(/^The following information will be shown for each of these trainers$/) do |table|
  new_table = table.hashes
@trainers.show_near_by_trainers_page.verify_trainer_details(new_table)
end

Then(/^I see Trainer Full name and site address$/) do
   expect(page).to have_css(".col-md-3.vertical-center.text-md")
   expect(page).to have_css("body > div.container >div:last-child  div >div:nth-child(3) > h5")
end

And(/^I check Include this Trainer for a trainer$/)do
  page.all('.ng-pristine.ng-valid')[1].click
  page.all('.ng-pristine.ng-valid')[3].click
  sleep 4
  click_link_or_button("Submit")
end

Then(/^The system will include the selected trainer in the booking request$/) do
  @trainers.show_near_by_trainers_page.verify_trainer_inlcuded_booking_request
end

And(/^I see that the courses displaying near by have same postcode as Primary one$/)do
  @trainers.show_near_by_trainers_page.verify_near_by_courses_same_postcode
end

