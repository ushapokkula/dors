class TrainerLoginPage < SitePrism::Page

  set_url Capybara.app_host


  element :sign_out_link, "#btn-signout"
  element :trainerlicencenumber_field, "#txtemail"
  element :password_field, "#txtpassword"
  element :sign_in_button, ".btn.btn-primary.btn"


  def login_as(user)
    # verify_no_user_is_signed_in
    trainerlicencenumber_field.set($users[user]['trainer_licence_number'])
    password_field.set($users[user]['password'])
    sign_in_button.click
  end


  def verify_no_user_is_signed_in
      click_link_or_button('Sign out') unless page.has_no_selector?('p', text: 'You are logged in as' )
      #find(:button,'Sign out').click if page.should have_css('p', text: 'You are logged in as' )
    end


  def enter_valid_username(user)
    trainerlicencenumber_field.set($users[user]['trainer_licence_number'])
  end

  def enter_valid_password(user)
    password_field.set($users[user]['password'])
  end

  def enter_invalid_password
    password_field.set "invalidpassword"
  end

  def click_login
    sign_in_button.click
  end

def verify_fullname(user)
  client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
  client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
  if user == "Assessor"
  result= client.execute("SELECT  tbl_User.Forename + ' ' + tbl_User.Surname AS Fullname FROM  tbl_User
                         WHERE tbl_User.ActiveDirectoryUsername="+"'"+($users[user]['trainer_licence_number'])+"'")
  elsif user == "Trainer2"
  result= client.execute("SELECT tbl_User.Forename + ' ' + tbl_User.Surname AS Fullname FROM tbl_User
                          WHERE tbl_User.ActiveDirectoryUsername ="+"'"+($users[user]['trainer_licence_number'])+"'")
  end
  result.each do |row|
   @fullname = row['Fullname']
  end
 expect(@fullname.titleize).to eq(find(".dors-user-fullname.text-capitalize").text)
end

end

