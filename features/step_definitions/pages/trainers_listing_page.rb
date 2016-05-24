class TrainersListingPage < SitePrism::Page


  elements :pick_a_slot_aray, :xpath, ".//*[@id='expiring-licenses-view']/section/div/table/tbody/tr/td[6]/button"
  elements :pick_a_slot_array, ".btn.btn-primary:nth-child(2)"
  elements :course_details, :xpath, ".//*[@id='pick-course-view']/section/div/table/tbody/tr/td"
  elements :course_headers, :xpath, ".//*[@id='pick-course-view']/section/div/table/thead/tr/td"
  elements :primary_trainer_details, :xpath, ".//*[@id='pick-course-view']/section/div/div/div/h3"


  elements :expiry_dates_order, :xpath, "html/body/div[1]/div[2]/div/div/table/tbody/tr/td[3]"
  elements :duplicate_trainer, ".trainer-full-name"
  elements :license_details, ".trainer-licenseCode"

  elements :list_of_courses, :xpath, "//div[@class='dors-table-row row']"
  elements :course_dates, ".course-date"
  elements :expiry_dates, ".license-expiry-date"

  def display_list_of_trainers_within_configured_days(count)
    find(:xpath, "//div[@class='dors-table-row row']", match: :first)
    expect(list_of_courses.count).to be > 1
    verify_expiry_dates(count)
  end

  def verify_expiry_dates(count)
    expiry_dates.each do |date|
      today_date = Date.today.to_s
      configured_date = Date.today + count.to_i
      range = (today_date..configured_date.to_s)
      expected_date=Date.parse(date.text).strftime("%Y-%m-%d")
      range.include?(expected_date)
    end

  end

  def verify_date_format
    expiry_dates.each do |date|
      actual_date_format = (date.text).match(/[0-9][2-9]-([A-z][a-z][a-z])-(\d{4})/).to_s
      split_value = actual_date_format.split(" ").first
      expect(split_value).to match(date.text)

    end
  end


  def expiry_days_asc_order
    expiry_dates1=[]
    expiry_dates.each do |element|
      dates=element.text
      actual_date=Date.parse(dates).strftime("%d/%m/%Y")
      expiry_dates1.push(actual_date)
    end
    sorted_dates=[]
    sorted_dates=expiry_dates1.clone
    sorted_dates.sort
    expect(sorted_dates).to match_array(expiry_dates1)
  end

  require 'tiny_tds'

  def not_displaying_results_out_of_time
    expiry_date=[]
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result= client.execute("SELECT tbl_TrainerLicense.ExpiryDate FROM tbl_TrainerForce INNER JOIN tbl_TrainerLicense ON tbl_TrainerForce.TrainerId = tbl_TrainerLicense.TrainerId  WHERE (tbl_TrainerForce.ForceId = 28) AND (tbl_TrainerLicense.ExpiryDate > DATEADD(dd, 365, GETDATE()))")
        result.each do |row|
      date = row['ExpiryDate']
      expiry_dates.each do |element|
        (element.text) != date
      end
    end
      end

  def verify_previous_expired_dates
    expiry_dates.each do |date|
      expected_date=Date.parse(date.text).strftime("%Y-%m-%d")
      previous_date=Date.parse(expected_date) < Date.today
      expect(previous_date).to be false
    end
  end

  def validating_unique_licenses
    unique_licenses=[]
    license_details.each do |licenses|
      unique_licenses.push(licenses.text)
    end
    expect(unique_licenses).to match_array(unique_licenses.uniq)
  end


  require 'tiny_tds'

  def multiple_licenses_as_seperate_entry
    duplicate_trainers= []
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.execute("EXECUTE sproc_Set_Context_Info @AuditUserName = 'swapna',  @AuditIPAddress = '10.12.18.189'")
    result = client.execute("SELECT  tbl_Trainer.Forename + ' ' + tbl_Trainer.Surname AS Fullname
                               FROM  tbl_TrainerForce INNER JOIN
                               tbl_TrainerLicense ON tbl_TrainerForce.TrainerId = tbl_TrainerLicense.TrainerId
                               INNER JOIN tbl_Trainer ON tbl_TrainerLicense.TrainerId = tbl_Trainer.TrainerId
                               WHERE  (tbl_TrainerForce.ForceId = 28) AND (tbl_TrainerLicense.ExpiryDate <= DATEADD(dd, 365, GETDATE()))
                               GROUP BY tbl_Trainer.Forename, tbl_Trainer.Surname
                               HAVING (COUNT(tbl_Trainer.Surname) > 1)")
    result.each do |row|
      duplicate_trainer_details = row['Fullname']
      duplicate_trainers.push(duplicate_trainer_details)
    end
    duplicate_names=[]
    expect(page).to have_css(".trainer-full-name")
    duplicate_trainer.each do |duplicates|
      elements=duplicates.text
      duplicate_names.push(elements)
    end
    duplicate_count=duplicate_names.group_by { |e| e }.select { |k, v| v.size > 1 }.map(&:first)
    expect(duplicate_count).to match_array(duplicate_trainers)
  end


  def pick_a_slot
    pick_a_slot_array.each do |elements|
      find_all(elements).click
      courses = page.all(".dors-table").count
      expect(courses).to be > 0
    end
    page.evaluate_script('window.history.back()')
    end

  def verify_details_on_pickaslot(new_table)

    columns = new_table.map { |x| x['Display_Items'] }
    for i in 0...columns.size
       expect(page).to have_content(columns[i])
    end
  end

  def check_course_details
    course_details.each do |element|
      page.should have_content(element.text)
    end
  end

  def pick_a_slot_to_verify_course_dates
    expect(page).to have_css(".course-date")
    expect(page.all(".course-date").count).to be > 0
    course_dates.each do |date|
      Date.parse(date.text) >= Date.today
    end

  end


  def verify_trianers_fullname
    expect(page).to  have_css(".trainer-fullname")
    expect(page).to have_css(".secondary-trainer-full-name")
  end


  require 'tiny_tds'

  def database_connection
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.active?
  end

  def primary_trainer_details_on_pickacourse_page
    primary_trainer_details.each do |trainer_details|
      page.should have_content(trainer_details.text)
    end
  end

end







