Then (/^I click on "([^"]*)" page$/)do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_button("REQUEST ASSESSMENT")
  end

Then(/^default view of the request assessments page is loaded$/)do
  expect(page).to have_css("h1",text: 'Request Assessment')
  expect(page).to have_css(".dors-well-other")
end


Then (/^I select "Requested" status from Assessment Status dropdown$/)do
  page.find("#single-button").click
  find("#assessmentStatusChk0").click
end

Then (/^I see requested assessments on My Assessments page$/)do
 expect(page).to have_css(".dors-well-other")
  find(".dors-well-other").count.eql?("")
end

Then (/^I should see the "([^"]*)" on summary view of request assessments$/)do
  expect(page).to have_css(".dors-well-other")
  within(".dors-well-other") do
    page.find(".assessment-id")
    expect(page).to have_text("Assessment ID")
  end
end