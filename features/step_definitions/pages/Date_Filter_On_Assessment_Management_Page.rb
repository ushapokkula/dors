class DateFilterOnAssessmentManagementPage < SitePrism::Page
  elements :assessment_dates, ".assessment-date"
  element  :assessment_id, "span#requested-assessment-id"
  element  :assessment_date, "span#requested-assessment-date"
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

    assessment_dates
    new_dates = assessment_dates.map { |x| x.text }
    actual = new_dates.map do |x|
      Time.parse(DateTime.strptime(x, '%d-%b-%Y').strftime("%Y-%m-%d %H:%M:%S")).strftime("%d/%m/%Y")
    end
    sort_dates = lambda { |x| x.split('/').values_at(2,1,0) }
    expected = actual.sort_by(&sort_dates)
    puts " The actual order from the page is #{actual}"
    puts " The actual order expected is #{expected}"
    expect(actual).to match_array(expected)
  end



  def request_assessments_without_nearby_course
    click_link("REQUEST ASSESSMENT")

  find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
  first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
  fill_in('mileage',:with=>'500')  #adding mileage#
    fill_in('notes',:with=>'Test')
  click_link_or_button("Submit")
    within('#requested-assessment-info')do
      expect(page).to have_content("Assessment #{assessment_id.text} scheduled for #{assessment_date.text} has been Requested")
    end
  end


  def book_assessments_without_milage
    click_link("REQUEST ASSESSMENT")
    expect(page).to have_css("h1", text: 'Request Assessment')
    find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
   first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
   page.find_all(".include-nearby-trainer-checkbox", match: :first)
   find('.include-nearby-trainer-checkbox', match: :first).click if find('.include-nearby-trainer-checkbox', match: :first)
   click_link_or_button("Submit")
    within('#requested-assessment-info')do
      expect(page).to have_content("Assessment #{assessment_id.text} scheduled for #{assessment_date.text} has been Booked")
    end
end
end



