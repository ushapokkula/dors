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

Then(/^I 'Completed' approved Assessment$/)do
  @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.complete_Approved_Assessment
end

Then (/^I load detailed view of 'Completed' Assessment$/)do
  find("#single-button").click                                            #clicking on  'Assessment status dropdown'
  check('assessmentStatusChk4')                                               #selecting Completed status#
  expect(page).to have_css(".assessment-status", text:'Completed')
  click_link_or_button("View Detail")                                          #clicking on 'View detail' link'
end

Then (/^I should see below information in view mode on 'Assessment Outcome' page$/)do |table|
  expect(page).to have_css("h1", text:'Assessment Outcome')
  expected_info = table.hashes.map{|x|x['information']}
  actual_info = @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.assessment_info.map{|x| x.value}
  expect(actual_info).to match_array(expected_info)
end


And (/^I select 'Completed' status from 'Assessment Status' dropdown$/)do
  find("#single-button").click                                            #clicking on  'Assessment status dropdown'
  check('assessmentStatusChk4')
end

Then (/^I load detailed view of 'Completed' Assessment from 'My Assessments' page$/)do
  expect(page).to have_css(".assessment-status", text:'Completed')
  click_link_or_button("View Details")

end

Then(/^I should see below information in view mode on 'My assessment details' page$/)do |table|
  expect(page).to have_css("h1", text:'My assessment details')
  expect(page).to have_css(".assessmentStatus", text:'Completed')
  expect(page).to have_css("h1", text:'Assessment Outcome')
  expected_info = table.hashes.map{|x|x['information']}
  actual_info = @trainers.view_cmpltd_assmnts_with_outcomes_notes_page.assessment_info.map{|x| x.value}
  expect(actual_info).to match_array(expected_info)


end