class NGURoleAndPermissionsPage < SitePrism::Page

  elements :assessments, ".dors-table"
  elements :assessor_name, ".assessor-name"


  def verify_assessments_list_with_status_requested
    expect(page.all('.dors-table').count).to be > 0
    assessments.each do |row|
      expect(page).to have_css(".btn.btn-sm.btn-primary", text:'Approve')
    end
    expect(page.all(".btn.btn-sm.btn-primary").count).to be > 0

  end

  def verify_all_assessor_requested_assessments(user1,user2)
    actual_users = ["sudiv p","johnny p"]
    assessor_name.each do |row|
      assessor_name = row.text
      expect(actual_users).to match(assessor_name)
    end
  end
end