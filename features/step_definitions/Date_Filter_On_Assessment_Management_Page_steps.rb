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
  #find("#txtStartDate").send_keys(:enter)
end

Then(/^the end date option will be enabled$/)do
  find("#txtEndDate", visible: true)
end

When (/^I enter or select "([^"]*)" in End date field$/)do |date|
  fill_in('txtEndDate', :with=> date)

end

Then(/^the "([^"]*)" field auto populated with date$/)do |date|
 find_field('txtStartDate').value.eql?(date)
  start_date_value = find_field('txtStartDate').value
  puts start_date_value
end

And (/^The value of the "([^"]*)" will be end date -1 day$/)do |date|
 # if find("#txtStartDate").value ==  date
  t = day
  find_field('txtEndDate').value.eql?(date)
  end_date_value = find_field('txtEndDate').value
  start_date_value = find_field('txtStartDate').value
 start_date_vale=end_date_value-t
  end

When(/^I have selected the "([^"]*)" and "([^"]*)"$/)do |date|
fill_in('txtStartDate',:with=> date)
fill_in('txtEndDate',:with=> date)
end


Then (/^assessment falling in that range will be displayed$/)do

end


And (/^the assessments will be sorted by nearest date first$/)do

end