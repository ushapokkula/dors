class CreateAssessorRecordPage < SitePrism::Page
  elements :mandatory_fields, ".form-group.has-error"

  def verify_assessor_record_details(new_table)
    columns = new_table.map { |x| x['Input Details'] }
    for i in 1..columns.size
      expect(page).to have_content(columns[i])
    end
  end

  def verify_assessor_mandatory_fields(new_table)
    expect(page.all(".form-group.has-error").count).to be == 7
  end

  def verify_mandatory_field_err_msgs(fields, error_msgs)
    fill_in('assessorUsername', :with=>'gswapna')
    fill_in('assessorFirstName', :with=>'swapna')
    fill_in('assessorLastName', :with=>'gopu')
    fill_in('assessorPhone', :with=>'0753333222')
    fill_in('assessorEmail', :with=>'swapna@gmail.com')
    fill_in('assessorAddress', :with=>'1 high street')
    fill_in('assessorPostcode', :with=>'TW5 7GH')
    fill_in(fields, :with=>'')
    click_link_or_button("Create Assessor")
    expect(page).to have_content(error_msgs)

  end

  def verify_optional_fields(optional_field)
    fill_in('assessorUsername', :with=>'gswapna')
    fill_in('assessorFirstName', :with=>'swapna')
    fill_in('assessorLastName', :with=>'gopu')
    fill_in('assessorPhone', :with=>'0753333222')
    fill_in('assessorEmail', :with=>'swapna@gmail.com')
    fill_in('assessorAddress', :with=>'1 high street')
    fill_in('assessorPostcode', :with=>'TW5 7GH')
    fill_in('assessorNumber', :with=>'111111')
    fill_in('assessorSecondaryPhone', :with=>'07811111111')
    fill_in('assessorForceAreas', :with=>'xxxxxx')
    fill_in(optional_field, :with=>'')
    click_link_or_button("Create Assessor")
    expect(page).not_to have_css(".help-block")
  end


end