class ComplianceUnitAuthorisesAssessmentReqPage < SitePrism::Page

  def verify_visibility_of_approve_button
    puts expect(page.all(".btn.btn-sm.btn-primary").count).to be > 0
  end
end