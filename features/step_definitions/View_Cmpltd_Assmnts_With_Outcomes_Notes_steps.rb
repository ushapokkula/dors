Then (/^I request assessment with nearby trainer$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.request_Assessment_includes_nearby_trainer
end

And (/^I "([^"]*)" requested Assessment$/)do |status|
  @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.approve_Assessment(status)
  find("#single-button").click
  check('assessmentStatusChk1')
  expect(page).to have_css(".assessment-status",text: 'Approved')
end

Then(/^I "Completed" approved Assessment$/)do
  @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.complete_Approved_Assessment
end

Then (/^I load detailed view of the Completed Assessment$/)do
  find("#single-button").click
  check('assessmentStatusChk4')
  expect(page).to have_css(".assessment-status", text:'Completed')
 click_link_or_button("View Detail")
end

Then (/^I should able to see below "([^"]*)" on assessment outcome page$/)do |fields|
  expect(page).to have_css("h1", text:'Assessment Outcome')

end
