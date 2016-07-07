Given(/^I have licence agreement as "([^"]*)" for trainer Id "([^"]*)"$/) do |agreement_status, trainer_id|
  click("TRAINERS")
  fill_in('txt-trainer-name', :with => trainer_id).send_keys(:enter)


end


And(/^I will be redirected to "([^"]*)" page$/) do |page|

end

And(/^search for trainer "([^"]*)"$/) do |arg|

end

And(/^I can see "([^"]*)" as Licence Agreement$/) do |arg|

end

And(/^I can see the last changed details with user fullname and updated date$/) do

end