class NguSearchAssessmentIDPage < SitePrism::Page
  elements :outcome_dropdowns, :css, ".dors-well-other select"

  require 'tiny_tds'

  def search_booked_assessment_id
    delete_assessments_from_DB
    verify_booked_assessmemt_id_in_DB
    book_assessment
    verify_booked_assessmemt_id_in_DB
    click_link_or_button("ASSESSMENT MANAGEMENT")
    fill_in('txt-assessment-id', :with => $booked_status)
  end

  def search_requested_assessment_id
    delete_assessments_from_DB
    request_assessment
    verify_requested_assessmemt_id_in_DB
    click_link_or_button("ASSESSMENT MANAGEMENT")
    fill_in('txt-assessment-id', :with => $requested_status)
  end

  require 'tiny_tds'

  def verify_booked_assessmemt_id_in_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.active?
    result = client.execute("select TrainingAssessmentId from [DORS_Classified].[dbo].[tbl_TrainingAssessment] where StatusId = '2'")
    result.each do |row|
      $booked_status=row['TrainingAssessmentId']
    end
  end

  def verify_requested_assessmemt_id_in_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.active?
    result = client.execute("select TrainingAssessmentId from [DORS_Classified].[dbo].[tbl_TrainingAssessment] where StatusId = '1'")
    result.each do |row|
      $requested_status=row['TrainingAssessmentId']
    end
  end

  def delete_assessments_from_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("DELETE FROM [DORS_Classified].[dbo].[tbl_TrainerLicenseAssessment]")
    client.execute("DELETE FROM [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
  end

  def book_assessment
    click_link_or_button("REQUEST ASSESSMENT")
    sleep 4
    first(:button, 'Pick a slot').click
    sleep 5
    first(:button, 'Request Assessment').click
    sleep 5
    page.all('.ng-pristine.ng-valid')[1].click
    page.all('.ng-pristine.ng-valid')[2].click
    click_link_or_button("Submit")
    within('.alert.alert-success.ng-binding') do
      expect(page).to have_content("The assessment has been Booked")
    end
  end

  def request_assessment
    click_link_or_button("REQUEST ASSESSMENT")
    sleep 4
    first(:button, 'Pick a slot').click
    sleep 5
    first(:button, 'Request Assessment').click
    sleep 5
    page.all('.ng-pristine.ng-valid')[1].click
    fill_in('mileage', :with => '500')
    click_link_or_button("Submit")
  end

  def verify_assessment_outcome_details(new_table)
    columns = new_table.map { |x| x['Details'] }
    for i in 1..columns.size
      expect(page.text).to match(/#{columns[i]}/i)
    end
  end

  def verify_buttons
    outcome_dropdowns.each do |dropdown|
      puts dropdown.text
    binding.pry
      # select "Action Note", :from => 'dropdown'
      dropdown.select('Action Note')
    end
    find_button('Mark Complete').visible?
    find_button('Cancel').visible?
  end

end
