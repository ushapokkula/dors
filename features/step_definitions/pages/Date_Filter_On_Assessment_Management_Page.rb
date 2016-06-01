class DateFilterOnAssessmentManagementPage < SitePrism::Page
  elements :assessment_dates, ".assessment-date"
  elements :approve_btn, ".btn.btn-sm.btn-primary"
  element :booked_text, ".alert.alert-success"
  elements :view_details_link, ".btn.btn-link"
  element :cancel_btn, ".btn.btn-danger"
  element :approved_checkbox, "#assessmentStatusChk1"
  element :assessment_status_dropdwn, "#single-button"
  element :cancel_notes_area, "#cancellationNotes"
  element :cancel_yes, "#cancel-assessment-yes"

  def verify_assessment_sorting_by_date
    actual_order = []
    assessment_dates.each do |element|
    dates=element.text
  actual_order.push(assessment_dates)
      end
    expected_order =[]
  expected_order=actual_order.clone
        puts expect(actual_order).to match_array(expected_order)
    end



  def request_assessments_without_nearby_course
    click_link("REQUEST ASSESSMENT")
  find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
  first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
  fill_in('mileage',:with=>'500')
  click_link_or_button("Submit")
  end



  def book_assessments_without_milage
    click_link("REQUEST ASSESSMENT")
    expect(page).to have_css("h1", text: 'Request Assessment')
    find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
   first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
   page.find_all(".include-nearby-trainer-checkbox", match: :first)
   find('.include-nearby-trainer-checkbox', match: :first).click if find('.include-nearby-trainer-checkbox', match: :first)
   click_link_or_button("Submit")
    within('.alert.alert-success.ng-binding') do
    expect(page).to have_content("The assessment has been Booked")
  end
end

  end





