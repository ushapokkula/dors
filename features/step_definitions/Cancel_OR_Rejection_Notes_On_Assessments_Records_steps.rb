And (/^I 'Cancel' the 'Requested' Assessment$/)do
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.cancel_Assessment
  expect(page).to have_css(".alert.alert-success", text:'The assessment booking has been cancelled')
end

Then (/^I select 'Cancelled' status from 'Assessments Status' dropdown$/)do
  page.find("#single-button").click
  check('assessmentStatusChk3')
end

And (/^I should see the 'Cancellation Notes' on My Assessment details page$/)do
  click_link_or_button("View Details")
  expect(page).to have_css("h1", text: 'My assessment details')
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_cancel_label
 @trainers.cancel_or_rejection_notes_on_assessments_records_page.cancel_notes_should_be_visible
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_cancel_field_value
end

Then(/^I see the "([^"]*)" option is in selected status$/)do|status|
  page.find("#single-button").click
  within(".dropdown-menu") do
    find("input[type='checkbox']:checked + label").text == status
    find("#assessmentStatusChk0").should be_checked
  end
  end


And (/^I 'Reject' the 'Requested' Assessment$/)do
  expect(page).to have_css(".assessment-status", text: 'Requested')
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.reject_Assessment
  expect(page).to have_css(".alert.alert-success")

end

Then (/^I select 'Rejected' status from 'Assessments Status' dropdown$/)do
  page.find("#single-button").click
  check('assessmentStatusChk2')
end

And (/^I should see the 'Rejection Notes' on Assessment Outcome page$/)do
  click_link_or_button("View Details")
  expect(page).to have_css("h1", text: 'Assessment Outcome')
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_reject_label
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.rejection_notes_should_be_visible
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_rejection_field_value
end

And (/^I select 'Approved' status from 'Assessment Status' dropdown$/)do
  page.find("#single-button").click
  check('assessmentStatusChk1')
  expect(page).to have_css(".assessment-status", text: 'Approved')
end

And (/^I 'Cancel' the 'Approved' Assessment$/)do
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.cancel_Approved_Assessment
  expect(page).to have_css(".alert.alert-success")

end

And (/^I should see the 'Cancellation Notes' on Assessment Outcome page$/)do
  click_link_or_button("View Details")
  expect(page).to have_css("h1", text: 'Assessment Outcome')
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_cancel_label
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.cancel_notes_should_be_visible
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.verify_cancel_field_value
end