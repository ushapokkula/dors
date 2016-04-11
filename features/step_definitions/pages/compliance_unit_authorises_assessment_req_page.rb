class ComplianceUnitAuthorisesAssessmentReqPage < SitePrism::Page
  elements :expiry_dates, ".trainer-licenseCode"

  def verify_visibility_of_approve_button
    expect(page.all(".btn.btn-sm.btn-primary").count).to be > 0
  end

  def verify_approved_status_in_DB
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      status=row['StatusId']
      expect(status).to be == 2
    end
  end

  def verify_trainers_after_approve
    sleep 2
    expiry_dates1= []
    expiry_dates.each do |row|
      expiry_dates_list = row.text
      expiry_dates1.push(expiry_dates_list)
    end
     expect(expiry_dates1).not_to include("DOA123")
     expect(expiry_dates1).not_to include("CIA624")

  end
end