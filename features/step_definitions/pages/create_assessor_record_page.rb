class CreateAssessorRecordPage < SitePrism::Page

  elements :mandatory_fields, ".form-group.has-error"
  element :username, "#assessorUsername"
  element :assessor_number, "#assessorNumber"
  element :firstname, "#assessorFirstName"
  element :lastname, "#assessorLastName"
  element :primary_phone_number, "#assessorPhone"
  element :secondary_phone_number, "#assessorSecondaryPhone"
  element :email, "#assessorEmail"
  element :address, "#assessorAddress"
  element :town, "#assessorTown"
  element :postcode, "#assessorPostcode"
  element :force_area, "#assessorForceAreas"
  elements :forcearea_list, "#assessorForceAreas + ul li "
  elements :assessor_input_fields, "label.control-label"

  def verify_assessor_record_details(new_table)
    columns = new_table.map { |x| x['Input Details'] }
    for i in 1..columns.size
      expect(page).to have_content(columns[i])
    end
  end

  def verify_assessor_mandatory_fields(new_table)
    expect(page.all(".form-group.has-error").count).to be == 8
  end

  def verify_mandatory_assessor_field_err_msgs(fields)
    username.set random_string(7)
    fill_in('assessorFirstName', :with => 'swapna')
    fill_in('assessorLastName', :with => 'gopu')
    fill_in('assessorPhone', :with => '0753333222')
    fill_in('assessorEmail', :with => 'swapna@gmail.com')
    fill_in('assessorAddress', :with => '1 high street')
    fill_in('assessorTown', :with => 'Hounslow')
    fill_in('assessorPostcode', :with => 'TW5 7GH')
    fill_in(fields, :with => '')
    click_link_or_button("Create Assessor")
  end

  def verify_optional_fields(optional_field)

    username.set random_string(7)
    fill_in('assessorFirstName', :with => 'swapna')
    fill_in('assessorLastName', :with => 'gopu')
    fill_in('assessorPhone', :with => '0753333222')
    fill_in('assessorEmail', :with => 'swapna@gmail.com')
    fill_in('assessorAddress', :with => '1 high street')
    fill_in('assessorTown', :with => 'Hounslow')
    fill_in('assessorPostcode', :with => 'TW5 7GH')
    fill_in('assessorNumber', :with => '111111')
    fill_in('assessorSecondaryPhone', :with => '07811111111')
    fill_in('assessorSecondaryEmail', :with => 'swapna@gmail.com')
    fill_in('assessorForceAreas', :with => 'pol')
    random_selector(forcearea_list)
    fill_in(optional_field, :with => '')
    click_link_or_button("Create Assessor")
  end

  def fill_create_assessor_fields
    username.set random_string(7)
    assessor_number.set Faker::Number.number(6)
    firstname.set Faker::Name.name
    lastname.set Faker::Name.name
    primary_phone_number.set Faker::PhoneNumber.numerify('0##########')
    secondary_phone_number.set Faker::PhoneNumber.numerify('0##########')
    email.set 'Swapna.Gopu@wtg.co.uk'
    address.set Faker::Address.city
    town.set Faker::Address.city
    postcode.set 'W14 8UD'
    $username_value = find("#assessorUsername").value
    $email_value= find("#assessorEmail").value
    #random_selector(forcearea_list)

  end

  def random_selector(x)
    size = x.count
    x[rand(1...size)].select_option
  end

  def random_string(x)
    #string = ([*('A'..'Z'),*('0'..'9'),]+ %w(- _ )).sample(x).join
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
    string = (0..x).map { chars.sample }.join
  end

  def verify_order_of_assessor_input_fields(new_table)
    fields=[], assessor_fields=[]
    assessor_input_fields.each do |input_fields|
      fields = input_fields.text
      assessor_fields.push(fields)
    end
    expect(new_table.map { |x| x['Assessor Input Fields'] }).to match_array(assessor_fields)
  end

  def isAssessorCreatePage()
    should have_content('Assessors management')
    should have_content('Create New Assessor')
    find_button('Create Assessor')
    puts "Yes I am on Create assessor page"
  end

  def clickOnCancelButton()
    click_button('Cancel')
  end

  def isYourHomePage()
    should have_content('Assessments')
  end

  def validateUsername(username)

    result = false
    usernameLength = username.length
    result = has_content?("Sorry, the username is already taken. Please try a different username.")
    puts "#{username}"
    # if (username.eql? nil)

    if (username.empty?)
      should have_content("Please provide a username.")


    elsif ((usernameLength<=3)&&(usernameLength>=1))

      should have_content('Sorry, the username must be at least 4 characters long.')

    elsif (usernameLength>=71)

      should have_content('Sorry, the username must not be more than 70 characters long.')

    elsif (result.eql? true)

      # TO DO - Check this username already there in DB to make sure validation message is correct
      puts "The account already exists"
    end
  end

  def validateAssessorNumber(assessorNumber)

    if (assessorNumber.empty?)

      puts "Ok, Assessor number is optional"

    else
      assessorNumberLength = assessorNumber.length

      if (assessorNumberLength>=9)

        should have_content('Something wrong with the Assessor number input- May be length is more than allowed!!')

      end

    end

  end

  def validatefirstName(firstName)

    firstNameLength = firstName.length

    if (firstName.empty?)

      find('Please provide a first name.')

    elsif (firstNameLength<=3)
      #TO-DO check with the length validation as it is not yet implemented
      should have_content('Sorry, the first name must be at least 4 characters long.')

      #TO-DO check with the length validation as it is not yet implemented
    elsif (firstNameLength>=21)
      should have_content('Sorry, the first name must not be more than 20 characters long.')
    end

  end

  def validateLastName(lastName)

    lastNameLength = lastName.length

    if (lastName.empty?)
      find('Please provide a last name.')
    elsif (lastNameLength<=3)
      #TO-DO check with the length validation as it is not yet implemented
      should have_content('Sorry, the last name must be at least 4 characters long.')

      #TO-DO check with the length validation as it is not yet implemented
    elsif (lastNameLength>=21)
      should have_content('Sorry, the last name must not be more than 20 characters long.')
    end

  end

  def validatePrimaryPhoneNumber(primaryPhoneNumber)

    primaryPhoneNumberLength = primaryPhoneNumber.length

    if (primaryPhoneNumber.empty?)

      should have_content('Please provide a phone number.')

    elsif (primaryPhoneNumberLength<=9)

      should have_content('Sorry, the phone number must be at least 10 digits long.')

    elsif (primaryPhoneNumber[0]!= '0')

      should have_content('Sorry, the phone number must start with zero')

    elsif ((primaryPhoneNumber.to_i).is_a?(Numeric).eql? false)
      should have_content('Sorry, only numbers are accepted.')
    end

  end

  def validatesecondaryPhoneNumber(secondaryPhoneNumber)

    secondaryPhoneNumberLength = secondaryPhoneNumber.length

    if (secondaryPhoneNumber.empty?)

      should have_content('Please provide a phone number.')

    elsif (secondaryPhoneNumberLength<=9)

      should have_content('Sorry, the phone number must be at least 10 digits long.')

    elsif (secondaryPhoneNumber[0]!= '0')

      should have_content('Sorry, the phone number must start with zero')

    elsif ((secondaryPhoneNumber.to_i).is_a?(Numeric).eql? false)
      should have_content('Sorry, only numbers are accepted.')
    end

  end

  def validateEmail(email)

    x= email.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)

    p x

  end


  def validateAddress(address)

    if (address.empty?)

      should have_content('Please provide an address.')

    end

  end

  def validateTown(town)

    if (town.empty?)

      should have_content('Please provide a town.')

    end

  end


  def validatePostcode(postcode)


    if (postcode.empty?)

      should have_content('Please provide a postcode.')

    end


  end

  def selectForceAreas(forceareas)

    fill_in('assessorForceAreas', :with => forceareas)
    # select(forceareas, :from => 'typeahead-512-9634-option-0')
    # select('typeahead-512-9634-option-0', :from => 'assessorForceAreas')
  end

  def createAssessor()

    click_button('Create Assessor')

  end

  def fillinUserName(username1)
    #username.set random_string(7)
    fill_in('assessorUsername', :with=> username)

  end

  def fillinassessorNumber(assessorNumber)

    fill_in('assessorNumber', :with => assessorNumber)

  end

  def fillinfirstName(firstName)

    fill_in('assessorFirstName', :with => firstName)

  end

  def fillinlastName(lastName)

    fill_in('assessorLastName', :with => lastName)

  end

  def fillinprimaryPhoneNumber(primaryPhoneNumber)

    fill_in('assessorPhone', :with => primaryPhoneNumber)

  end

  def fillinsecondaryPhoneNumber(secondaryPhoneNumber)

    fill_in('assessorSecondaryPhone', :with => secondaryPhoneNumber)

  end

  def fillinemail(email)

    fill_in('assessorEmail', :with => email)

  end

  def fillinaddress(address)

    fill_in('assessorAddress', :with => address)

  end

  def fillintown(town)

    fill_in('assessorTown', :with => town)

  end

  def fillinpostcode(postcode)

    fill_in('assessorPostcode', :with => postcode)

  end

  def email_generation(subject, body)
    visit "https://mail.wtg.co.uk/owa"
    verify_no_user_logged_in
    fill_in('username', :with => 'swapna.gopu')
    fill_in('password', :with => 'sudiv143!')
    find(".signinTxt").click
    find(:xpath, ".//span[text()='DORS Test']", match: :first).click
    expect(page).to have_css(".rpHighlightAllClass.rpHighlightSubjectClass", text: subject)
    expect(page).to have_xpath("//*[@id='Item.MessageUniqueBody']", :text => body)
    expect(page).to have_xpath(".//*[@id='Item.MessageUniqueBody']//a", visible: true)
    find(:button, 'Swapna Gopu').click
    find(".button._hl_2._hl_e._hl_i").text == $email_value
    end


  def validate_nonce
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select Nonce from [DORS_Classified].[dbo].[tbl_SentEmail] where ActiveDirectoryUsername="+"'"+ $username_value+"'")
    result.each do |row|
      $nonce = row['Nonce']
    end
    #expect($nonce).to include(find(:xpath,".//*[@id='Item.MessageUniqueBody']//a").text)
  end

  def verify_48_hours_validity
    actual_date = find(:xpath,".//*[@id='ItemHeader.DateReceivedLabel']").text
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select SentDate,NonceValidUntilDate from [DORS_Classified].[dbo].[tbl_SentEmail] where Nonce ="+"'"+$nonce+"'")
    result.each do |row|
      $send_date = row['SentDate']
      $valid_until_date = row['NonceValidUntilDate']
    end
     expect($valid_until_date).to be == ($send_date+172800)
  end

  def verify_no_user_logged_in
    if (page.has_css?(".button._hl_2._hl_e._hl_i"))
      find(:button, 'Swapna Gopu').click
      find(:xpath, ".//span[text()='Sign out']", match: :first).click
    end
  end

  end
