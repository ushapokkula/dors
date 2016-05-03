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

  def verify_assessment_list_sorting
    actual_order= []
    assessment_dates.each do |row|
      assessment_dates= row.text
    end
    actual_order.push(assessment_dates)
    expected_order = []
    expected_order=actual_order.clone
    expect(actual_order).to match_array(expected_order)

  end

  def delete_assessments_from_DB
    #if page.all(".dors-table").count >=1
      #expect(page).to have_css(".btn.btn-link")delete_data = []
        within('.dors-table') do
       view_details_link.each do |row|
         view_details_link  = row.click
        click_button('Reject')
        expect(page).to have_css("#cancellationNotes")
        page.find("#cancellationNotes").send_keys("test")
        page.find("#reject-assessment-yes").click


      end
      end

      #page.all('.btn.btn-link')[1].click

    #else
      #expect(page).to have_css(".alert.alert-info", text: 'There are no assessments to display.')

    #end
      end






  def request_assessments
    click_link("REQUEST ASSESSMENT")
  find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
  first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
  if page.should have_css('.include-nearby-trainer-checkbox')
  find(".include-nearby-trainer-checkbox",match: :first)
  page.all('.include-nearby-trainer-checkbox')[1].click
  fill_in('mileage',:with=>'500')
  click_link_or_button("Submit")
  else
    fill_in('mileage',:with=>'500')
    click_link_or_button("Submit")
  end
  end
  end



