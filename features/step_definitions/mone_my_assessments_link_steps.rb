And(/^I verify that the My Assessments link is before Request Assessment in the navbar$/) do
  #actual_text = page.find("ul.nav li:nth-child(2)").text
  @trainers.move_my_assessments_link_page.verify_my_assessments_link
end