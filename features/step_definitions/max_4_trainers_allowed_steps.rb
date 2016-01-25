When(/^I include one trainer from each course which include max four trainers in total$/) do
  @trainers.max_four_trainers_allowed_page.verify_four_trainer_inclusion
end

Then(/^I verify that all the four trainers are included in the assessment request$/) do
  sleep 3
  @trainers.max_four_trainers_allowed_page.verify_trainers_inclusion_per_request
end

Then(/^I check the status as Booked$/) do
  @trainers.max_four_trainers_allowed_page.verify_status_booked
end

And(/^I enter the mileage$/) do
  fill_in('mileage', :with => 500)
end

Then(/^I check the status as Requested$/) do
  @trainers.max_four_trainers_allowed_page.verify_status_requested
end

When(/^I try to include more than 4 trainers in assessment request$/) do
  @trainers.max_four_trainers_allowed_page.verify_validationmsg_morethan_4_trianers
end
When(/^I try to include more than 2 trainers per course$/)do
  @trainers.max_four_trainers_allowed_page.verify_validation_more_trainers_on_course
end