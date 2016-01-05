class MoveMyAssessmentsLinkPage < SitePrism::Page
  elements :navbar_elements, "ul.nav"

  def verify_my_assessments_link
    expected_array = ["HOME MY ASSESSMENTS REQUEST ASSESSMENT ASSESSMENT MANAGEMENT ADMINISTRATION"]
    actual_array = []
    navbar_elements.each do |row|
      $actual_array_elements = row.text
    end
    actual_array.push($actual_array_elements)
    expect(expected_array).to eq(actual_array)
  end
end