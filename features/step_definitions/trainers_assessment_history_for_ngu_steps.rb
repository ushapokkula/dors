And (/^searched trainer "([^"]*)" name includes trainer full name and trainer ID$/)do|name|
  expect(find("#txt-trainer-name").value).to be == name
end

When (/^I start typing invalid trainer id as "([^"]*)" in the trainer search field$/)do|trainerid|
fill_in("txt-trainer-name", :with=> trainerid)
end

Then(/^"([^"]*)" will be selected from the drop down list by default$/)do|first_trainer_name|
  #page.all(('#txt-trainer-name+ul li')[0]).value == first_trainer_name
  page.all(('#txt-trainer-name+ul li')[0]).value == first_trainer_name
end