class ShowNearByTrainersPage < SitePrism::Page
  elements :near_by_postcode ,".nearby-course-postcode"
  element :main_postcode, ".main-course-postcode"
  elements :near_by_courses, ".dors-well-other"

def verify_trainer_details(new_table)
  columns= new_table.map { |x| x['Outcomes'] }
  for  i in 1...columns.size
    expect(page.text).to match(/#{columns[i]}/i)
  end
end

require 'tiny_tds'
def verify_trainer_inlcuded_booking_request
   trainer_ids = []
  expected_trainers_included = [279,281,392]
  client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
   client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
  result = client.execute("select TrainerLicenseId from [DORS_Classified].[dbo].[tbl_TrainerLicenseAssessment]")
  result.each do |row|
    $trainers = row['TrainerLicenseId']
    trainer_ids.push($trainers)
      end
  expect(trainer_ids).to match_array(expected_trainers_included)
end

  def verify_near_by_courses_same_postcode
  main_course_postcode = find(".main-course-postcode").text
  near_by_postcode.each do |postcode|
    near_by_course_postcode = postcode.text
    expect(near_by_course_postcode).to be == (main_course_postcode)
    expect(page.all(".dors-well-other").count).to be >1
    expect(page.all(".nearby-course-postcode").count).to be >1
  end
end

def verify_trainer_details_in_nearby_courses
  main_course_postcode = find(".main-course-postcode").text
    near_by_courses.each do |courses|
    near_by_postcode.each do |postcode|
      near_by_course_postcode = postcode.text
      expect(near_by_course_postcode).to be == (main_course_postcode)
      # expect(page).to have_css(".col-md-3.vertical-center.text-md")     # not sure so commented this
    end
  end
end
end