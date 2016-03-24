class TrainerLoginPage < SitePrism::Page

  set_url Capybara.app_host


  element :sign_out_link, "#btn-signout"
  element :username_field, "#txtemail"
  element :password_field, "#txtpassword"
  element :sign_in_button, ".btn.btn-primary.btn"


  def log_in(user)
    if user=="Assessor"
      # verify_no_user_is_signed_in
      login_as(ASSESSOR_USERNAME,ASSESSOR_PASSWORD)
    elsif user=="Compliance Manager"
      verify_no_user_is_signed_in
      login_as(COMPLAINCE_USERNAME,COMPLAINCE_PASSWORD)
    elsif user=="Trainer"
      verify_no_user_is_signed_in
      login_as(TRAINER_USERNAME,TRAINER_PASSWORD)
    elsif user=="Assessor1"
      verify_no_user_is_signed_in
      login_as(ASSESSOR_USERNAME1,ASSESSOR_PASSWORD1)
    end
  end

  def login_as(username,password)
    #wait_for_username_field
    username_field.set(username)
    #wait_for_password_field
    password_field.set(password)
    sign_in_button.click
    #wait_for_sign_out_link
  end


  def verify_no_user_is_signed_in
      click_link_or_button('Sign out') if page.has_selector?('#btn-signout',wait:2)
      # click_link_or_button('Sign out') if page.has_content?('Sign out')
    end
  end

  def enter_valid_username
    username_field.set "varma"
  end

  def enter_valid_password
    password_field.set "P@ssw0rd"
  end

  def enter_invalid_password
    password_field.set "invalidpassword"
  end

  def click_login
    sign_in_button.click
  end

