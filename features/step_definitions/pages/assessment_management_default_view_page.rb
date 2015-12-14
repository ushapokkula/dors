class AssessmentManagementDefaultViewPage < SitePrism::Page
  elements :list_of_assessment_requests, ".dors-table"


  def verify_assessment_default_view_details(new_table)
    sleep 5
    columns = new_table.map { |x| x['Details'] }
    for i in 1..columns.size
      expect(page.text).to match(/#{columns[i]}/i)
    end
  end

  def verify_list_of_assessment_requests
    sleep 5
    list_of_assessment_requests.each do |row|
      expect(row.text).to include("Status Requested")
    end
  end
end