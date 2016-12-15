class CreateTrainerRecordPage < SitePrism::Page
  #trainer fields
  element :username, "#trainerUsername"
  element :trainer_id, "#trainerNumber"
  element :trainer_first_name, "#trainerFirstName"
  element :trainer_last_name, "#trainerLastName"
  element :primary_phone, "#trainerPrimaryPhone"
  element :secondary_hone, "#trainerSecondaryPhone"
  element :primary_email, "#trainerEmail"
  element :secondary_email, "#trainerSecondaryEmail"
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
  elements :select_course_name, ".ui-select-choices-row-inner"
  element :select_licence_name, "#licenseStatuses > option:nth-child(2)"
  element :expiry_date, "#licenseExpiryDate"
  elements :error_messages, ".help-block p"
  elements :course_details, ".form-control.selected-license-course"



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
    primary_email.set Faker::Internet.email
    address.set Faker::Address.city
    town.set Faker::Address.city
    fill_in('trainerPostcode', :with => 'W14 8UD')
    fill_in(fields, :with => '')
    click_link_or_button("Create Trainer")
    expect(page).to have_content(error_msgs)
  end

  def verify_optional_fields_on_trainer_form(optional_field)
    username.set random_string(7)
    fill_trainer_id
    trainer_first_name.set Faker::Name.name
    trainer_last_name.set Faker::Name.name
    known_as.set Faker::Name.name
    primary_phone.set Faker::PhoneNumber.numerify('0##########')
    secondary_phone.set Faker::PhoneNumber.numerify('0##########')
    page.find('#trainerSecondaryPhone').native.send_keys(:enter)
    primary_email.set Faker::Internet.email
    secondary_email.set Faker::Internet.email
    page.find('#trainerSecondaryEmail').native.send_keys(:enter)
    address.set Faker::Address.city
    town.set Faker::Address.city
    fill_in('trainerPostcode', :with => 'W14 8UD')
    page.find("#trainerisInstructor", visible: true).click
    fill_in(optional_field, :with => '')
    expect(page).not_to have_css("p.help-block")
    click_link_or_button("Create Trainer")
    expect(page).to have_css(".toast.toast-success", text: 'New trainer successfully created.')
  end


  def filling_trainer_details
    username.set random_string(7)
    fill_trainer_id
    trainer_first_name.set Faker::Name.name
    trainer_last_name.set Faker::Name.name
    primary_phone.set Faker::PhoneNumber.numerify('0##########')
    primary_email.set "dors_test@outlook.com"
    secondary_email.set Faker::Internet.email
    address.set Faker::Address.city
    town.set Faker::Address.city
    fill_in('trainerPostcode', :with => "W14 8UD")
    store("username", username.value)
    store("email", primary_email.value)
    store("trainer_id", trainer_id.value)
  end

  def fill_trainer_id      # fill with new trainer id if already exists
    trainer_id.set Faker::Number.numerify('17####')
    first(".panel-body").click
    # trainer_first_name.click
    x = false
    unless x
      if page.has_css?(".form-group.has-error p", text: 'Sorry, the trainer id already exist. Please try a different trainer id.', wait: 5)
        trainer_id.set Faker::Number.numerify('17####')
      end
      x = true if page.has_content?('Sorry, the trainer id already exist. Please try a different trainer id.',wait: 2)
    end
  end




  def verify_fullname_updated_time_stamp(trainer_id)
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("SELECT TOP (1) change.ChangeDate,
                             changeUser.ActiveDirectoryUsername 'changed by username',
                             changeUser.Forename + ' ' + changeUser.Surname AS 'Changed by'
                             FROM tbl_trainer tr
                             join tbl_user trainerUser on trainerUser.UserId = tr.UserId
                             join tbl_UserLicenseAgreementChange change on change.UserId = trainerUser.UserId
                             join tbl_user changeUser on changeUser.UserId = change.ChangedByUserId
                             WHERE tr.TrainerRef =" + trainer_id +
                             "ORDER BY change.UserLicenseAgreementChangeId DESC")
    result.each do |row|
      fullname = row['Changed by']
      time_stamp = row['ChangeDate']
      username = row['changed by username']
      date = (time_stamp.to_s).split(" ")
      updated_date = Date.parse(date[0]).strftime("%d-%b-%Y")
      store("user_full_name",fullname)
      store("changed_time_stamp",updated_date)
      store("changed_by_username",username)
  end

  end

  def verify_updated_phone_no_in_db
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("SELECT PrimaryTelephone FROM [DORS_Classified].[dbo].[tbl_Trainer] where TrainerRef = '111222'")
    result. each do |row|
      @updated_record_in_db = row['PrimaryTelephone']
    end
  end

  def verify_licence_format
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("SELECT tbl_TrainerLicense.LicenseCode, tbl_Trainer.TrainerRef, tbl_Trainer.TrainerId
                            FROM  [DORS_Classified].[dbo].tbl_Trainer INNER JOIN
                            tbl_TrainerLicense ON tbl_Trainer.TrainerId = tbl_TrainerLicense.TrainerId
                            WHERE tbl_Trainer.TrainerRef="+fetch("trainer_id"))
    result.each do |row|
      $licence_code = row['LicenseCode']
      trainer_ref = row['TrainerRef']
    end
  end


  def verify_duplicate_licences_for_same_course
    unique_courses=[]
    course_details.each do |courses|
      unique_courses.push(courses.value)
    end
    expect(unique_courses).to match_array(unique_courses.uniq)
  end


end





