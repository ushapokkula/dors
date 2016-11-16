class MarkCompleteAndUpdateLicensesPage < SitePrism::Page


  def verify_completed_status
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      license_status = row['StatusId']
      license_status.eql?(4)
    end
  end

  # def verify_provisional_status
  #   client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
  #   result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
  #   result.each do |row|
  #     license_status = row['StatusId']
  #     license_status.eql?(2)
  #   end
  # end

  def verify_provisional_status
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      license_status = row['StatusId']
      license_status.eql?(2)
    end
  end


  def verify_license_action_note_competent(outcome1)
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    $actual_date = client.execute("SELECT  tbl_Course.CourseDateTime FROM tbl_Course INNER JOIN tbl_CourseTrainer ON tbl_Course.CourseID = tbl_CourseTrainer.CourseId WHERE (tbl_CourseTrainer.TrainerId = 6)")

    select(outcome1, :from => 'status-281')

    select(outcome1, :from => 'status-279')

    #select(outcome1, :from => 'status-392')

  end

  def verify_license_status_for_absent_cancelled
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select ExpiryDate from [DORS_Classified].[dbo].[tbl_TrainerLicense] where LicenseCode IN ('DOA123','CIA624','SWAP124')")
    #date_range = "SELECT ExpiryDate FROM  tbl_TrainerLicense where ExpiryDate > DATEADD(dd, 180, GETDATE())  and ExpiryDate < DATEADD(dd, 365, GETDATE())"
    result.each do |row|
      dates = row['ExpiryDate']
     expect((dates.between?((Date.today + 180).to_s,(Date.today + 500).to_s))).to be false
    end
  end


  def visibility_of_trainers
     expect(page).to have_content('111333')
     expect(page).to have_content('111222')
  end

  def verify_license_status_for_actionnote_competent
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    #assessment_dates=client.execute("select cast(AssessmentDate as Date) as AssessmentDate from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result = client.execute("select ExpiryDate from [DORS_Classified].[dbo].[tbl_TrainerLicense] where LicenseCode IN ('DOA123','CIA624','FSB421')")
    result.each do |row|
     # dates = row['ExpiryDate']

    end
  end

  def verify_renew_180_days
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    changed_date = client.execute("SELECT  tbl_Course.CourseDateTime FROM tbl_Course INNER JOIN tbl_CourseTrainer ON tbl_Course.CourseID = tbl_CourseTrainer.CourseId WHERE (tbl_CourseTrainer.TrainerId = 6)")
    expect(changed_date.to_s).to be eql(($actual_date.to_s)+180)
    #client.execute("UPDATE [dbo].[tbl_Course] set  CourseDateTime = changed_date  where CourseDateTime = '2016-02-21 11:00:00.000'")


  end
end