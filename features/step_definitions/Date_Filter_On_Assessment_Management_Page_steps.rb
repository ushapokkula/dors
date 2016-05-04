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
 find("#txtStartDate").value = $start_date
puts $start_date
end