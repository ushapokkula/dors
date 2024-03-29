class ShowAllGroupedCoursesAsBlocksPage < SitePrism::Page
  elements :assessment_blocks, ".dors-well-other"
  elements :courses_blocks, ".dors-well-container"


  def verify_display_of_assessments_as_blocks
    assessment_blocks.each do |assessment_block|
      expect(assessment_block.visible?).to be true
      expect(page.all(".dors-well-other").count).to be > 0
    end
  end

  def verify_display_of_courses_As_blocks
    courses_blocks.each do |course_block|
      expect(course_block.visible?).to be true
      expect(page.all(".dors-well-container").count).to be > 0
    end
  end


  def verify_display_of_trianers_under_course
    courses_blocks.each do |course_block|
      expect(page.all(".my-assessments-count").count).to be > 0
    end

  end

end