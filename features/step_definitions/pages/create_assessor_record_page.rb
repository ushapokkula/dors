class CreateAssessorRecordPage < SitePrism::Page

  elements :mandatory_fields, ".form-group.has-error"
  element :username, "#assessorUsername"
  element :assessor_number, "#assessorNumber"
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
  element :password, "#password"
  element :currentpassword, "#currentPassword"


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
    #random_selector(forcearea_list)
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
    email.set 'dors_test@outlook.com'
    address.set Faker::Address.city
    town.set Faker::Address.city
    postcode.set 'W14 8UD'
    store("username", username.value)
    store("email", email.value)
    #random_selector(forcearea_list)

  end

  def verify_signup_mandatory_fields(fields)
    fill_in('username', :with => fetch("username"))
    fill_in('email', :with => fetch("email"))
    fill_in('password', :with => 'P@ssw0rd1')
    fill_in('passwordConfirm', :with => 'P@ssw0rd1')
    fill_in(fields, :with => '')
  end

  def random_selector(x)
    size = x.count
    x[rand(1...size)].select_option
  end

  def random_string(x)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
    string = (0..x).map { chars.sample }.join
  end

  def alpha_numeric(length=21)
    chars = [*('A'..'Z'), *('a'..'z'), *(0..9)]
    (0..length).map { chars.sample }.join
  end


  def password_length_validation(x)
    password.set random_password_string(x)
  end

  def random_password_string(x)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]-%w(""%^(){}[];:><)+%w(~!@#$%&*_-+=\,.?/|))
    string = (1..x).map { chars.sample }.join
  end


  def random_new_password_string(x)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(""%^(){}[];:><)-%w(~!@#$%&*_-+=\,.?/|))
    string = (1..x).map { chars.sample }.join
  end

  def verify_order_of_assessor_input_fields(new_table)
    fields=[], assessor_fields=[]
    assessor_input_fields.each do |input_fields|
      fields = input_fields.text
      assessor_fields.push(fields)
    end
     expect(new_table.map { |x| x['Assessor Input Fields'] }).to match_array(assessor_fields)
    expect(new_table.map { |x| x['Assessor Input Fields'] }).to match_array(assessor_fields)
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

  def validateAssessorUsername(username)
    usernameLength = username.length
    if (username.empty?)
      page.should have_css("p.help-block", text: 'Please provide a username.')
    elsif (usernameLength<4)
      page.should have_css("p.help-block", text: 'Sorry, the username must be at least 4 characters long.')
      page.find("#assessorUsername").value.length.should.eq '4'
    elsif ((usernameLength>=4)&&(usernameLength<=70))
      page.should have_css("p.help-block", text: 'Sorry, the username can only contain numbers, letters, dashes and underscores.')
    elsif (usernameLength>=71)
      page.find("#assessorUsername").value.length.should.eq '70'
    end
  end


  def validateUserNameMaxCHARS
    username_string = username.set random_string(71)
    usernameLenght = username_string.length
    if (usernameLenght>70)
      page.find("#assessorUsername").value.length.should.eq '70'
      puts 'Limit is 70 charachters'
    end

  end


  def validateAssessorNumber(assessorNumber)
    assessorNumberLength = assessorNumber.length
    if (assessorNumber.empty?)
      puts "Ok, Assessor number is optional"
    elsif ((assessorNumberLength>=1)&& (assessorNumberLength<=20))
      page.should_not have_css("p.help-block", text: 'Sorry, only numbers and letters are accepted.')
      page.find("#assessorNumber").value.length.should.eq '20'
    end

  end

  def validateAssessorNumberMaxCHARS
    assessorNumber_string = assessor_number.set alpha_numeric
    assessorNumberLength = assessorNumber_string.length
    if (assessorNumberLength>20)
      page.find("#assessorNumber").value.length.should.eq '20'
      puts 'Limit is 20 charachters'
    end
  end


  def selectForceAreas(forceareas)
    fill_in('assessorForceAreas', :with => forceareas)
  end

  def createAssessor()
    click_button('Create Assessor')
  end

  def fillinUserName(username)
    fill_in('assessorUsername', :with => username)
  end

  def fillinNumber(assessorNumber)
    fill_in('assessorNumber', :with => assessorNumber)
  end

  def fillinAssessorfirstName(firstName)
    fill_in('assessorFirstName', :with => firstName)
  end

  def fillinAssessorlastName(lastName)
    fill_in('assessorLastName', :with => lastName)
  end

  def fillinAssessorprimaryPhoneNumber(primaryPhoneNumber)
    fill_in('assessorPhone', :with => primaryPhoneNumber)
  end

  def fillinAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
    fill_in('assessorSecondaryPhone', :with => secondaryPhoneNumber)
  end

  def fillinAssessorprimaryEmail(primaryEmail)
    fill_in('assessorEmail', :with => primaryEmail)
  end

  def fillinAssessorsecondaryEmail(secondaryEmail)
    fill_in('assessorSecondaryEmail', :with => secondaryEmail)
  end

  def fillinAssessoraddress(address)
    fill_in('assessorAddress', :with => address)
  end

  def fillinAssessortown(town)
    fill_in('assessorTown', :with => town)
  end

  def fillinAssessorpostcode(postcode)
    fill_in('assessorPostcode', :with => postcode)
  end

  def email_generation(subject, body)
    login_to_outlook
    sleep 30
    find(:xpath, ".//span[text()='DORS Test']", match: :first).click
    expect(page).to have_css(".rpHighlightAllClass.rpHighlightSubjectClass", text: subject)
    expect(page).to have_xpath("//*[@id='Item.MessageUniqueBody']", :text => body)
    #expect(page).to have_xpath(".//*[@id='Item.MessageUniqueBody']//a", visible: true)    #expect(page).to have_xpath(".//*[@id='Item.MessageUniqueBody']//a", visible: true)
  end

  def delete_outlook_emails
    visit "https://outlook.live.com/owa/"
    unless page.has_css?("[aria-label='Open menu']", wait: 4)
      find("input[type='email']").set("dors_test@outlook.com")
      find("[name='passwd']").set("dorstest123")
      find("[value='Sign in']").click
    end
    expect(page).to have_css("#O365_MainLink_Settings") # settings css
    size = page.all(:xpath, ".//*[@autoid='_lvv2_9']/div").size
    if size > 10
      find("[autoid='_n_h']").hover
      find("[title='Select everything in this folder']").click
      find("[title='Delete (Del)']").click
       find(:xpath, ".//span[text()='OK']").click
    elsif size < 10 && size > 0
      find("[autoid='_n_h']").hover
      find("[title='Select everything in this folder']").click
      find("[title='Delete (Del)']").click
      find(:xpath, ".//span[text()='OK']").click
    end
    find("[aria-label='Open menu']").click
    find(:xpath, ".//*[text()='Sign out']").click
  end


  def login_to_outlook
    visit "https://outlook.live.com/owa/"
    unless page.has_css?("[aria-label='Open menu']", wait: 8)
      find("input[type='email']").set("dors_test@outlook.com")
      find("[name='passwd']").set("dorstest123")
      find("[value='Sign in']").click
    end
    expect(page).to have_css("[aria-label='Open menu']")
  end

  def verify_email_generation
    login_to_outlook
    sleep 30
    find(:xpath, ".//span[text()='DORS Test']", match: :first).click
    expect(page).to have_css(".rpHighlightAllClass.rpHighlightSubjectClass")
    expect(page).to have_xpath("//*[@id='Item.MessageUniqueBody']")
    #expect(page).to have_xpath(".//*[@id='Item.MessageUniqueBody']//a", visible: true)
  end

  def validate_nonce
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("select Nonce from [DORS_Classified].[dbo].[tbl_SentEmail] where ActiveDirectoryUsername ="+"'"+fetch("username")+"'")
    result.each do |row|
      $nonce = row['Nonce']
    end
    actual_nonce = find(:xpath, ".//*[@id='Item.MessageUniqueBody']//a").text
    split_link = actual_nonce.split("/")
    expected_nonce = split_link[(split_link.length)-1]
    expect($nonce).to eq(expected_nonce)
  end

  def verify_48_hours_validity
    actual_date = find(:xpath, ".//*[@id='ItemHeader.DateReceivedLabel']").text
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
    if page.has_css?(".button._n_m2", wait: 5)
      find("[aria-label='Open menu']").click
      find(:xpath, ".//span[text()='Sign out']", match: :first).click
    end

  end

   #@DR-738#
  def verify_no_change_password_email_received(subject)
    login_to_outlook
    #sleep 30
    expect(page).to have_no_css(".rpHighlightAllClass.rpHighlightSubjectClass", text: subject)
  end


end