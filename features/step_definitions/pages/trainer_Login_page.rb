class TrainerLoginPage < SitePrism::Page

  #set_url Capybara.app_host


  element :sign_out_link, "#btn-signout"
  element :username_field, "#txtemail"
  element :password_field, "#txtpassword"
  element :sign_in_button, ".btn.btn-primary.btn"

  def login_as(user)
    verify_no_user_is_signed_in
    username_field.set($users[user]['username'])
    password_field.set($users[user]['password'])
    sign_in_button.click
  end


  def verify_no_user_is_signed_in
      click_link_or_button('Sign out') if page.has_selector?('#btn-signout',wait:2)
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

