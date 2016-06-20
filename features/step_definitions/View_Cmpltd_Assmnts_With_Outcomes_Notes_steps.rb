Then (/^I book assessment with nearby trainer$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.book_Assessment_includes_nearby_trainer
end

And(/^I 'Completed' Approved Assessment$/)do
  @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.complete_Approved_Assessment
end

Then (/^I load detailed view of 'Completed' Assessment$/)do
  page.find("#single-button", visible:true).click #clicking on  'Assessment status dropdown'
  expect(page).to have_css("#assessmentStatusChk4", visible: true)
  check('assessmentStatusChk4')                     #selecting Completed status#
  expect(page).to have_css(".assessment-status", text:'Completed')
  click_link_or_button("View Detail")              #clicking on 'View detail' link'
end


Then (/^I should see below information in view mode on 'Assessment Outcome' page$/)do |information|
  expect(page).to have_css("h1", text:'Assessment Outcome')
  expect(page).to have_css(".trainer-full-name")
  expect(page).to have_css(".trainer-license-label", text: 'License')
  expect(page).to have_css(".trainer-license")
  expect(page).to have_css(".trainer-outcome-label",text: 'Outcome')
  expect(page).to have_css(".trainer-outcome")
  expect(page).to have_css(".trainer-compliance-notes-label", text: 'Compliance Notes')
  expect(page).to have_css(".trainer-compliance-notes")
end


Then (/^I load detailed view of 'Completed' Assessment from 'My Assessments' page$/)do
  page.find("#single-button",visible: true).click                #clicking on  'Assessment status dropdown'
  expect(page).to have_css("#assessmentStatusChk4", visible: true)
  find("#assessmentStatusChk4").click
  expect(page).to have_css(".assessment-status")  # need an id for completed status#
  click_link_or_button("View Detail")

end

Then(/^I should see below information in view mode on 'My assessment details' page$/)do |information|
  expect(page).to have_css("h1", text:'Assessment Outcome')
  expect(page).to have_css(".assessmentStatus")  #looking for proper id#
  expect(page).to have_css(".trainer-fullname")
  expect(page).to have_css(".license-code-label", text: 'License')
  expect(page).to have_css(".license-code")
  expect(page).to have_css(".license-outcome-label",text: 'Outcome')
  expect(page).to have_css(".license-outcome")
  expect(page).to have_css(".license-compliance-notes-label", text: 'Compliance Notes')
  expect(page).to have_css(".license-compliance-notes")

end