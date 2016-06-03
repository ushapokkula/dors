class ConfigureBookTimeWindowPage < SitePrism::Page
  element :sign_out_link, "#btn-signout"
  elements :nearby_expiry_dates, ".nearBy-license-expirydate"
  elements :main_license_expiry_date, ".main-license-expirydate"


  def verify_time_window_field_acceptance
    fill_in('assessmentsWindow', :with => '200')
    $entered_numeric_value = find("#assessmentsWindow").value
    expect($entered_numeric_value).to be == '200'
    fill_in('assessmentsWindow', :with => 'ABC')
    entered_char_Value = find("#assessmentsWindow").value
    expect(entered_char_Value).to be == ""
  end

  def verify_time_window_preferences_in_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.active?
    result= client.execute("SELECT AssessmentBookingWindowDays FROM  [DORS_Classified].[dbo].[tbl_TrainerWebSiteSettings]")
    result.each do |row|
      configured_days_in_DB = row['AssessmentBookingWindowDays']
      expect(configured_days_in_DB).to be == ($configured_days.to_i)
    end
  end

  def verify_trainer_licenses_on_summarypage(count)
    main_license_expiry_date.each do |date|
      today_date = Date.today.to_s
      configured_date = Date.today + count.to_i
      range = (today_date..configured_date.to_s)
      expected_date=Date.parse(date.text).strftime("%Y-%m-%d")
      range.include?(expected_date)
    end

    nearby_expiry_dates.each do |date|
      today_date = Date.today.to_s
      configured_date = Date.today + count.to_i
      range = (today_date..configured_date.to_s)
      expected_date=Date.parse(date.text).strftime("%Y-%m-%d")
      range.include?(expected_date)
    end
  end

end