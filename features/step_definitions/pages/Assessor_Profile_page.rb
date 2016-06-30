class AssessorProfilePage < SitePrism::Page

  element    :first_name,    "#assessorFirstName"
  element    :last_name,      "#assessorLastName"
  element    :primary_phone,   "#assessorPhone"
  element    :secondary_phone, "#assessorSecondaryPhone"
  element    :primary_email,    "#assessorEmail"
  element    :secondary_email,   "#assessorSecondaryEmail"
  element    :assessor_address,   "#assessorAddress"
  element    :assessor_town,     "#assessorTown"
  element    :assessor_postcode,   "#assessorPostcode"
  elements   :validation_requirement_messages, "p.help-block"
  elements   :highlighted_fields,   ".has-error"


def profile_details(new_table)
  columns = new_table.map { |x| x['Update Assessor Fields'] }
  for i in 1..columns.size
    expect(page).to have_content(columns[i])
  end
end


def verify_highlighted_fields
  page.find_all('highlighted_fields', visible:true)
end

def verify_user_is_on_assessor_profile_page
  expect(page).to have_css("h1", text: 'My profile')
  page.should have_css("#lnk-toggle-profile-details-form", text:'Profile details')
  page.should have_css(:button, text: 'Update')
  page.should have_css(:button, text: 'Cancel')
<<<<<<< HEAD
  puts "I am On Assessor Profile Page"
=======
  puts "Yes, I am On Assessor Profile Page"
