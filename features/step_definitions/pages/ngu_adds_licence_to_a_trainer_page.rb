class NGUAddsLicenceToATrainerPage < SitePrism::Page



  def verify_default_expiry_date(days)
    actual_date = find("#licenseExpiryDate").value
    default_date = ((Date.today) + (days.to_i)).to_s
    expected_date = Date.parse(default_date).strftime("%d/%m/%Y")
    expect(actual_date).to eq(expected_date)
  end


end