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

Then (/^the system will filter assessment records in all filters combination on assessment management page$/)do

end

When (/^I click X against the selected trainer as shown in trainer search field$/)do
  find(".glyphicon-remove").click
end


Then (/^"([^"]*)" will be removed from trainer search field$/)do|selected_trainer|
expect(page).to have_no_css("#txt-trainer-name", text: selected_trainer)
end

Then (/^I should see "([^"]*)" from the drop down list$/)do|selected_trainer|

end

And (/^assessments list on the Assessments page will be refreshed to show updated data$/)do

end

And (/^other filters, if set, will be remain same$/)do

end