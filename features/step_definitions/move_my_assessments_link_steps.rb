And(/^I verify that the My Assessments link is before Request Assessment in the navbar$/) do
  #actual_text = page.find("ul.nav li:nth-child(2)").text
  expect(page).to have_selector("h1", text: 'My assessments')
  @trainers.move_my_assessments_link_page.verify_my_assessments_link
end