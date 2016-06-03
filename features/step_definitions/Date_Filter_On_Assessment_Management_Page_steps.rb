And(/^default view of the page is loaded$/) do
  @trainers.ngu_search_assessment_id_page.delete_assessments_from_DB
  click_link("ASSESSMENT MANAGEMENT")
  page.find("#single-button").click
  find("#assessmentStatusChk0").should be_checked #Requested option in selected state#
  find("#assessmentStatusChk1").should_not be_checked #Approved not in selected state#
  expect(page).to have_css(".alert.alert-info", text: 'There are no assessments to display.')
end


And (/^I request assessments$/) do
  7.times do
    @trainers.date_filter_on_assessment_management_page.request_assessments_without_nearby_course
  end
end


And(/^The assessment list will be sorted by assessment date$/) do
  @trainers.date_filter_on_assessment_management_page.verify_assessment_sorting_by_date
end


And (/^default Date range filter will have no selection$/) do
  raise "date range filter is not empty" unless find("#txtStartDate").value.empty?
  raise "date range filter is not empty" unless find("#txtEndDate").value.empty?
end

When (/^I enter "([^"]*)" in start date field$/) do |date|
  fill_in('txtStartDate', :with => date)
  page.find_all('.dors-table')
  page.find_all('.assessment-status', text: 'Requested')
end


Then(/^the end date option will be empty$/) do
  find_field('txtEndDate').value.eql?("")
end


When (/^I enter "([^"]*)" in End date field$/) do |date|
  fill_in('txtEndDate', :with => date)
end


Then(/^the 'start date' field auto populated$/) do
  raise "date range filter is not empty" unless find("#txtStartDate").value.empty?
end

And (/^the value of the 'start date' will be 'today date'$/) do
  expect(find_field('txtStartDate').value).to eq(Date.today)
end

And (/^I enter "([^"]*)" more than 'end date'$/) do |date|
  fill_in('txtStartDate', :with => date)
end

Then(/^the 'end date' falls one day more than 'start date'$/) do
  x = find_field('txtStartDate').value
  start_date_value = Time.parse(DateTime.strptime(x, '%d/%m/%Y').strftime("%Y-%m-%d %H:%M:%S"))
  y = find_field('txtEndDate').value
  end_date_value = Time.parse(DateTime.strptime(y, '%d-%b-%Y').strftime("%Y-%m-%d %H:%M:%S"))
  puts " The start and end dates are #{start_date_value} , #{end_date_value} respectively"
  expect((end_date_value - start_date_value).to_i).to eq 86400
  # 86400 is one day in seconds
end


And(/^I set "([^"]*)" and "([^"]*)" filter on assessment page$/) do |start_date, end_date|
  page.find_all('.assessment-status', text: 'Requested') #Verifying requested assessments get displayed#
  find("#txtStartDate").click
  find("#txtStartDate").set(start_date)
  find("#txtStartDate").send_keys(:enter)

  find("#txtEndDate").click
  find("#txtEndDate").set(end_date)
  find("#txt-assessment-id").click

end

Then (/^assessments falling in "([^"]*)" and "([^"]*)" range will be displayed$/) do |start_date, end_date|
  if (start_date == "10/08/2016" && end_date == "16/11/2016")
    page.all('.dors-table').count>=1
    page.find_all('.assessment-date')[0].text == '10-Aug-2016'
    page.find_all('.assessment-date')[1].text == '16-Nov-2016'
  end

  if (start_date == "10/08/2016" && end_date == "23/05/2017")
    page.all('.dors-table').count>=1
    page.find_all('.assessment-date')[0].text == '10-Aug-2016'
    page.find_all('.assessment-date')[1].text == '16-Nov-2016'
    page.find_all('.assessment-date')[2].text == '22-Jan-2017'
    page.find_all('.assessment-date')[3].text == '27-Apr-2017'
    page.find_all('.assessment-date')[4].text == '15-May-2017'
  end

  if (start_date == "05/05/2017" && end_date == "16/05/2017")
    page.all('.dors-table').count>=1
    page.find_all('.assessment-date')[0].text == '27-May-2017'
    page.find_all('.assessment-date')[1].text == '15-May-2017'
  end

  if (start_date == end_date)
    page.all('.dors-table').count>=1
    page.find_all('.assessment-date')[0].text == '15-May-2017'
  end
end


Then(/^I set status "([^"]*)" and "([^"]*)" available on the assessment page$/) do |status1, status2|
  if (status1 == "Requested" && status2 == "Approved")
    @trainers.trainer_login_page.login_as("Assessor3")
    2.times do
      @trainers.date_filter_on_assessment_management_page.book_assessments_without_milage #booking 2 assessments#
    end
    2.times do
      @trainers.date_filter_on_assessment_management_page.request_assessments_without_nearby_course #requesting 2 assessments#
    end
    @trainers.trainer_login_page.login_as("Compliance Manager")
    find("#single-button").click
    check('assessmentStatusChk1')
  end
end

Then (/^assessments that meet all filter criteria in combination will be displayed$/) do
  page.find_all('.assessment-date')[0].text == '10-Aug-2016'
  page.find_all('.assessment-status')[0].text == 'Approved'
  page.find_all('.assessment-date')[1].text == '16-Nov-2016'
  page.find_all('.assessment-status')[1].text == 'Requested'
  page.find_all('.assessment-date')[2].text == '22-Jan-2017'
  page.find_all('.assessment-status')[2].text == 'Approved'
  page.find_all('.assessment-date')[3].text == '27-Apr-2017'
  page.find_all('.assessment-status')[3].text == 'Requested'
end
