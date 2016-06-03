class MyAssessmentsDefaultViewPage < SitePrism::Page
  element :assessment_date, :xpath, "html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/h4"
  elements :list_of_assessments, "dors-well-other.ng-scope"
  elements :booked_status, :xpath, "html/body/div[1]/div[2]/div/div/div[1]/div[2]/h4"
  elements :assessment_date, ".assessment-date"


  def check_booked_status(status)

    booked_status.each do |element|
       expect(element.text).to match(status)
    end
  end

  def configure_days_in_assessment_window
    click_link_or_button("ADMINISTRATION")
    fill_in('assessmentsWindow', :with=> '365')
    click_button('Save')
    expect(page).to have_content("Assessments booking time window has been successfully set")
  end

  def verify_assessments_within_configured_days
    assessment_date.each do|date|
     today_date = Date.today.to_s
    configured_date = Date.today + 365
    range = (today_date..configured_date.to_s)
    expected_date=Date.parse(date.text).strftime("%Y-%m-%d")
     previous_date=Date.parse(expected_date) < Date.today
     expect(previous_date).to be false
    range.include?(expected_date)
    end
  end

 def verify_assessment_date_out_of_30_days
    for i in 2..3
      date=find(:xpath, "html/body/div[1]/div[2]/div/div[#{i}]/div[1]/div[1]/h4").text
      expected_date=Date.parse(date).strftime("%Y-%m-%d")
      previous_date=Date.parse(expected_date) < Date.today
      expect(previous_date).to be false
    end
  end
end