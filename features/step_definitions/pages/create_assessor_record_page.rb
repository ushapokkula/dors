class CreateAssessorRecordPage < SitePrism::Page
  elements :mandatory_fields, ".form-group.has-error"
  element :username, "#assessorUsername"
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

  def verify_mandatory_field_err_msgs(fields, error_msgs)
    #username.set Faker::Name.name
    #username.set random_string(7)
    #fill_in('assessorUsername', :with=>'gswapna')
    fill_in('assessorFirstName', :with=>'swapna')
    fill_in('assessorLastName', :with=>'gopu')
    fill_in('assessorPhone', :with=>'0753333222')
    fill_in('assessorEmail', :with=>'swapna@gmail.com')
    fill_in('assessorAddress', :with=>'1 high street')
    fill_in('assessorTown', :with=>'Hounslow')
    fill_in('assessorPostcode', :with=>'TW5 7GH')
    fill_in(fields, :with=>'')
    click_link_or_button("Create Assessor")
    expect(page).to have_content(error_msgs)
  end

  def verify_optional_fields(optional_field)
    username.set random_string(70)
    fill_in('assessorFirstName', :with=>'swapna')
    fill_in('assessorLastName', :with=>'gopu')
    fill_in('assessorPhone', :with=>'0753333222')
    fill_in('assessorEmail', :with=>'swapna@gmail.com')
    fill_in('assessorAddress', :with=>'1 high street')
    fill_in('assessorTown', :with=>'Hounslow')
    fill_in('assessorPostcode', :with=>'TW5 7GH')
    fill_in('assessorNumber', :with=>'111111')
    fill_in('assessorSecondaryPhone', :with=>'07811111111')
    fill_in('assessorSecondaryEmail',:with=>'roopa.ramisetty@wtg.co.uk')
    fill_in('assessorForceAreas', :with=>'pol')
    random_selector(forcearea_list)
    fill_in(optional_field, :with=>'')
    click_link_or_button("Create Assessor")
    expect(page).not_to have_css("p.help-block")
  end

  def random_selector(x)
    size = x.count
    x[rand(1...size)].select_option
  end

  def random_string(x)
    #string = ([*('A'..'Z'),*('0'..'9'),]+ %w(- _ )).sample(x).join
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
    string = (0..x).map {chars.sample}.join
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

  def validateAssessorUsername(username)
    usernameLength = username.length
     puts "#{username}"
    if (username.empty?)
      page.should have_css("p.help-block",text:'Please provide a username.')
    elsif(usernameLength<4)
      page.should have_css("p.help-block",text:'Please provide a username.')
      page.find("#assessorUsername").value.length.should.eq '4'
    elsif((usernameLength>=4)&&(usernameLength<=70))
      page.should_not have_css("p.help-block",text:'Please provide a username.')
    elsif(usernameLength>=71)
      page.find("#assessorUsername").value.length.should.eq '70'
      end
  end

  def validateAssessorNumber(assessorNumber)
    assessorNumberLength = assessorNumber.length
    if (assessorNumber.empty?)
      puts "Ok, Assessor number is optional"
    elsif (assessorNumberLength>=20)
      page.find("#assessorNumber").value.length.should.eq '20'
    end
  end

  def selectForceAreas(forceareas)
    fill_in('assessorForceAreas', :with=> forceareas)
  end

  def createAssessor()
    click_button('Create Assessor')
  end

  def fillinUserName(username)
    fill_in('assessorUsername', :with=> username)
  end

  def fillinNumber(assessorNumber)
    fill_in('assessorNumber', :with=> assessorNumber)
  end

  def fillinAssessorfirstName(firstName)
    fill_in('assessorFirstName', :with=> firstName)
  end

  def fillinAssessorlastName(lastName)
    fill_in('assessorLastName', :with=> lastName)
  end

  def fillinAssessorprimaryPhoneNumber(primaryPhoneNumber)
    fill_in('assessorPhone', :with=> primaryPhoneNumber)
  end

  def fillinAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
    fill_in('assessorSecondaryPhone', :with=> secondaryPhoneNumber)
  end

  def fillinAssessorprimaryEmail(primaryEmail)
    fill_in('assessorEmail', :with=> primaryEmail)
  end

  def fillinAssessorsecondaryEmail(secondaryEmail)
    fill_in('assessorSecondaryEmail', :with=> secondaryEmail)
  end

  def fillinAssessoraddress(address)
    fill_in('assessorAddress', :with=> address)
  end

  def fillinAssessortown(town)
    fill_in('assessorTown', :with=> town)
  end

  def fillinAssessorpostcode(postcode)
    fill_in('assessorPostcode', :with=> postcode)
  end

end
