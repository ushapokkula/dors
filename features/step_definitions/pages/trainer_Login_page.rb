class TrainerLoginPage < SitePrism::Page
  element :sign_out_link, "#btn-signout"

  def verify_no_user_is_signed_in

    if has_sign_out_link?
      sign_out_link.click
    end
  end

end