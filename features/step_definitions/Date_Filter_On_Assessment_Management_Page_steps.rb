And(/^default view of the page is loaded$/) do
@trainers.date_filter_on_assessment_management_page.delete_assessments_from_DB
click_link("ASSESSMENT MANAGEMENT")
expect(page).to have_css(".alert.alert-info", text: 'There are no assessments to display.')
end

And (/^I request assessments$/)do
  2.times do
    @trainers.date_filter_on_assessment_management_page.request_assessments_without_nearby_course
  end
  end

And(/^The assessment list will be sorted by assessment date$/)do
@trainers.date_filter_on_assessment_management_page.verify_assessment_list_sorting

end

And (/^default Date range filter will have no selection$/)do
puts find_field('txtStartDate').value.eql?("")
 puts find_field('txtEndDate').value.eql?("")
end

When (/^I select "([^"]*)" or type it in$/)do |date|
  fill_in('txtStartDate', :with=> date)
end

Then(/^the end date option will be enabled$/)do
  find("#txtEndDate", visible: true)
end

When (/^I enter or select "([^"]*)" in End date field$/)do |date|
  fill_in('txtEndDate', :with=> date)

end

Then(/^the start date field auto populated with date$/)do
  start_date_value = find_field('txtStartDate').value
  puts start_date_value
end

And (/^the value of the start date will be today date$/)do
find_field('txtStartDate').value == (Date.today)
end

And (/^I enter "([^"]*)" more than end date$/) do|date|
  fill_in('txtStartDate',:with=> date)
end

Then(/^the "([^"]*)" falls one day before end day$/)do |date|
puts find_field('txtStartDate').value.eql?(date)
start_date_value =find_field('txtStartDate').value
  end_date_value =   find_field('txtEndDate').value
      (start_date_value) < (end_date_value)
end


Then (/^assessments falling in that range will be displayed$/)do
  if find_field('txtStartDate').value == find_field('txtEndDate').value
  page.all('.dors-table').count == 1
  expect(page).to have_css('.assessment-date', visible: true)
  end
if find_field('txtEndDate').value == '23/01/2017'
   page.all('.dors-table').count>=1
    page.find_all(('.assessment-date'), match: :first , text:'10-Aug-2016', visible:true)
   page.find_all(('.assessment-date')[1], text:'22-Jan-2017', visible:true)
end
end

Then(/^I set status "([^"]*)" and "([^"]*)" available on the assessment page$/)do|status1, status2|
  if (status1 == "Requested" && status2 == "Approved" )
  @trainers.trainer_login_page.login_as("Assessor3")
  @trainers.date_filter_on_assessment_management_page.book_assessments_without_milage
  @trainers.date_filter_on_assessment_management_page.request_assessments_without_nearby_course
  @trainers.trainer_login_page.login_as("Compliance Manager")
  find("#single-button").click
  check('assessmentStatusChk1')
end
end

And(/^I set "([^"]*)" and "([^"]*)" filter on assessment page$/)do |start_date, end_date|
  find("#txtStartDate").click
  find("#txtStartDate").set(start_date)
  find("#txtStartDate").send_keys(:enter)

  find("#txtEndDate").click
  find("#txtEndDate").set(end_date)
  find("#txt-assessment-id").click

  sleep 4

end

Then (/^assessments that meet all filter criteria in combination will be displayed$/)do
  page.find_all(('.assessment-date'), match: :first , text:'10-Aug-2016', visible:true)
  page.find_all(('.assessment-date')[1], text:'22-Jan-2017', visible:true)
end
