class ConfigureBookTimeWindowPage < SitePrism::Page
  element :sign_out_link, "#btn-signout"



  def verify_time_window_field_acceptance
    fill_in('assessmentsWindow', :with => '200')
    $entered_numeric_value = find("#assessmentsWindow").value
    expect($entered_numeric_value).to be == '200'
    fill_in('assessmentsWindow', :with => 'ABC')
    entered_char_Value = find("#assessmentsWindow").value
    expect(entered_char_Value).to be == ""
  end

  def verify_no_user_is_signed_in

    if has_sign_out_link?
      sign_out_link.click
    end
  end


  def verify_time_window_preferences_in_DB
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.active?
    result= client.execute("SELECT AssessmentBookingWindowDays FROM  [DORS_Classified].[dbo].[tbl_TrainerWebSiteSettings]")
    result.each do |row|
      configured_days_in_DB = row['AssessmentBookingWindowDays']
      expect(configured_days_in_DB).to be == ($configured_days.to_i)
    end
  end

  def verify_trainer_licenses_on_summarypage(count)

  end

end