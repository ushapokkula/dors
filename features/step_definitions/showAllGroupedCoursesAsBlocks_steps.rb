And(/^I will be shown list of all assessments i requested as seperate blocks$/)do
  expect(page).to have_css("h1" ,text: "My Assessments")
  @trainers.show_all_grouped_courses_as_blocks_page.verify_display_of_assessments_as_blocks
end

And(/^multiple courses under each assessment are displayed as blocks$/)do
  @trainers.show_all_grouped_courses_as_blocks_page.verify_display_of_courses_As_blocks
end

And(/^One or two trainers are displayed under each course$/)do
  expect(page).to have_css("h1" ,text: "My Assessments")
  @trainers.show_all_grouped_courses_as_blocks_page.verify_display_of_trianers_under_course
end