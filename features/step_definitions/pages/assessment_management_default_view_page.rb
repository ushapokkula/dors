class AssessmentManagementDefaultViewPage < SitePrism::Page
  elements :list_of_assessment_requests, ".dors-table"
  elements :assessment_dates, ".assessment-date"


  def verify_assessment_default_view_details(new_table)
    list_of_assessment_requests.each do |row|
    columns = new_table.map { |x| x['Details'] }
    columns.each do |label|
        expect(page).to have_text(label)
      end
    end
  end

  def verify_assessment_ID
    expect(page.all(".dors-table-row").count).to be >= 1
  end


  def verify_max_trainers
    list_of_assessment_requests.each do |row|
      expect(page.all(".trainer-full-name").count).to be <=4
    end
  end

  def verify_approve_button(button)
    list_of_assessment_requests.each do |row|
      expect(row.text).to include("Approve")
    end
    expect(page.all(".btn.btn-sm.btn-primary").count).to be >= 1
  end

  def verify_assessment_list_sorting
    actual_order= []
    assessment_dates.each do |row|
      assessment_dates= row.text
    end
    actual_order.push(assessment_dates)
    expected_order = []
    expected_order=actual_order.clone
    expected_order.sort
    expect(actual_order).to match_array(expected_order)
  end

  def request_assessment_with_practical
    click_link_or_button("REQUEST ASSESSMENT")
    expect(page).to have_css("h1", text: 'Request Assessment')
    all(".btn.btn-primary:nth-child(2)")[2].click
    #all(".btn.btn-primary")[3].click
    first(:button, 'Request Assessment').click if find(:button, 'Request Assessment', match: :first)
    fill_in('mileage', :with => '500')
    click_link_or_button("Submit")
  end

  def book_assessment_with_practical
    click_link_or_button("REQUEST ASSESSMENT")
    expect(page).to have_css("h1", text: 'Request Assessment')
    all(".btn.btn-primary:nth-child(2)")[2].click
    first(:button, 'Request Assessment').click if find(:button, 'Request Assessment', match: :first)
    find(".include-nearby-trainer-checkbox", match: :first)
    all(".include-main-trainer-checkbox")[1].click
    click_link_or_button("Submit")
  end

  def cancel_or_reject_assessment(assessment_type)
    if (assessment_type == "Requested")
      expect(page).to have_css("#assessment-title-header", text: "Assessment Request")
      click_button("Reject")
      fill_in("cancellationNotes", :with => "Notes for Rejection")
      within(".modal-content") do
        click_button("Reject")
      end
    else
      expect(page).to have_css("h1", text: "Assessment Outcome")
      click_button("Cancel")
      fill_in("cancellationNotes", :with => "Notes for Cancellation")
      within(".modal-content") do
        click_button("Cancel")
      end
    end
  end

end



