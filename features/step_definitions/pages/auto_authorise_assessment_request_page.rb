class AutoAuthoriseAssessmentRequestPage < SitePrism::Page
  element :include_checkbox, "#include-other-trainer"
  elements :trainer_details, ".dors-well-container.ng-scope"
  elements :linked_force_area_name, ".selectedForceAreaFilter"
  elements :expiry_dates, ".license-expiry-date"

  def navigate_to_request_summary_page
    click_link_or_button("REQUEST ASSESSMENT")

  end


  def navigate_assessment_request_summary_page
    click_link_or_button("REQUEST ASSESSMENT")
    find(:button, 'Pick a slot', match: :first).click
    $primary_trianer=page.all('.ng-binding')[0].text
    find(:button, 'Request Assessment', match: :first).click
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


  def verify_force_area_linked_to_assessor
    page.find_all(('linked_force_area_name')[0],text: 'METROPOLITAN POLICE')
    if (page.find("#assessmentExpiringIntro", text: 'Trainer licenses expiring within the next 365 days:'))
    expect(page).to have_css('.dors-table', count: 1)
    expect(page).to have_css(".trainer-licenseCode", text: '525252/002')
    else
      page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 1000 days:')
     expect(page).to have_css(".dors-table")
    end

    if(page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 365 days:'))
      page.all(".dors-table").count == 1
    page.should have_css(".trainer-licenseCode", text: '525252/002')
    else
      page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 1000 days:')
      expect(page).to have_css(".dors-table")
    end
    if(page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 365 days:'))
     page.all(".dors-table").count > 1
     page.should have_css(".trainer-licenseCode", text: '525252/002')
    else
      page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 1000 days:')
      expect(page).to have_css(".dors-table")
     #find_all(".dors-table")[1].should have_css(('expiry_dates')[1])
     #page.find_all('expiry_dates')[0]< ('expiry_dates')[1]
    end
    if(page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 365 days:'))
     page.should have_css(".alert.alert-info",text: 'No assessments available to book.')
     page.all(".dors-table").count == 0
    else
      page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 1000 days:')
      page.should have_css(".alert.alert-info",text: 'No assessments available to book.')
      expect(page).to have_css(".dors-table")

    if(page.should have_css("#assessmentExpiringIntro",text: 'Trainer licenses expiring within the next 1000 days:'))
    page.all(".dors-table")>1
    end
    end
    end


  def verify_defalut_preselected_forcearea
    if(page.find_all(('linked_force_area_name')[0], text: 'METROPOLITAN POLICE'))
    find_all('span.ui-select-match-close')[0].click
    click_link_or_button('REQUEST ASSESSMENT')
    page.find_all(('linked_force_area_name')[0], text: 'METROPOLITAN POLICE')
    page.all(:css,".dors-table").count == 1
    page.should have_css(".trainer-licenseCode", text: '525252/002')
    end
    if(page.find_all('linked_force_area_name')[0].should_not have_text('METROPOLITAN POLICE'))

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