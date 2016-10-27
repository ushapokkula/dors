class FiltersONMyAssessmentPage < SitePrism::Page


  elements :status_values, "#single-button+ul li label"



  def verify_status_filter_visibility_on_myassessments(new_table)
  staus =[], actual_status_values = []
  page.has_css?("#single-button")
  find("#single-button").text == "Assessment Status"
  find("#single-button").click
  expect(page).to have_css("#single-button + .dropdown-menu")
  status_values.each do |values|
    status = values.text
    actual_status_values.push(status)
  end
  expect(new_table.map { |x| x['Expected Status Filters'] }).to match_array(actual_status_values)
  end

  def cancel_assessment
    click_link("MY ASSESSMENTS")
    click_button("View Details")
    click_button("Cancel Assessment")
    fill_in("cancellationNotes", :with => "Notes for cancellation")
    click_button('Yes')
  end

  def reject_assessment_on_myassessments
    fill_in("txt-assessment-id", :with => $requested_status)
    click_button("Search")
    expect(page).to have_css("h1", text: "Assessment Request")
    click_button("Reject")
    fill_in("cancellationNotes", :with => "Notes for Rejection")
    click_button('Yes')
  end



end