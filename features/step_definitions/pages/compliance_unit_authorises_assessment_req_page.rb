class ComplianceUnitAuthorisesAssessmentReqPage < SitePrism::Page
  elements :trainer_licenses, ".trainer-licenseCode"

  def verify_visibility_of_approve_button(button)
    expect(page.all('.dors-table').count).to be >=1
    expect(page).to have_button(button, visible: true)


  end

  def verify_approved_status_in_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      status=row['StatusId']
      expect(status).to be == 2
    end
  end

  def verify_trainers_after_approve
    actual_trainer_licenses= []
    trainer_licenses.each do |row|
      trainer_list = row.text
      actual_trainer_licenses.push(trainer_list)
    end
     expect(actual_trainer_licenses).not_to include("111333/001")
     expect(actual_trainer_licenses).not_to include("111222/001")
  end


end