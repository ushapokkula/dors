class AutoAuthoriseAssessmentRequestPage < SitePrism::Page
  element :include_checkbox, "#include-other-trainer"
  elements :trainer_details, ".dors-well-container.ng-scope"
  elements :pick_a_slot, ".btn.btn-primary"



  def navigate_assessment_request_summary_page
    find('a', text: "REQUEST ASSESSMENT").click
    find(:button, 'Pick a slot', match: :first)
    all(".btn.btn-primary:nth-child(2)")[2].click
    find(:button, 'Request Assessment', match: :first).click
  end

  def validate_and_check_include_box
    find(".include-main-trainer-checkbox", match: :first)
    all('.include-main-trainer-checkbox')[0].click
    find(".include-nearby-trainer-checkbox", match: :first)
    all('.include-nearby-trainer-checkbox')[1].click
  end

  require 'tiny_tds'
  def check_status_in_DB
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      assessment_status = row['StatusId']
      expect(assessment_status).to be == 2
    end
  end


  def verify_list_of_trainers_not_related_to_assessor
    page.find_all('linked_force_area_name')
    find_all('span.ui-select-match-close')[0].click
    page.find_all(('linked_force_area_name')[0],text:'GREATER MANCHESTER POLICE')
  end


  def verify_defalut_preselected_forcearea
    if page.find_all(('linked_force_area_name')[0], text: 'GREATER MANCHESTER POLICE')
    find_all('span.ui-select-match-close')[0].click
    click_link_or_button('REQUEST ASSESSMENT')
    page.find_all(('linked_force_area_name')[0], text: 'GREATER MANCHESTER POLICE')
    page.all(:css,".dors-table").count == 1
    page.should have_css(".trainer-licenseCode", text: '268721/001')
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