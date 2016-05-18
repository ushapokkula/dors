And(/^I have loaded my profile page to view profile data with the following fields$/) do |table|
  new_table = table.hashes
  @trainers.assessor_profile_page.view_or_update_profile_details(new_table)
end

Then (/^the system will load the page where I can update assessor record$/)do
  @trainers.assessor_profile_page.verify_user_is_on_assessor_profile_page
  fill_in('assessorFirstName', :with=> 'test')
end

When (/^I click Cancel button on profile page$/)do
  fill_in('assessorFirstName', :with=> 'test')
  click_button('Cancel')
end

And(/^I will be redirected to "MY ASSESSMENTS" page$/)do
  expect(page).to have_css("h1", text: "My assessments")
end

Then (/^unsaved changes will be lost$/)do
click_link_or_button('MY PROFILE')
  find_field('assessorFirstName').value.should_not eql?("test")   #Verify edited first name value is there or not#
end