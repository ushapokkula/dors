class NguSearchAssessmentIDPage < SitePrism::Page
  elements :outcome_dropdowns, :css, ".dors-well-other select"
  elements :outcome_dropdowns_primary, ".dors-well select"
  elements :assessments_list, ".dors-table"
  elements :trainer_licenses, ".trainer-licenseCode"


  require 'tiny_tds'

  def search_booked_assessment_id
    delete_assessments_from_DB
    verify_booked_assessmemt_id_in_DB
    book_assessment
    expect(page).to have_css(".alert.alert-success")
    verify_booked_assessmemt_id_in_DB
  end

  def search_requested_assessment_id
    delete_assessments_from_DB
    verify_requested_assessmemt_id_in_DB
    request_assessment
    expect(page).to have_css(".alert.alert-success")
    verify_requested_assessmemt_id_in_DB
  end

  require 'tiny_tds'

  def verify_booked_assessmemt_id_in_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select TrainingAssessmentId from [DORS_Classified].[dbo].[tbl_TrainingAssessment] where StatusId = '2'")
    result.each do |row|
      $booked_status=row['TrainingAssessmentId']
    end
  end


  def verify_requested_assessmemt_id_in_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select TrainingAssessmentId from [DORS_Classified].[dbo].[tbl_TrainingAssessment] where StatusId = '1'")
    result.each do |row|
      $requested_status=row['TrainingAssessmentId']
    end
  end

  def verify_requested_assessment_status_in_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select StatusId from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      $assessment_status = row['StatusId']

    end
  end

  def delete_assessments_from_DB

    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    client.execute("DELETE FROM [DORS_Classified].[dbo].[tbl_TrainerLicenseAssessment]")
    client.execute("DELETE FROM [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
  end

   def book_assessment
    find('a', text: "REQUEST ASSESSMENT").click
    find(:button, 'Pick a slot', match: :first).click
    find(:button, 'Request Assessment', match: :first).click
    find(".include-main-trainer-checkbox", match: :first).click
    all('.include-nearby-trainer-checkbox',visible:true)[3].click
    click_button("Submit")

  end

  def request_assessment
    click_link_or_button("REQUEST ASSESSMENT")
    find(:button, 'Pick a slot', match: :first).click if find(:button, 'Pick a slot', match: :first)
    first(:button, 'Request Assessment').click if find(:button, 'Request Assessment', match: :first)
    expect(page).to have_selector(".include-nearby-trainer-checkbox")
    find(".include-nearby-trainer-checkbox", match: :first)
    all('.include-nearby-trainer-checkbox')[1].click
    fill_in('mileage', :with => '500')
    click_link_or_button("Submit")
  end

  def verify_assessment_outcome_details(new_table)
    columns = new_table.map { |x| x['Details'] }
    for i in 1..columns.size
      expect(page).to have_content(columns[i])
    end
  end

  def select_outcome
    select("Absent", :from => 'status-281')

    select("Absent", :from => 'status-279')

    select("Absent", :from => 'status-392')
  end

  def assessor_availability
    actual_licenses=[]
    trainer_licenses.each do |row|
      licenses= row.text
      actual_licenses.push(licenses)

    puts expect(actual_licenses).to include("111333")
    puts expect(actual_licenses).to include("111222")
    puts expect(actual_licenses).to include("111999")
  end

end
end
