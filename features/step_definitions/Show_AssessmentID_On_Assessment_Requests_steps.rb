And (/^I request assessment$/) do
  @trainers.date_filter_on_assessment_management_page.request_assessments_without_nearby_course
end

Then (/^I select 'Requested' status from 'Assessment Status' dropdown$/) do
  expect(page).to have_css("h1", text: 'My assessments') #verifying header#
  page.find("#single-button", visible: true).click
  check('assessmentStatusChk0')
end

Then (/^I see "([^"]*)" assessments on 'My Assessments' page$/) do |status|
  expect(page).to have_css(".dors-well-other")
  expect(page).to have_css(".assessment-status", text: status)
end

Then (/^I should see the "([^"]*)" on summary view of assessment on 'My assessment' page$/) do |assessmentID|
  expect(page).to have_css(".dors-well-other")
  within(".dors-well-other") do
    expect(page).to have_css(".assessmentIdHeader", text: assessmentID, visible: true)
    expect(page).to have_css(".assessment-status", text: 'Requested')
  end
end

And (/^I click on "([^"]*)" button on 'My Assessments' page$/) do |view_details|
  click_link_or_button(view_details)
end

And (/^I should see "([^"]*)" on detailed view of assessment request$/) do |assessmentID|
  expect(page).to have_css("h1", text: 'Assessment Request') #Verifying header#
  expect(page).to have_css(".dors-table")
  within(".dors-table") do
    expect(page).to have_css(".assessmentIdHeader", text: assessmentID, visible: true)
    expect(page).to have_css(".assessmentStatus", text: 'Requested')
  end
end

And (/^I should see Assessment ID on summary view of assessment on 'Manage Assessments' page$/) do
  expect(page).to have_css("h1", text: 'Assessments') #Verifying header#
  page.find_all(".dors-table")
  within(".dors-table") do
    expect(page).to have_css(".link-assessment-id", visible: true)
  end
end

And (/^I click on "([^"]*)" button on 'Assessment management' page$/) do |button|
  expect(page).to have_css(".lnk-assessment-details", text: button)
  click_link_or_button('View Details')
end

Then (/^I should see "([^"]*)" on detailed view of an assessment request$/) do |assessmentID|
  expect(page).to have_css("h1", text: 'Assessment Request') #Verifying header#
  expect(page).to have_css(".dors-table")
  within(".dors-table") do
    expect(page).to have_css(".assessmentIdHeader", text: assessmentID, visible: true)
    expect(page).to have_css(".assessmentStatus", text: 'Requested')
  end
end


Then(/^I see assessor address is replaced by assessor number$/) do
 expect(page).to have_css(".assessorNumber", visible: true)
end

And(/^I search for "([^"]*)"$/) do |first_name|
  fill_in('txt-assessor-name', :with => first_name)
  expect(page).to have_css("#txt-assessor-name + ul li", visible: true)
  find("#txt-assessor-name + ul li", match: :first).click
end

And(/^I edit the assessor number to be blank$/) do
  unless find("#assessorNumber").value == ''
    fill_in("assessorNumber", :with => '')
  end
end

Then(/^I see in assessor section there is no assessor number displayed$/) do
  expect(page).to have_no_css(".assessorNumber", visible: true)
end

Then(/^I revert back the assessor number to "([^"]*)"$/) do |assessor_number|
 unless find("#assessorNumber").value != ''
    fill_in('assessorNumber', :with => assessor_number)
  end
end

And(/^I see the success message "([^"]*)" on the assessor page$/) do |message|
  sleep 3
  expect(page).to have_css(".toast-message", text: message)
end

And(/^I request assessment as "([^"]*)"$/) do |assessment_type|
  if assessment_type == "Booked"
    @trainers.ngu_search_assessment_id_page.search_booked_assessment_id
  else
    @trainers.ngu_search_assessment_id_page.search_requested_assessment_id
  end

end

And(/^I select assessment status depending on "([^"]*)" and "([^"]*)"$/) do |user, type|
  if (user == "Compliance Manager" && type == "Booked")
    find("#single-button").click
    expect(page).to have_css(".dropdown-menu", visible: true)
    find("#assessmentStatusChk1", visible: true).click
    end
  if (user == "Assessor3" && type == "Requested")
  find("#single-button").click
  expect(page).to have_css(".dropdown-menu", visible: true)
  find("#assessmentStatusChk0", visible: true).click
  end

end