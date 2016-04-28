class EditOrUpdateTrainerRecordPage < SitePrism::Page
  elements :licence_status, "#licenseStatuses > option"
  elements :licence_label, ".control-label"
  element :updateTrainer_button, "#btnCreateUpdateTrainer"
  element :expiry_date, "#licenseExpiryDate_0"
  element :search_trainer_field, "//input[@id='txt-trainer-name']"
  element :search_trainer, '#txt-trainer-name'
  element :trainer_first_name, '#trainerFirstName'
  element :trainer_last_name, '#trainerLastName'
  elements :license_status_options,"#licenseStatuses option"

  def verify_editable_fields_of_trainer_licences
    find("#licenseStatuses_0").click
    find("#licenseStatuses_0").set("full")
    find("#licenseExpiryDate_0").click
    find("#licenseExpiryDate_0").set("23/10/20")
  end



  def verify_default_trainer_licence_details
    find("#courseNames").text == "Course name"
    find("#licenseStatuses").text == "Licence status"
    find("#licenseExpiryDate").text == "Expiry Date"
  end

  def update_diff_licence_status_with_expiry_date(status, date)
    page.find("#licenseStatuses_2").click
    page.find("#licenseStatuses_2").set(status)
    page.find("#licenseExpiryDate_2").set(date)
    page.find("#licenseStatuses_3").click
    page.find("#licenseStatuses_3").set(status)
    page.find("#licenseExpiryDate_3").set(date)
  end


end