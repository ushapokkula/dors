Then (/^I see 'Apply' button should be disabled$/)do
expect(page).to have_css("#btnApplyFilters[disabled]", visible: true)
end

And (/^I see 'Reset' button should be disabled$/)do
  expect(page).to have_css("#btnResetFilters[disabled]", visible: true)
end

And (/^'Trainer' filter default value should be empty$/)do
expect(page.find('#txt-trainer-name').value).to eq('')
end

And (/^'Assessor' filter default value should be empty$/)do
  expect(page.find('#txt-assessor-name').value).to eq('')
end


And (/^'Assessment ID' field should be empty$/)do
  expect(page.find('#txt-assessment-id').value).to eq('')
end

And (/^I should not see Assessor "([^"]*)" in assessor search field$/)do|assessor_name|
  expect(page.find('#txt-assessor-name').value).to_not eq(assessor_name)
end


Then(/^I should see default requested assessments for selected "([^"]*)" on assessment management page$/) do|assessor_name|
  expect(page).to have_css(".dors-table", :count=>2, visible: true)
  expect(page).to have_css(".assessor-name", text: assessor_name, visible: true)
  expect(page).to have_css(".trainer-outcomeStatus", visible: true)
end

And (/^I should see 'Reset' button will be enabled$/)do
  expect(page).to have_css("#btnResetFilters", visible: true)
end

Then (/^I see applied filters "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" should remain same$/)do|start_date, end_date, status1, status2, assessor_name|
  if (status1 =='Requested'&& status2 == 'Approved')
page.find("#single-button", visible: true).click
expect(page).to have_css("#single-button + .dropdown-menu", visible: true)
find("#assessmentStatusChk0").should be_checked
find("#assessmentStatusChk1").should be_checked
page.find("#txt-assessment-id", visible: true).click
expect(page.find("#txtEndDate").value).to eq(start_date)
expect(page.find("#txtEndDate").value).to eq(end_date)
expect(page).to have_css("#txt-assessor-name", text: assessor_name, visible: true)
  end
end

Then (/^I will be on Book Assessment page$/)do
  expect(page).to have_css("h1", text: 'Book Assessment', visible: true)
end

And (/^I select 'Completed' status from 'Assessments Status' dropdown$/)do
  page.find("#single-button", visible: true).click
  check('assessmentStatusChk4')
end

And (/^I enter "([^"]*)" in trainer search field on assessment management page$/)do|trainer_name|
  expect(page).to have_css("#txt-trainer-name", visible:true)
  fill_in("txt-trainer-name", :with=> trainer_name)
end

And (/^I enter "([^"]*)" in assessor search field on assessment management page$/)do|assessor_name|
  expect(page).to have_css("#txt-assessor-name", visible:true)
  fill_in("txt-assessor-name", :with=> assessor_name)
end

Then (/^I should not see "([^"]*)" message$/)do|message|
  expect(page).to have_no_css(".text-danger", text: message)
end

And (/^I uncheck "([^"]*)" status$/)do|status|
  if status == 'Requested'
page.find("#assessmentStatusChk0", visible:true).click
  end
  end