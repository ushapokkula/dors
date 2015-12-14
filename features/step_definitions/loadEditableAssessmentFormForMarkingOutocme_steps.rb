Given(/^I have received assessment form from the Assessor with details of their assessment results$/) do

end

Then(/^I will be shown editable mode to mark outcomes against each trainer$/) do
 # @trainers.assessment_form_for_marking_outcome_page.verify_editable_mode
  expect(page.has_select?('#status-SWAP123', :options => ['Absent'])).to be true
  # page.has_select?('#status-SWAP123', :options => ['Absent','Action Note','Cancelled','Competent','Compliance Notes']).should be true
end
