class AssessorProfilePage < SitePrism::Page
  element    :first_name,    "#assessorFirstName"
  element    :last_name,      "#assessorLastName"
  element    :primary_phone,   "#assessorPhone"
  element    :secondary_phone, "#assessorSecondaryPhone"
  element    :email,             "#assessorEmail"
  element    :address,           "#assessorAddress"
  element    :town,              "#assessorTown"
  element    :postcode,           "#assessorPostcode"


def profile_details(new_table)
  columns = new_table.map { |x| x['Update Assessor Fields'] }
  for i in 1..columns.size
    expect(page).to have_content(columns[i])
  end
end


def verify_user_is_on_assessor_profile_page
  expect(page).to have_css("h1", "My profile")
  page.should have_css("#lnk-toggle-profile-details-form", text:'Profile details')
 puts find_field('assessorFirstName').value
  page.should have_css(:button,'Update')
  page.should have_css(:button, 'Cancel')
  puts "I am On Assessor Profile Page"
end


  def filling_all_fields_with_allowed_validation
    first_name.set Faker::Name.name
    last_name.set Faker::Name.name
    primary_phone.set Faker::PhoneNumber.numerify('0##########')
    secondary_phone.set Faker::PhoneNumber.numerify('0##########')
    email.set Faker::Internet.email
    address.set Faker::Address.city
    town.set Faker::Address.city
    fill_in('assessorPostcode', :with => @post_Code)
    town.set Faker::Address.city
  end

  def update_assessor_profile
    click_button('Update')
  end


  def validateAssessorfirstName(firstName)
    firstNameLength = firstName.length

    if (firstName.empty?)
      page.should have_css("p.help-block",text:'Please provide a first name.')
      puts 'firstName length not in Limit - Error message displayed'
    elsif(firstNameLength>50)
      expect(page).not_to have_css("p.help-block", text:'Please provide a first name.')
      page.find('first_name').value.length.should_be 50
      puts 'firstName Length Limit is 50 charachters - pass'
    end
  end


  def validateAssessorLastName(lastName)
    lastNameLength = lastName.length
    if (lastName.empty?)
      page.should have_css("p.help-block",text:'Please provide a last name.',visible: true)
      puts 'lastName length not in Limit - Error message displayed'
    elsif((lastNameLength>=1)&&(lastNameLength>=50))
   page.should_not have_css("p.help-block",text:'Please provide a last name.')
    elsif(lastNameLength>=51)
      page.should_not have_css("p.help-block",text:'Please provide a last name.')
      page.find('last_name').value.length.should.eq '50'
      puts 'lastName Length Limit is 50 charachters - pass'
    end
  end



  def validateAssessorPrimaryPhoneNumber(primaryPhoneNumber)
    primaryPhoneNumberLength = primaryPhoneNumber.length
    if (primaryPhoneNumber.empty?)
      page.should have_css("p.help-block",text:'Please provide a phone number.')
    elsif(primaryPhoneNumberLength<=9)                               #verify minim length#
      page.should have_css("p.help-block",text:'Sorry, the phone number must be at least 10 digits long.')
      page.find('primary_phone').value.length.should_be 10
      puts 'minlength is 10 - pass'
    elsif(primaryPhoneNumberLength>=10)
      page.should_not have_css("p.help-block",text:'Please provide a phone number.')
    elsif(primaryPhoneNumberLength>=51)                            #verify max length#
      page.should_not have_css("p.help-block",text:'Please provide a phone number.')
      page.find('primary_phone').value.length.should_be 50
      puts 'maxlength is 50 - pass'
    end
  end


  def validateAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
    secondaryPhoneNumberLength = secondaryPhoneNumber.length
    if (secondaryPhoneNumber.empty?)
      page.should_not have_css("p.help-block",text:'Please provide a phone number.')
    elsif(secondaryPhoneNumberLength<=9) #verify minim length#
      page.should have_css("p.help-block",text:'Sorry, the phone number must be at least 10 digits long.')
      page.find('secondary_phone').value.length.should_be 10
      puts 'minlength is 10 - pass'
    elsif(secondaryPhoneNumberLength>=10)
      page.should_not have_css("p.help-block",text:'Please provide a phone number.')
    elsif(secondaryPhoneNumberLength>=51)                            #verify max length#
      page.should_not have_css("p.help-block",text:'Please provide a phone number.')
      page.find('secondary_phone').value.length.should_be 50
      puts 'maxlength is 50 - pass'
    end
    end



 # def validateAssessorEmail(email)
    #x= email.match(/[A-Za-z0-9!#$%&'*+\/=?^_`{|}~.-]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,4}/)
    #(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)
    # (/[A-Za-z0-9!#$%&'*+\/=?^_`{|}~.-]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,4}/)
   # /^[A-Za-z0-9!#$%&'*+\/=?^_`{|}~.-]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,4})$/
   # p x
  #end


  def random_string(length)
  (0...length).map { (65+ rand(26)).chr }.join
  end



  def validateAssessorAddress
    address_string = address.set random_string(255)
    addressLength =  address_string.length
    if(addressLength>255)
      page.find('address').value.length.should_be 255
      puts 'Limit is 255 charachters - pass'
    end
    page.should have_xpath("//textarea[@rows='3']")  #Verifying default number of rows in Address textarea#
    end

  def validateAssessorEmail
    email_string = email.set random_string(255)
    emailLength = email_string.length
    if(emailLength>255)
      page.find('email').value.length.should_be 255
      puts 'Limit is 255 charachters - pass'
    end
  end

  def validateEmptyAdress
    if(address.empty?)
      page.should have_css("p.help-block",text:'Please provide an address.')
    end
  end

  def validateEmptyEmail
    if(email.empty?)
      page.should have_css("p.help-block",text:'Please provide an email address.')
    end
  end


  def validateAssessorTown(town)
    townLenght = town.length
    if (town.empty?)
      page.should have_content('Please provide a town.')
    elsif(townLenght>60)
      page.find('town').value.length.should_be 60
      puts 'Limit is 60 charachters - pass'
    end
    #y=town.match(/[ A-Za-z-,.;'&.()]/)
   # p y
  end


  def validateAssessorPostcode(postcode)
    postcodeLength = postcode.length
    if (postcode.empty?)
      page.should have_content('Please provide a postcode.')
    elsif(postcodeLength>10)
      page.find('postcode').value.length.should_be 10
      puts 'Limit is 10 charachters - pass'
   elsif
    z=postcode.match(/[ A-Za-z0-9]/)
      p z
  end

  #textarea_text = page.find(:css, 'textarea').text
  #first_letter = textarea_text[0]
  #first_letter.should == first_letter.capitalize
  #end

end

  end








