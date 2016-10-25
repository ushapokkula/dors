Then(/^I see that I have access to "([^"]*)","([^"]*)","([^"]*)"$/) do |tab1, tab2, tab3|
  expect(page).to have_link(tab1)
  expect(page).to have_link(tab2)
  expect(page).to have_link(tab3)
end

And(/^The page will show the list of assessments with status Approved$/) do
  @trainers.assessor_role_and_permissions_page.verify_assessments_list_with_status
end

And(/^I see the success message for requested assessment with date and assessment ID$/)do
  expect(page).to have_css(".alert.alert-success")
end

And(/^I see the message "([^"]*)" for assessment requested$/)do |message|
  expect(page).to have_css(".alert.alert-success", text: message)
end

And(/^I enter username "([^"]*)"$/) do |username|
  @trainers.trainer_login_page.verify_no_user_is_signed_in
  fill_in('txtemail', :with => username)
end

And(/^I enter password "([^"]*)"$/) do |password|
  fill_in('txtpassword', :with => password)
end

And(/^I request assessments to be booked$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
end

When(/^I click View Details button for the assessment$/)do
  expect(page).to have_css("h1", text: "My Assessments")
  expect(page).to have_css(".dors-well-other")
  find(:button, "View Details" , match: :first).click
end

Then(/^The page will show the list of assessments "([^"]*)" requested$/) do |user|
  @trainers.assessor_role_and_permissions_page.verify_assessor_requested_assessments(user)
end

Then(/^I see that I have no access to "([^"]*)","([^"]*)"$/) do |tab1, tab2|
  expect(page).to have_no_link(tab1)
  expect(page).to have_no_link(tab2)
end
