And (/^I request assessment$/)do
  @trainers.date_filter_on_assessment_management_page.request_assessments_without_nearby_course
end

Then (/^I select 'Requested' status from 'Assessment Status' dropdown$/)do
  expect(page).to have_css("h1", text: 'My assessments')      #verifying header#
  page.find("#single-button", visible: true).click
  check('assessmentStatusChk0')
end

Then (/^I see "([^"]*)" assessments on 'My Assessments' page$/)do|status|
 expect(page).to have_css(".dors-well-other")
 expect(page).to have_css(".assessment-status", text:status)
end

Then (/^I should see the "([^"]*)" on summary view of assessment on 'My assessment' page$/)do|assessmentID|
  expect(page).to have_css(".dors-well-other")
  within(".dors-well-other") do
    expect(page).to have_css(".assessmentIdHeader", text:assessmentID, visible:true)
    expect(page).to have_css(".assessment-status",text: 'Requested')
  end
end

And (/^I click on "([^"]*)" button on 'My assessments' page$/)do |view_details|
  click_link_or_button(view_details)
end

And (/^I should see "([^"]*)" on detailed view of assessment request$/)do |assessmentID|
  expect(page).to have_css("h1", text: 'Assessment Request')            #Verifying header#
   expect(page).to have_css(".dors-table")
 within(".dors-table") do
  expect(page).to have_css(".assessmentIdHeader",text:assessmentID, visible:true)
  expect(page).to have_css(".assessmentStatus",text: 'Requested')
  end
end

And (/^I should see Assessment ID on summary view of assessment on 'Manage Assessments' page$/)do
  expect(page).to have_css("h1", text:'Assessments')    #Verifying header#
  page.find_all(".dors-table")
  within(".dors-table") do
    expect(page).to have_css(".dors-table-row.row.dors-table-header > div.col-md-1 > a", visible:true)

  end
end

And (/^I click on "([^"]*)" button on 'Assessment management' page$/)do|button|
  expect(page).to have_css(".dors-table-header > div.col-md-3 > a", text:button)
  click_link_or_button('View Details')
end

Then (/^I should see "([^"]*)" on detailed view of an assessment request$/)do |assessmentID|
  expect(page).to have_css("h1",text: 'Assessment Request')     #Verifying header#
  expect(page).to have_css(".dors-table")
  within(".dors-table") do
    expect(page).to have_css(".assessmentIdHeader", text: assessmentID ,visible:true)
    expect(page).to have_css(".assessmentStatus",text: 'Requested')
  end
end


Then(/^I see assessor address is replaced by assessor number$/) do
  expect(page).to have_css("", visible:true)
end

And(/^I search for "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  pending
end

And(/^I edit the assessor number to be blank$/) do
  pending
end

Then(/^I see in assessor section there is no assessor number displayed\.$/) do

end

Then(/^I revert back the assessor number to "([^"]*)"$/) do |assessor_number|
 fill_in('assessorNumber' , :with=> assessor_number)
end