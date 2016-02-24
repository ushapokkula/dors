class CreateAssessorRecordPage < SitePrism::Page
  elements :mandatory_fields, ".form-group.has-error"
  element :username, "#assessorUsername"
  element :force_area, "#assessorForceAreas"
  elements :forcearea_list, "#assessorForceAreas + ul li "
  elements :assessor_input_fields, ".label.control-label"

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
    fill_in('assessorUsername', :with=>'gswapna')
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
    username.set Faker::Name.name
    #fill_in('assessorUsername', :with=>'gswapna')
    fill_in('assessorFirstName', :with=>'swapna')
    fill_in('assessorLastName', :with=>'gopu')
    fill_in('assessorPhone', :with=>'0753333222')
    fill_in('assessorEmail', :with=>'swapna@gmail.com')
    fill_in('assessorAddress', :with=>'1 high street')
    fill_in('assessorTown', :with=>'Hounslow')
    fill_in('assessorPostcode', :with=>'TW5 7GH')
    fill_in('assessorNumber', :with=>'111111')
    fill_in('assessorSecondaryPhone', :with=>'07811111111')
    fill_in('assessorForceAreas', :with=>'pol')
    random_selector(forcearea_list)
    fill_in(optional_field, :with=>'')
    click_link_or_button("Create Assessor")
    expect(page).not_to have_css(".help-block")
  end

  def random_selector(x)
    size = x.count
    x[rand(1...size)].select_option
  end

  def verify_order_of_assessor_input_fields(new_table)
     fields=[]
    assessor_input_fields.each do |input_fields|
     fields = input_fields.text
     puts fields
    end
    #  assessor_fields=[]
    # assessor_fields.push(fields)

   puts  expect(new_table.map { |x| x['Assessor Input Fields'] }).to match_array(fields)
  end

end