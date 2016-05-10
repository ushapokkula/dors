And (/^I cancel the 'Requested' Assessment$/)do
  @trainers.cancel_or_rejection_notes_on_assessments_records_page.cancell_Assessment
  expect(page).to have_css(".alert.alert-success", text:'The assessment booking has been cancelled')
end

Then (/^I select 'Cancelled' status from 'Assessments Status' dropdown$/)do
  page.find("#single-button").click
  check('assessmentStatusChk3')
end

And (/^I should see The "Cancellation Notes"$/)do
  click_link_or_button("View Details")
  expect(page).to have_css("h1", text: 'My assessment details')
 page.find_all("label", text: 'Cancellation Notes')
  page.should have_css("#actionNotes")
  #expect(page).to have_css("#actionNotes", text: 'Notes for cancellation')

end
