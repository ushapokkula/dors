class EditOrUpdateTrainerRecordPage < SitePrism::Page
  elements :licence_status_options, "#licenseStatuses option"
  elements :course_name_label, ".control-label"
  element :updateTrainer_button, "#btnCreateUpdateTrainer"
  element :expiry_date, "#licenseExpiryDate_0"
  element :search_trainer_field, '#txt-trainer-name'
  element :trainer_first_name, '#trainerFirstName'
  element :trainer_last_name, '#trainerLastName'
  element :license_status_drpdwn, "#licenseStatuses"


  def verify_editable_fields_of_trainer_licences
    find("#licenseStatuses_0").click
    find("#licenseStatuses_0").set("full")
    find("#licenseExpiryDate_0").click
    find("#licenseExpiryDate_0").set("23/10/20")
  end


  def update_diff_licence_status_with_expiry_date(status, date)
    page.find("#licenseStatuses_2").click
    page.find("#licenseStatuses_2").set(status)
    page.find("#licenseExpiryDate_2").set(date)
    page.find("#licenseStatuses_3").click
    page.find("#licenseStatuses_3").set(status)
    page.find("#licenseExpiryDate_3").set(date)
  end

  def update_filling_welsh_details(welshChar)
    page.fill_in('trainerFirstName', :with => welshChar)
    page.fill_in('trainerLastName', :with => welshChar)
    page.fill_in('trainerAddress', :with => welshChar)
    page.fill_in('trainerTown', :with => welshChar)
    sleep 5
  end




end
