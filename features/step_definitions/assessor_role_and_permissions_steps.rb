Then(/^I see that I have access to "([^"]*)","([^"]*)","([^"]*)"$/) do |tab1, tab2, tab3|
  sleep 3
  page.has_link?(tab1, {}).should == true
  page.has_link?(tab2, {}).should == true
  page.has_link?(tab3, {}).should == true
end

And(/^I will be directed to My assessments page$/) do
  #TODO refactor reusable step
  page.has_content?("My assessments")
end

And(/^The page will show the list of assessments with status Approved$/) do
  click_link_or_button("MY ASSESSMENTS") # TODO seperate step
  @trainers.assessor_role_and_permissions_page.verify_assessments_list_with_status
end

And(/^I enter username "([^"]*)"$/) do |username|
  fill_in('txtemail', :with => username)
end

And(/^I enter password "([^"]*)"$/) do |password|
  fill_in('txtpassword', :with => password)
end

And(/^I request assessments to be booked$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  @trainers.ngu_search_assessment_id_page.book_assessment
  expect(page).to have_css(".alert.alert-success")
end

Then(/^The page will show the list of assessments "([^"]*)" requested$/) do |user|
  #TODO seperate steps
  click_link("MY ASSESSMENTS")
  expect(page).to have_css(".dors-well-other")
  find(:button, "View Details").click
  @trainers.assessor_role_and_permissions_page.verify_assessor_requested_assessments(user)

end

Then(/^I see that I have no access to "([^"]*)","([^"]*)"$/) do |tab1, tab2|
  expect(page).to have_no_link(tab1)
  expect(page).to have_no_link(tab2)
end
