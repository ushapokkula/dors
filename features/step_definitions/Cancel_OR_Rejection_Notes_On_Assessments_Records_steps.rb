And (/^I 'Cancel' the 'Requested' Assessment$/)do
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.cancel_Assessment
  expect(page).to have_css(".alert.alert-success", text:'The assessment booking has been cancelled')
end

Then (/^I select 'Cancelled' status from 'Assessments Status' dropdown$/)do
  page.find("#single-button", visible: true).click
  check('assessmentStatusChk3')
end

And (/^I should see the 'Cancellation Notes' on My Assessment details page$/)do
  expect(page).to have_css("h1", text: 'Assessment Details')
  expect(page).to have_css("label[for='actionNotes']", text: 'Cancellation Notes')
 expect(page.should have_css("#actionNotes[readonly]"))
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_cancel_field_value
end

Then(/^I see the "([^"]*)" option is in selected status$/)do|status|
  expect(page).to have_css("#single-button", visible:true)
  page.find("#single-button", visible:true).click

  expect(page).to have_css("#single-button + .dropdown-menu", visible:true)
  within("#single-button + .dropdown-menu") do
    find("input[type='checkbox']:checked + label").text == status
    find("#assessmentStatusChk0").should be_checked
  end
  end


And (/^I 'Reject' the 'Requested' Assessment$/)do
  #expect(page).to have_css(".assessment-status", text: 'Requested')
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.reject_Assessment
  expect(page).to have_css(".alert.alert-success")

end

Then (/^I select 'Rejected' status from 'Assessments Status' dropdown$/)do
  page.find("#single-button", visible: true).click
  check('assessmentStatusChk2')
end

And (/^I should see the 'Rejection Notes' on Assessment Outcome page$/)do
  expect(page).to have_css("h1", text: 'Assessment Details')
  expect(page).to have_css("label[for='actionNotes']", text: 'Rejection Notes')
  expect(page.should have_css("#actionNotes[readonly]"))
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_rejection_field_value
end

And (/^I select 'Approved' status from 'Assessment Status' dropdown$/)do
  expect(page).to have_css("#single-button + .dropdown-menu", visible:true)
  check('assessmentStatusChk1')
end

Then (/^I should see 'Approved' Assessment$/)do
  expect(page).to have_css(".assessment-status", text: 'Approved')
end

And (/^I 'Cancel' the 'Approved' Assessment$/)do
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.cancel_Approved_Assessment
  expect(page).to have_css(".alert.alert-success")

end

And (/^I should see the 'Cancellation Notes' on Assessment Outcome page$/)do
  expect(page).to have_css("h1", text: 'Assessment Details')
  expect(page).to have_css("label[for='actionNotes']", text: 'Cancellation Notes')
  expect(page.should have_css("#actionNotes[readonly]"))
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_cancel_field_value
end