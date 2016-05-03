class NguSearchAssessmentIDPage < SitePrism::Page
  elements :outcome_dropdowns, :css, ".dors-well-other select"
  elements :outcome_dropdowns_primary, ".dors-well select"

  require 'tiny_tds'

  def search_booked_assessment_id
    delete_assessments_from_DB
    verify_booked_assessmemt_id_in_DB
    book_assessment
    verify_booked_assessmemt_id_in_DB
  end

  def search_requested_assessment_id
    delete_assessments_from_DB
    verify_requested_assessmemt_id_in_DB
    request_assessment
    verify_requested_assessmemt_id_in_DB
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
    # client.active?
    result = client.execute("select TrainingAssessmentId from [DORS_Classified].[dbo].[tbl_TrainingAssessment] where StatusId = '1'")
    result.each do |row|
      $requested_status=row['TrainingAssessmentId']
    end
  end

  def delete_assessments_from_DB
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    client.execute("DELETE FROM [DORS_Classified].[dbo].[tbl_TrainerLicenseAssessment]")
    client.execute("DELETE FROM [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
  end

  def book_assessment
    # click_link_or_button("REQUEST ASSESSMENT")
    find('a', text: "REQUEST ASSESSMENT").click
    find(:button, 'Pick a slot', match: :first).click
    find(:button, 'Request Assessment', match: :first).click
    find(".ng-pristine.ng-valid", match: :first)
    page.all('.ng-pristine.ng-valid')[1].click
    find(".ng-pristine.ng-valid", match: :first)
    all('.ng-pristine.ng-valid')[2].click
    click_link_or_button("Submit")
    within('.alert.alert-success.ng-binding') do
      expect(page).to have_content("The assessment has been Booked")
    end
  end

  def request_assessment
    click_link_or_button("REQUEST ASSESSMENT")
    first(:button, 'Pick a slot').click if find(:button, 'Pick a slot', match: :first)
    first(:button, 'Request Assessment').click if find(:button, 'Request Assessment', match: :first)
    expect(page).to have_selector('.ng-pristine.ng-valid')
    page.all('.ng-pristine.ng-valid')[1].click
    fill_in('mileage', :with => '500')
    click_link_or_button("Submit")
  end

  def verify_assessment_outcome_details(new_table)
    columns = new_table.map { |x| x['Details'] }
    for i in 1..columns.size
      #expect(page.text).to match(/#{columns[i]}/i)
    end
  end

  def select_outcome
    select("Absent", :from => 'status-FSB422')

    select("Absent", :from => 'status-DOA123')

    select("Absent", :from => 'status-CIA624')
  end


end
