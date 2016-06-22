class TrainerFormFieldValidationPage < SitePrism::Page
  element    :username,   "#trainerUsername"
  element    :first_name,    "#trainerFirstName"
  element    :last_name,      "#trainerLastName"
  element    :primary_phone,   "#trainerPhone"
  element    :secondary_phone, "#trainerSecondaryPhone"
  element    :primary_email,    "#trainerEmail"
  element    :secondary_email,   "#trainerSecondaryEmail"
  element    :trainer_address,   "#trainerAddress"
  element    :trainer_town,     "#trainerTown"
  element    :trainer_postcode,   "#trainerPostcode"



  def random_userName_string(length)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
    (0..length).map {chars.sample}.join
  end

  def alpha_numeric_for_trainer_form(length)
    chars = [*('A'..'Z'), *('a'..'z'), *(0..9)]
    (0..length).map {chars.sample}.join
  end


  def random_email_string(length)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]-%w(""()[];:><)+%w(@`!#$%&'*+-/=?^_`{ } ~ .|))
    (1..length).map { chars.sample }.join
  end


  def validateUsernameLength(field,length)
    el = find('label', text: /\A#{field}\z/, visible: true)
    el1 = find("##{el[:for]}")
    el1.set random_userName_string(length)
  end

  def validateEmailLength(field,length)
    el = find('label', text: /\A#{field}\z/, visible: true)
    el1 = find("##{el[:for]}")
    el1.set random_email_string(length)
  end








end