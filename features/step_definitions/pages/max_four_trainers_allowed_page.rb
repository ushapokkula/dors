class MaxFourTrainersAllowedPage< SitePrism::Page


  def verify_four_trainer_inclusion
    sleep 2
    find('div.dors-well > div:nth-child(8) > div  label > input').click
    page.all('.include-nearby-trainer-checkbox')[0].click
    page.all('.include-nearby-trainer-checkbox')[2].click
  end

  require 'tiny_tds'

  def verify_trainers_inclusion_per_request
     actual_licenses = [1,9,5]
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.active?
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
    result= client.execute("SELECT StatusId FROM [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      booked_status = row['StatusId']
      expect(booked_status).to be == 2
    end
  end

  def verify_status_requested
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    result= client.execute("SELECT StatusId FROM [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      booked_status = row['StatusId']
       expect(booked_status).to be == 1
    end
  end

  def verify_validationmsg_morethan_4_trianers

    find('div.dors-well > div:nth-child(8) > div  label > input').click
    page.all('.include-nearby-trainer-checkbox')[0].click
    page.all('.include-nearby-trainer-checkbox')[1].click
    page.all('.include-nearby-trainer-checkbox')[2].click
  end

  def verify_validation_more_trainers_on_course
    find('div.dors-well > div:nth-child(7) > div  label > input').click
    page.all('.include-nearby-trainer-checkbox')[0].click
    page.all('.include-nearby-trainer-checkbox')[2].click
    find('div.dors-well > div:nth-child(8) > div  label > input').click
  end

  def verify_validation_for_morethan_2_courses
    find('div.dors-well > div:nth-child(7) > div  label > input').click
    page.all('.include-nearby-trainer-checkbox')[0].click
    page.all('.include-nearby-trainer-checkbox')[2].click
  end

  def verify_assessment_with_2_courses_2_trainers
    find('div.dors-well > div:nth-child(7) > div  label > input').click
    page.all('.include-nearby-trainer-checkbox')[0].click
    page.all('.include-nearby-trainer-checkbox')[1].click
    sleep 5
  end
end