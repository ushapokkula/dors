class AssessorProfilePage < SitePrism::Page
  element   :trainer_first_name, "#assessorFirstName"
  element   :trainer_last_name, "#assessorLastName"
  element   :primary_phone, "#assessorPhone"
  element    :secondary_phone, "#assessorSecondaryPhone"
  element    :email, "#assessorEmail"
  element    :address, "#assessorAddress"
  element    :town, "#assessorTown"
  element    :postcode, "#assessorPostcode"
  element    :town, "#assessorTown"

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
    trainer_first_name.set Faker::Name.name
    trainer_last_name.set Faker::Name.name
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

      find('Please provide a first name.')

    elsif(firstNameLength<1)
      #TO-DO check with the length validation as it is not yet implemented
      should have_content('Please provide a first name.')

      #TO-DO check with the length validation as it is not yet implemented
    elsif(firstNameLength>=51)
      should have_content('Sorry, the first name must not be more than 20 characters long.')
    end

  end

  def validateAssessorLastName(lastName)

    lastNameLength = lastName.length

    if (lastName.empty?)
      find('Please provide a last name.')
    elsif(lastNameLength<=3)
      #TO-DO check with the length validation as it is not yet implemented
      should have_content('Sorry, the last name must be at least 4 characters long.')

      #TO-DO check with the length validation as it is not yet implemented
    elsif(lastNameLength>=21)
      should have_content('Sorry, the last name must not be more than 20 characters long.')
    end

  end

  def validateAssessorPrimaryPhoneNumber(primaryPhoneNumber)

    primaryPhoneNumberLength = primaryPhoneNumber.length

    if (primaryPhoneNumber.empty?)

      should have_content('Please provide a phone number.')

    elsif(primaryPhoneNumberLength<=9)

      should have_content('Sorry, the phone number must be at least 10 digits long.')

    elsif (primaryPhoneNumber[0]!= '0')
      should have_content('Sorry, the phone number must start with zero')
    elsif((primaryPhoneNumber.to_i).is_a?(Numeric).eql? false)
      should have_content('Sorry, only numbers are accepted.')
    end

  end

  def validateAssessorsecondaryPhoneNumber(secondaryPhoneNumber)
    secondaryPhoneNumberLength = secondaryPhoneNumber.length

    if (secondaryPhoneNumber.empty?)
      should have_content('Please provide a phone number.')
    elsif(secondaryPhoneNumberLength<=9)
      should have_content('Sorry, the phone number must be at least 10 digits long.')
    elsif (secondaryPhoneNumber[0]!= '0')
      should have_content('Sorry, the phone number must start with zero')

    elsif((secondaryPhoneNumber.to_i).is_a?(Numeric).eql? false)
      should have_content('Sorry, only numbers are accepted.')
    end

  end

  def validateAssessorEmail(email)
    x= email.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)
    p x
  end


  def validateAssessorAddress(address)
    if (address.empty?)
      should have_content('Please provide an address.')
    end
  end

  def validateAssessorTown(town)
    if (town.empty?)
      should have_content('Please provide a town.')
    end
  end

  def validateAssessorPostcode(postcode)
    if (postcode.empty?)
      should have_content('Please provide a postcode.')
    end
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

  def fillinAssessoremail(email)
    fill_in('assessorEmail', :with=> email)
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










