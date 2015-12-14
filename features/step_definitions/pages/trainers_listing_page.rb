class TrainersListingPage < SitePrism::Page



  elements :pick_a_slot_aray, :xpath, ".//*[@id='expiring-licenses-view']/section/div/table/tbody/tr/td[6]/button"
  elements :course_details, :xpath, ".//*[@id='pick-course-view']/section/div/table/tbody/tr/td"
  elements :course_headers, :xpath, ".//*[@id='pick-course-view']/section/div/table/thead/tr/td"
  elements :primary_trainer_details, :xpath, ".//*[@id='pick-course-view']/section/div/div/div/h3"
  elements :course_dates, :xpath, ".//*[@id='pick-course-view']/section/div/table/tbody/tr/td[1]"
  elements :expiry_dates_order, :xpath, "html/body/div[1]/div[2]/div/div/table/tbody/tr/td[3]"
  elements :duplicate_trainer, :xpath, "html/body/div[1]/div[2]/div/div/table/tbody/tr/td[1]"
  elements :license_details, :xpath, "html/body/div[1]/div[2]/div/div/table/tbody/tr/td[2]"

  def display_list_of_trainers_next_30days


  end

  def expiry_days_asc_order
    expiry_days=[]
    expiry_dates_order.each do |element|
      days=element.text.split(" ").first
      expiry_days.push(days)
    end
    sorted_days=[]
    sorted_days=expiry_days.clone
    sorted_days.sort
    expect(sorted_days).to match_array(expiry_days)
  end

  require 'tiny_tds'

  def not_displaying_results_after_30days
    expiry_date=[]
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.active?
    puts "connected to database"
    result= client.execute("select DATEDIFF(day, cast(GetDATE() as Date), ExpiryDate) as days FROM (SELECT expirydate  FROM [DORS_Classified].[dbo].[tbl_TrainerLicense] where ExpiryDate < cast(GetDATE() as date) or expirydate > Dateadd(d, 30, cast(GetDATE() as date))) dates")
    result.each do |row|
      date = row['days']
      expiry_dates_order.each do |element|
        (element.text) != date
      end
    end
    client.close
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
    duplicate_trainer__details= [], duplicate_trainer__count=[]
    client = TinyTds::Client.new username: 'swapna.gopu', password: 'Password1', host: '10.100.8.64', port: '1433'
    client.active?
    result = client.execute("select Forename + ' ' + surname as 'fullname' from [DORS_Classified].[dbo].[tbl_Trainer]  t1 join tbl_TrainerLicense t2 on t2.TrainerId=t1.TrainerId where (ExpiryDate >= (cast(GetDATE() as Date)) and EXPIRYDATE <= Dateadd(d,30, cast(GetDATE() as Date))) group by Forename, surname having (count(*)>1) order by forename desc")
    result.each do |row|
      duplicate_trainer__count = row['fullname']
      duplicate_trainer__details=duplicate_trainer__count_ #to.ary'
    end
    duplicate_names=[]
    duplicate_trainer.each do |duplicates|
      elements=duplicates.text
      duplicate_names.push(elements)
    end
    puts "******"
    #puts duplicate_names
    #puts "&&&&&&&&&&&"
    duplicate_count_array=[]
    duplicate_count=duplicate_names.group_by { |e| e }.select { |k, v| v.size > 1 }.map(&:first)
    #duplicate_count_array.push(duplicate_count)
    puts duplicate_count
    puts expect(duplicate_count).to match_array(duplicate_trainer__details)
  end


  def pick_a_slot
    for i in 1..6
      if (page.has_xpath?("//*[@id='expiring-licenses-view']/section/div/table/tbody/tr[#{i}]/td[6]/button"))
        value=find(:xpath, "//*[@id='expiring-licenses-view']/section/div/table/tbody/tr[#{i}]/td[6]/button").text
        if (value == "Pick a slot")
          find(:xpath, "//*[@id='expiring-licenses-view']/section/div/table/tbody/tr[#{i}]/td[6]/button").click
          sleep 2
          check_column_headers
          sleep 2
          check_course_details
          primary_trainer_details_on_pickacourse_page
          page.evaluate_script('window.history.back()')
          sleep 2
        end
      end
    end
  end


  def check_column_headers
    for i in 1..5
      column_headers=[], data_value=[]
      column_headers =["", "DATE", "TIME", "TITLE", "SITE", "OTHER TRAINERS"]
      data_value[i]=find(:xpath, ".//*[@id='pick-course-view']/section/div/table/thead/tr/td[#{i}]").text
      expect(data_value[i]).to include(column_headers[i])
    end

  end

  def check_course_details
    course_details.each do |element|
      page.should have_content(element.text)
    end
  end


  def pick_a_slot_to_verify_course_dates
    for i in 1..6
      if (page.has_xpath?("html/body/div[1]/div[2]/div/div/table/tbody/tr[#{i}]/td[6]/button"))
        value=find(:xpath, "html/body/div[1]/div[2]/div/div/table/tbody/tr[#{i}]/td[6]/button").text
        if (value == "Pick a slot")
          find(:xpath, "html/body/div[1]/div[2]/div/div/table/tbody/tr[#{i}]/td[6]/button").click
          sleep 2
          course_dates.each do |date|
            Date.parse(date.text) >= Date.today
          end
          page.evaluate_script('window.history.back()')
        end
      end
    end
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





