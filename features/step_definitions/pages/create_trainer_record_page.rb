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
  element :create_trainer_button, "#btnCreateUpdateTrainer"
  element :update_trainer_button, "#btnCreateUpdateTrainer"
  element :add_licence_button, "#btnAddLicense"
  #element :course_dropdown, "#courseNames"
  #element :licence_status, "#licenseStatuses"
  #element :licence_expiry_date, "#licenseExpiryDate"
  element :select_course_name, "#courseNames > option:nth-child(2)"
  element :select_licence_name, "#licenseStatuses > option:nth-child(2)"
  element :expiry_date, "#licenseExpiryDate"
  elements :error_messages, ".help-block p"




  def verify_trainer_record_details(new_table)
    columns = new_table.map { |x| x['Input Details'] }
    for i in 1..columns.size
      expect(page).to have_content(columns[i])
    end
  end

  def verify_mandatory_fields_err_msgs(fields, error_msgs)
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
   page.find("#trainerisInstructor").click
    #check('trainerisInstructor')
    expect(page).not_to have_css(".help-block")
     click_link_or_button("Create Trainer")
    expect(page).to have_css(".toast.toast-success", text: 'New trainer successfully created.')
  end


  def filling_trainer_details
    username.set Faker::Name.name[4..70]
    trainer_id.set Faker::Number.number(6)
    trainer_first_name.set Faker::Name.name
    trainer_last_name.set Faker::Name.name
    primary_phone.set Faker::PhoneNumber.numerify('0##########')
    email.set Faker::Internet.email
    address.set Faker::Address.city
    town.set Faker::Address.city
    fill_in('trainerPostcode', :with => "W14 8UD")
  end

end



