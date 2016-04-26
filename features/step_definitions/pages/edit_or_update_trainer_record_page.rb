 class EditOrUpdateTrainerRecordPage < SitePrism::Page
  elements :licence_status, "#licenseStatuses > option"
  elements :licence_label, ".control-label"
  element :updateTrainer_button, "#btnCreateUpdateTrainer"
  element :expiry_date, "#licenseExpiryDate_0"

  def verify_editable_fields_of_trainer_licences
    find("#licenseStatuses_0").click
    find("#licenseStatuses_0").set("full")
    find("#licenseExpiryDate_0").click
    find("#licenseExpiryDate_0").set("23/10/20")
  end

  def verify_default_licence_fields(new_table)
    licence_fields = [], status =[]
    page.has_css?("#licenseStatuses")
    find("#licenseStatuses").text == "Licence status"
    find("#licenseStatuses").click
    expect(page).to have_css("#licenseStatuses > option")
    licence_status.each do |values|
      status  = values.text
      licence_fields.push(status)
    end
    puts licence_fields
    expect( new_table.map { |x| x['Licence Status']})

  end


  def verify_default_trainer_licence_details
    find("#courseNames").text == "Course name"
    find("#licenseStatuses").text == "Licence status"
    find("#licenseExpiryDate").text == "Expiry Date"
  end

  def update_diff_licence_status_with_expiry_date(status,date)
    page.find("#licenseStatuses_2").click
    page.find("#licenseStatuses_2").set(status)
    page.find("#licenseExpiryDate_2").set(date)
    page.find("#licenseStatuses_3").click
    page.find("#licenseStatuses_3").set(status)
    page.find("#licenseExpiryDate_3").set(date)
  end


   def searching_exisisting_trainer_name_in_trainer_search_field(chars)
     fill_in("txt-trainer-name", :with=> chars)
     find("#txt-trainer-name").send_keys(:enter)
   end
end