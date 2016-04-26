class CreateTrainerRecordPage < SitePrism::Page
  #trainer fields
  element :username, "#trainerUsername"
  element :trainer_id, "#trainerNumber"
  element :trainer_first_name, "#trainerFirstName"
  element :trainer_last_name, "#trainerLastName"
  element :primary_phone, "#trainerPrimaryPhone"
  element :secondary_hone, "#trainerSecondaryPhone"
  element :email, "#trainerEmail"
  element :address, "#trainerAddress"
  element :town, "#trainerTown"
  element :postcode, "#trainerPostcode"
  element :known_as, "#trainerKnownAs"
  element :secondary_phone, "#trainerSecondaryPhone"
  element :is_instructor, "#trainerisInstructor"
  elements :licence_status, "#licenseStatuses > option"
  elements :licence_label, ".control-label"
  element :updateTrainer_button, "#btnCreateUpdateTrainer"
  element :expiry_date, "#licenseExpiryDate_0"


  def verify_trainer_record_details(new_table)
    columns = new_table.map { |x| x['Input Details'] }
    for i in 1..columns.size
      expect(page).to have_content(columns[i])
    end
  end

  def verify_mandatory_field_err_msgs(fields, error_msgs)
    username.set Faker::Name.name[4..70]
    trainer_id.set Faker::Number.number(6)
    trainer_first_name.set Faker::Name.name
    trainer_last_name.set Faker::Name.name
    primary_phone.set Faker::PhoneNumber.numerify('0##########')
    email.set Faker::Internet.email
    address.set Faker::Address.city
    town.set Faker::Address.city
    fill_in('trainerPostcode', :with => 'W14 8UD')
    fill_in(fields, :with => '')
    click_link_or_button("Create Trainer")
    expect(page).to have_content(error_msgs)
  end

  def verify_optional_fields_on_trainer_form(optional_field)

    username.set Faker::Name.name[4..70]
    trainer_id.set Faker::Number.number(6)
    trainer_first_name.set Faker::Name.name
    trainer_last_name.set Faker::Name.name
    known_as.set Faker::Name.name
    primary_phone.set Faker::PhoneNumber.numerify('0##########')
    secondary_phone.set Faker::PhoneNumber.numerify('0##########')
    email.set Faker::Internet.email
    address.set Faker::Address.city
    town.set Faker::Address.city
    fill_in('trainerPostcode', :with => 'W14 8UD')
    fill_in(optional_field, :with => '')
    # uncheck('trainerisInstructor')
     click_link_or_button("Create Trainer")
    expect(page).not_to have_css(".help-block")
    expect(page).to have_content("New trainer successfully created.")
  end

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

end

