Given(/^I am on Pick a course page$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  find('a', text: "REQUEST ASSESSMENT").click
  find(:button, 'Pick a slot', match: :first).click

end

When(/^I click Request assessment button against trainer I want to book an assessment$/) do
  find(:button, 'Request Assessment', match: :first).click
end

Then(/^I will be taken to Request Assessment Summary page$/) do
  expect(page).to have_selector(".breadcrumb li:last-child > span", text: "Summary")
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
  find(".include-main-trainer-checkbox", match: :first)
  all('.include-main-trainer-checkbox')[0].click
  find(".include-nearby-trainer-checkbox", match: :first)
  all('.include-nearby-trainer-checkbox')[1].click
    click_link_or_button("Submit")
  expect(page).to have_css(".alert.alert-success")
end

Then(/^The system will include the selected trainer in the booking request$/) do
  @trainers.show_near_by_trainers_page.verify_trainer_inlcuded_booking_request
end

And(/^I see that the courses displaying near by have same postcode as Primary one$/)do
  @trainers.show_near_by_trainers_page.verify_near_by_courses_same_postcode
end

