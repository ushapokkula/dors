class NGURoleAndPermissionsPage < SitePrism::Page

  elements :assessments, ".dors-table"
  elements :assessor_name, ".assessor-name"


  def verify_assessments_list_with_status_requested
    expect(page.all('.dors-table').count).to be > 0
    assessments.each do |row|
      expect(row.text).to include("Requested")
      expect(page).to have_content("Requested")
    end
    expect(page.all(".assessment-status").count).to be > 0

  end

  def verify_all_assessor_requested_assessments
    actual_users = ["sudiv p","johnny p"]
    sleep 2
    assessor_name.each do |row|
      assessor_name = row.text
      expect(actual_users).to include(assessor_name)
    end
  end
end