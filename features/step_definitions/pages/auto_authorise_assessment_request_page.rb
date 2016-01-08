class AutoAuthoriseAssessmentRequestPage < SitePrism::Page
  element :include_checkbox, "#include-other-trainer"
  elements :trainer_details, ".dors-well-container.ng-scope"



  def navigate_assessment_request_summary_page
    click_link_or_button("REQUEST ASSESSMENT")
    sleep 3
    first(:button, 'Pick a slot').click
    sleep 2
    $primary_trianer=page.all('.ng-binding')[0].text
    first(:button, 'Request Assessment').click
  end

  def validate_and_check_include_box
    sleep 2
    page.all('.ng-pristine.ng-valid')[1].click
    page.all('.ng-pristine.ng-valid')[3].click
  end

  require 'tiny_tds'
  def check_status_in_DB
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      assessment_status = row['StatusId']
     puts  expect(assessment_status).to be == 2
    end
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