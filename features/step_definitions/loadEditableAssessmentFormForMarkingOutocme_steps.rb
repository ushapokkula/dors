Given(/^I have received assessment form from the Assessor with details of their assessment results$/) do

end

And(/^I will be shown editable mode with following outcomes against each trainer$/) do |table|
  new_table=table.hashes
@trainers.assessment_form_for_marking_outcome_page.verify_outcomes(new_table)
end

And(/^I will be able to mark outcome for each trainer$/)do
  @trainers.assessment_form_for_marking_outcome_page.verify_ability_to_mark_outcome
end

And(/^I will be to view "Compliance Notes" against each trainer$/)do
  @trainers.assessment_form_for_marking_outcome_page.verify_compliance_notes
end

When(/^I select possible outcome against each trainer$/) do
  @trainers.assessment_form_for_marking_outcome_page.select_outcome_against_trainer
end

Then(/^The button Mark Complete will be activated and displayed$/) do
  find_button("Mark Complete").visible?
end

