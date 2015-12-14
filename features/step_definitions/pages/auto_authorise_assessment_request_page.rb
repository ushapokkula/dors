class AutoAuthoriseAssessmentRequestPage < SitePrism::Page
  element :include_checkbox, "#include-other-trainer"
  elements :trainer_details, ".dors-well-container.ng-scope"



  def navigate_assessment_request_summary_page
    click_link_or_button("REQUEST ASSESSMENT")
    sleep 3
    page.all('.btn.btn-default')[1].click
    sleep 2
    $primary_trianer=page.all('.ng-binding')[0].text
    puts $primary_trianer
    page.all('.btn.btn-default')[0].click
  end

  def validate_and_check_include_box
    check('Include')
  end


  def primary_trainer_include_bydefault
    trainer_details1=[]
    trainer_details.each do |x|
      puts (x[0].text)
    end
    puts trainer_details
  end

  def verify_trainer_and_course_details
    for i in 1..5
      puts page.has_xpath?("html/body/div[1]/div[2]/div/div[1]/div[6]/div/div[#{i}]")
    end
  end
end