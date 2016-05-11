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
  element :notes_field, "#notes"

  def verify_assessment_sorting_by_date
    actual_order= []
    assessment_dates.each do |row|
      assessment_dates= row.text
    end
    actual_order.push(assessment_dates)
    expected_order = []
    expected_order=actual_order.clone
   puts expect(actual_order).to match_array(expected_order)

  end

  def request_assessments_without_nearby_course
    click_link("REQUEST ASSESSMENT")
  find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
  first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
  fill_in('mileage',:with=>'500')  #adding mileage#
    fill_in('notes',:with=>'Test')
  click_link_or_button("Submit")
    end



   def book_assessments_without_milage
  click_link("REQUEST ASSESSMENT")
  find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
  first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
  find('.include-main-trainer-checkbox').click
  click_link_or_button("Submit")
  within('.alert.alert-success') do
    expect(page).to have_content("The assessment has been Booked")
  end
   end


  end





