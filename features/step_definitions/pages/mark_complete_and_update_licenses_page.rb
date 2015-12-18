class MarkCompleteAndUpdateLicensesPage < SitePrism::Page


  def verify_completed_status
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      license_status = row['StatusId']
      license_status.eql?(4)
    end
  end


  def verify_license_action_note_competent(outcome1, outcome2)

    select(outcome1, :from => 'status-FSB422')

    select(outcome2, :from => 'status-DOA123')

    select(outcome1, :from => 'status-CIA624')

  end

  def verify_license_status_for_absent_cancelled
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    #assessment_dates=client.execute("select cast(AssessmentDate as Date) as AssessmentDate from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result = client.execute("select ExpiryDate from [DORS_Classified].[dbo].[tbl_TrainerLicense] where LicenseCode IN ('DOA123','CIA624','FSB421')")
    result.each do |row|
      dates = row['ExpiryDate']
     expect((dates.between?('2016-07-01','2017-01-01'))).to be false
    end
  end


  def visibility_of_trainers
    expect(page).to have_content('DOA123')
    expect(page).to have_content('CIA624')
    expect(page).to have_content('FSB422')
  end

  def verify_license_status_for_actionnote_competent
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    #assessment_dates=client.execute("select cast(AssessmentDate as Date) as AssessmentDate from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result = client.execute("select ExpiryDate from [DORS_Classified].[dbo].[tbl_TrainerLicense] where LicenseCode IN ('DOA123','CIA624','FSB421')")
    result.each do |row|
      dates = row['ExpiryDate']

    end
  end
end