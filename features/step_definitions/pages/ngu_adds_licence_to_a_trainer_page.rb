class NGUAddsLicenceToATrainerPage < SitePrism::Page
  elements :course_options, "a.ui-select-choices-row-inner > span"
  elements :labels,"form[name='TrainersVm.frmLicense'] label"



  def verify_default_expiry_date(days)
    actual_date = find("#licenseExpiryDate").value
    default_date = ((Date.today) + (days.to_i)).to_s
    expected_date = Date.parse(default_date).strftime("%d/%m/%Y")
    expect(actual_date).to eq(expected_date)
  end

  def verify_active_schemes
   expected_schemes = []
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result= client.execute("SELECT SchemeName FROM [DORS_Classified].[dbo].[tbl_Scheme] where EndDate >= GETDATE() OR EndDate is NULL")
    result.each do |row|
         @db_active_schemes = row['SchemeName']
         expected_schemes.push(@db_active_schemes)
    end
   actual_schemes1 = []
    course_options.each do |row|
        @schemes = row.text
        actual_schemes1.push(@schemes)
    end
   puts  actual_schemes1
  expect(actual_schemes1).to match_array(expected_schemes)
  end


  def verify_licence_section_labels(new_table)
    actual_labels =[]
    expected_labels = new_table.map { |x| x['Licence_section_fields'] }
    labels.each do |row|
      @labels1 = row.text
      actual_labels.push(@labels1)
    end
   expect(actual_labels).to match_array(expected_labels)
  end

end