>>>>>>> b3f916ec9aa75d72ef79f91812c6d4168c00c3c8
end


  def update_assessor_profile
    click_button('Update')
  end


  def validateAssessorfirstName(firstName)
    firstNameLength = firstName.length
    if (firstName.empty?)
      page.should have_css("p.help-block",text:'Please provide a first name.')
      puts 'firstName length not in Limit - Error message displayed'
    elsif((firstNameLength>=1)&&(firstNameLength<=50))
      page.should_not have_css("p.help-block",text:'Please provide a first name.')
    elsif(firstNameLength>50)
      expect(page).not_to have_css("p.help-block", text:'Please provide a first name.')
      page.find("#assessorFirstName").value.length.should_be 50
      puts 'firstName Length Limit is 50 charachters'
    end
  end


  def validateAssessorLastName(lastName)
    lastNameLength = lastName.length
    if (lastName.empty?)
      expect(page).to have_css("p.help-block",text:'Please provide a last name.',visible: true)
      puts 'lastName length not in Limit - Error message displayed'
    elsif((lastNameLength>=1)&&(lastNameLength<=50))
   page.should_not have_css("p.help-block",text:'Please provide a last name.')
    elsif(lastNameLength>50)
      page.should_not have_css("p.help-block",text:'Please provide a last name.')
      page.find("#assessorLastName").value.length.should.eq '50'
      puts 'lastName Length Limit is 50 charachters'
    end
  end



  def validateAssessorPrimaryPhoneNumber(primaryPhoneNumber)
    primaryPhoneNumberLength = primaryPhoneNumber.length
    if (primaryPhoneNumber.empty?)
      expect(page).to have_css("p.help-block",text:'Please provide a phone number.')
    elsif(primaryPhoneNumberLength<=9)                                         #verify minim length#
      page.find('#assessorPhone').value.length.should.eq '10'
      page.should have_css("p.help-block",text:'Sorry, the phone number must be at least 10 digits long.')
      puts 'primaryPhoneNumber minlength is 10'
    elsif(primaryPhoneNumberLength>=51)
      page.find("#assessorSecondaryPhone").value.length.should.eq '50'
      page.should_not have_css("p.help-block",text:'Please provide a phone number.')
      puts 'primaryPhoneNumber maxlength is 50'
    end
  end


  def validateAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
    secondaryPhoneNumberLength = secondaryPhoneNumber.length
    if (secondaryPhoneNumber.empty?)
      puts "Ok, Secondary Phone Number is optional"
    elsif(secondaryPhoneNumberLength<=9)
      page.find('#assessorSecondaryPhone').value.length.should.eq '10'               #verify minim length#
      puts 'secondaryPhoneNumber minlength is 10'
      page.should have_css("p.help-block",text:'Sorry, the phone number must be at least 10 digits long.')
    elsif(secondaryPhoneNumberLength>=51)
      page.find('#assessorSecondaryPhone').value.length.should.eq '50'                     #verify max length#
      page.should_not have_css("p.help-block",text:'Please provide a phone number.')
      puts 'secondaryPhoneNumber maxlength is 50'
    end
    end


  def random_string(x)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
    string = (0..x).map {chars.sample}.join
  end

  def validateAddressMaxCHARS
    address_string = (assessor_address).set random_string(256)
    addressLength =  address_string.length
    if(addressLength>255)
      page.find("#assessorAddress").value.length.should_be 255
      puts 'addressLength Limit is 255 charachters'
    page.should have_xpath("//textarea[@rows='3']")  #Verifying default number of rows in Address textarea#
    end
  end

  def validateAssessorAddress(address)
    addressLength =  address.length
    if(address.empty?)
      page.should have_css("p.help-block", text:'Please provide an address.')
    elsif(addressLength>=1)
      page.should_not have_css("p.help-block", text:'Please provide an address.')
    end
  end

  def validatePrimaryEmailMaxCHARS
    email_string = (primary_email).set random_string(256)
    emailLength = email_string.length
    if(emailLength>=255)
      page.should have_css("p.help-block", text:'Please provide a valid email address.')
      page.find("#assessorEmail").value.length.should.eq '255'
      puts 'assessorEmail Limit is 255 charachters'
    end
  end


  def validateAssessorPrimaryEmail(primaryEmail)
    emailLength = primaryEmail.length
    if(primaryEmail.empty?)
      page.should have_css("p.help-block",text:'Please provide an email address.')
    elsif(emailLength>=1)
      expect(page).to have_css("p.help-block", text:'Please provide a valid email address.')
    end
    x= primaryEmail.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)
    p x
  end

  def validateAssessorSecondaryEmail(secondaryEmail)
    emailLength = secondaryEmail.length
    if(secondaryEmail.empty?)
      puts "Ok, Secondary Phone Number is optional"
    elsif(emailLength>=1)
      expect(page).to have_css("p.help-block", text:'Please provide a valid email address.')
    end
    x= secondaryEmail.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)
    p x
  end


  def validateTownMaxCHARS
    town_string = assessor_town.set random_string(61)
    townLenght = town_string.length
    if(townLenght>60)
      page.find("#assessorTown").value.length.should.eq '60'
      puts 'townLenght Limit is 60 charachters'
    end
  end

  def validateTownfield(town)
    townLength= town.length
    if(town.empty?)
      page.should have_css("p.help-block",text:'Please provide a town.')
    elsif((townLength>=1)&&(townLength<=60))
      expect(page).not_to have_css("p.help-block", text:'Please provide a town.')
    end
    y=town.match(/[ A-Za-z'-',.;'&.()]/)
      p y
  end


  def validateAssessorPostcode(postcode)
    postcodeLength = postcode.length
    if (postcode.empty?)
      page.should have_css("p.help-block", text:'Please provide a postcode.')
    elsif((postcodeLength>=1)&&(postcodeLength<=10))
      page.find("#assessorPostcode").value.length.should.eq'10'
      puts 'assessorPostcode Limit is 10 charachters'
   end
    z=postcode.match(/[ A-Za-z0-9]/)
      p z
  end

  def validatePostcodeMaxCHARS
    postcode_string =(assessor_postcode).set random_string(11)
    postcodeLength =  postcode_string.length
    if(postcodeLength>10)
      page.should have_css("p.help-block", text:'Please provide a valid postcode.')
      page.find("#assessorPostcode").value.length.should.eq'10'
    end
  end

                     def verifyPostcodeAutoCapital(postcode)
                        fill_in('assessorPostcode',:with=> postcode)
                          puts page.find("#assessorPostcode").value.downcase
                            puts is_lower?(postcode)
                               end

  def is_lower?(postcode)
    if(postcode != postcode.upcase)
      return 'POSTCODE not in lower case'
    else
      return 'POSTCODE in lower case'
    end
    end


  end










