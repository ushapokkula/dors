And (/^searched trainer "([^"]*)" name includes trainer full name and trainer ID$/)do|name|
  expect(find("#txt-trainer-name").value).to be == name
end

When (/^I start typing invalid trainer id as "([^"]*)" in the trainer search field$/)do|trainerid|
  expect(page).to have_css(".title-header", text:'Assessments', visible:true)
  expect(page).to have_css("#txt-trainer-name", visible:true)
  fill_in("txt-trainer-name", :with=> trainerid)
end

Then(/^"([^"]*)" will be selected from the drop down list by default$/)do|first_trainer_name|
  #page.all(('#txt-trainer-name+ul li')[0]).value == first_trainer_name
  page.all(('#txt-trainer-name+ul li')[0]).value == first_trainer_name
end

Then (/^the system will filter assessment records in all "([^"]*)","([^"]*)","([^"]*)","([^"]*)"combination on assessment management page$/)do|date,trainer_name,status1,status2|
  if (status1 == "Requested" && status2 == "Approved")
expect(page).to have_css(".dors-table")
expect(page).to have_css(".trainer-full-name", text: trainer_name )
expect(page).to have_css(".assessment-date", text: date)

end
end

Then (/^I should see "([^"]*)" from the drop down list in trainer search field$/)do|selected_trainer_name|
  expect(page).to have_css("#txt-trainer-name", text: selected_trainer_name)
 # page.all(('#txt-trainer-name+ul li')[0]).value == selected_trainer_name
end

When (/^I click X against the selected trainer as shown in trainer search field$/)do
  find(".glyphicon-remove", visible: true).click
end


Then (/^"([^"]*)" will be removed from trainer search field$/)do|selected_trainer_name|
expect(page).to have_no_css("#txt-trainer-name", text: selected_trainer_name)
end

Then (/^The first name "([^"]*)" will be selected from the auto predict list$/)do|name|
  expect(find("#txt-trainer-name").value).to eq(name)
end

And (/^assessments list on the Assessments page will be refreshed to show updated data$/)do
  expect(page.all('.dors-table').count).to be>=1
end

And (/^other filters "([^"]*)","([^"]*)","([^"]*)","([^"]*)" , if set, will be remain same$/)do|status1,status2, start_date, end_date|
  if (status1 == "Requested" && status2 == "Approved")
  expect(page).to have_css("#single-button + .dropdown-menu",visible: true)
  find("#assessmentStatusChk0", visible: true).should be_checked
  find("#assessmentStatusChk1", visible: true).should be_checked
find("#txtStartDate").value == start_date
  find("#txtEndDate").value == end_date
end
  end