class MaxFourTrainersAllowedPage< SitePrism::Page


  def verify_four_trainer_inclusion

    find(".include-main-trainer-checkbox", match: :first)
    all('.include-main-trainer-checkbox')[1].click
    find(".include-nearby-trainer-checkbox", match: :first)
   all('.include-nearby-trainer-checkbox')[1].click
    page.all('.include-nearby-trainer-checkbox')[2].click
  end

  require 'tiny_tds'

  def verify_trainers_inclusion_per_request
     actual_licenses = [279, 280, 281, 392]
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
     client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
      trainer_licenses=[]
    result= client.execute("SELECT TrainerLicenseId FROM [DORS_Classified].[dbo].[tbl_TrainerLicenseAssessment]")
    result.each do |row|
      license = row['TrainerLicenseId']
      trainer_licenses.push(license)
    end
     expect(trainer_licenses).to match_array(actual_licenses)
  end

  def verify_status_booked
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result= client.execute("SELECT StatusId FROM [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      booked_status = row['StatusId']
      expect(booked_status).to be == 2
    end
  end

  def verify_status_requested
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result= client.execute("SELECT StatusId FROM [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      booked_status = row['StatusId']
       expect(booked_status).to be == 1
    end
  end

  def verify_validationmsg_morethan_4_trianers

    find(".include-main-trainer-checkbox", match: :first)
    all('.include-main-trainer-checkbox')[0].click
    find(".include-nearby-trainer-checkbox", match: :first)
    all('.include-nearby-trainer-checkbox')[0].click
    all('.include-nearby-trainer-checkbox')[1].click
    all('.include-nearby-trainer-checkbox')[7].click
  end

  def verify_validation_more_trainers_on_course
    find(".include-main-trainer-checkbox", match: :first)
    all('.include-main-trainer-checkbox')[0].click
    find(".include-nearby-trainer-checkbox", match: :first)
    all('.include-nearby-trainer-checkbox')[0].click
    all('.include-nearby-trainer-checkbox')[2].click

  end

  def verify_validation_for_morethan_2_courses
    find(".include-main-trainer-checkbox", match: :first)
    all('.include-main-trainer-checkbox')[0].click
    find(".include-nearby-trainer-checkbox", match: :first)
    all('.include-nearby-trainer-checkbox')[0].click
    all('.include-nearby-trainer-checkbox')[3].click

  end

  def verify_assessment_with_2_courses_2_trainers
    find(".include-main-trainer-checkbox", match: :first)
    all('.include-main-trainer-checkbox')[0].click
    find(".include-nearby-trainer-checkbox", match: :first)
    all('.include-nearby-trainer-checkbox')[0].click
    all('.include-nearby-trainer-checkbox')[1].click

  end
end