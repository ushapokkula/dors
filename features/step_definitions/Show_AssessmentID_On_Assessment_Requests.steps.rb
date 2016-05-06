And(/^I click on "([^"]*)"$/)do|button_link|
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_link_or_button(button_link)
  end

Then(/^default view of the request assessments page is loaded$/)do
  expect(page).to have_css("h1", text: 'Request Assessment')
  expect(page).to have_css(".dors-table")
end

And (/^I request assessment$/)do
  @trainers.date_filter_on_assessment_management_page.request_assessments_without_nearby_course
  expect(page).to have_css(".alert.alert-success", text:'The assessment has been Requested')
end

Then (/^I select 'Requested' status from Assessment Status dropdown$/)do
  expect(page).to have_css("h1", text: 'My assessments')
  page.find("#single-button").click
  check('assessmentStatusChk0')
end

Then (/^I see requested assessments on My Assessments page$/)do
 expect(page).to have_css(".dors-well-other")
 page.find_all('.dors-well-other').count.eql?("")
end

Then (/^I should see the "([^"]*)" on summary view of assessment requests on My assessment page$/)do|assesmentID|
  expect(page).to have_css(".dors-well-other")
  within(".dors-well-other") do
    expect(page).to have_text(assesmentID)
    expect(page).to have_css(".assessment-id", visible:true)
  end
end

And (/^I click on "([^"]*)" button on My assessments page$/)do |view_details|
  click_link_or_button(view_details)
end

Then (/^I should see "([^"]*)" page$/)do |my_assesment_page|
  expect(page).to have_css("h1", text: my_assesment_page)
end

And (/^I should see "([^"]*)" on detailed view of assessment request$/)do |assessmentID|
expect(page).to have_css(".dors-table")
within(".dors-table") do
  expect(page).to have_text(assessmentID)
  expect(page).to have_css(".assessmentIdHeader", visible:true)
  end
end

And (/^I should see "([^"]*)" on summary view of assessment requests on Manage Assessments page$/)do |assessmentID|
  expect(page).to have_css(".dors-table")
  within(".dors-table") do
    expect(page).to have_text(assessmentID)
    expect(page).to have_css(".text-md", visible:true)
  end
end

And (/^I click on "([^"]*)" button on Assessment management page$/)do|view_details|
  click_link_or_button(view_details)
end

Then (/^I should see "([^"]*)" on detailed view of an assessment request$/)do |assesmentID|
  expect(page).to have_css(".dors-table")
  within(".dors-table") do
    expect(page).to have_text(assesmentID)
    expect(page).to have_css(".assessmentIdHeader", visible:true)
  end
end
