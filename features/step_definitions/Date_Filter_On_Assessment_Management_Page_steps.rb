And(/^default view of the page is loaded$/) do
  @trainers.date_filter_on_assessment_management_page.delete_assessments_from_DB
  click_link("ASSESSMENT MANAGEMENT")
end


And (/^I request assessments$/)do
  3.times do
    @trainers.date_filter_on_assessment_management_page.request_assessments
  end
  end



And(/^The assessment list will be sorted by assessment date$/)do
@trainers.date_filter_on_assessment_management_page.verify_assessment_list_sorting
end