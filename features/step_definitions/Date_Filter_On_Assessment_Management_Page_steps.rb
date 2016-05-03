And(/^default view of the page is loaded$/) do
  #@trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_link("ASSESSMENT MANAGEMENT")
  expect(page).to have_content("There are no assessments to display.")
end


Then (/^Assessments sorted by nearest date first$/)do

end