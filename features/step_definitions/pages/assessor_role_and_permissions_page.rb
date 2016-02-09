class AssessorRoleAndPermissionsPage < SitePrism::Page
  elements :navbar, ".ul.nav"
  elements :assessment_status, ".dors-well-other"
  elements :assessor_name, ".assessor-name"


  def verify_assessments_list_with_status
    expect(page.all('.dors-well-other').count).to be > 0
    assessment_status.each do |row|
      expect(row.text).to include("Approved")
      expect(page).to have_content("Approved")
    end
    expect(page.all(".assessment-status").count).to be > 0

  end

  def verify_assessor_requested_assessments(user)
    click_link_or_button("View Details")
    assessor_name.each do |row|
    assessor_name = row.text
  expect(assessor_name).to include(user)
  end
end
end