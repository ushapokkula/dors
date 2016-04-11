class MoveMyAssessmentsLinkPage < SitePrism::Page
  elements :navbar_elements, "ul.nav"

  def verify_my_assessments_link
    expected_array = ["MY ASSESSMENTS", "REQUEST ASSESSMENT", "MY PROFILE"]
    actual_array = []
    navbar_elements.each do |row|
      $actual_array_elements = row.text
      actual_array.push($actual_array_elements)
    end
    expect(expected_array).to eq(actual_array)
  end
end