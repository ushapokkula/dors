class AssessorRoleAndPermissionsPage < SitePrism::Page
  elements :navbar, ".ul.nav"
  elements :assessment_status, ".dors-well-other"
  elements :assessor_name, ".assessor-name"


  def verify_assessments_list_with_status
    assessment_status
    assessment_status.each do |row|
      expect(row.text).to include("Approved")
    end
    expect(page).to have_css(".assessment-status",:minimum => 1)
  end

  def verify_assessor_requested_assessments(user)

    assessor_name.each do |row|
      assessor_name = row.text
      expect(page).to have_css(".assessor-name",text: user)

    end
  end

  def get_assessment_id_and_date

  end
end