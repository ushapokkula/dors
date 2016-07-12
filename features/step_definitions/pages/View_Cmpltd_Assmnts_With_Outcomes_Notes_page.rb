class ViewCmpltdAssmntsWithOutcomesNotesPage < SitePrism::Page
 element :assessment_outcome_info , ".dors-well-container"
 element :assessmentID, ".assessmentid"
 element  :assessment_id, "span#requested-assessment-id"
 element  :assessment_date, "span#requested-assessment-date"


  def request_Assessment_includes_nearby_trainer
    click_link("REQUEST ASSESSMENT")
    find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
    first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
    page.find_all('.dors-well-other')[1]
    first('.include-nearby-trainer-checkbox').click if find('.include-nearby-trainer-checkbox',match: :first)
    fill_in('mileage',:with=>'500')   #adding mileage#
    fill_in('notes',:with=>'Test')
    click_link_or_button("Submit")
  end



 def book_Assessment_includes_nearby_trainer
   click_link("REQUEST ASSESSMENT")
   find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
   first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
   page.find_all('.dors-well-other')[1]
   first('.include-nearby-trainer-checkbox').click if find('.include-nearby-trainer-checkbox',match: :first)
   fill_in('notes',:with=>'Test')
   click_link_or_button("Submit")
   within('#requested-assessment-info')do
     expect(page).to have_content("Assessment #{assessment_id.text} scheduled for #{assessment_date.text} has been Booked")
   end
 end


 def approve_Assessment(status)
  expect(page).to have_css(".assessment-status", text: 'Requested')
  click_link_or_button(status)
end

  def complete_Approved_Assessment
    click_link("ASSESSMENT MANAGEMENT")
    expect(page).to have_css("#single-button",visible: true)
    find("#single-button",visible:true).click
    WaitUtil.wait_for_condition("waiting for drop down to appear", :timeout_sec => 5, :delay_sec => 0.5) do
    expect(page).to have_css("#assessmentStatusChk1", visible: true)
    check('assessmentStatusChk1')
    click_link_or_button('View Detail')
   select('Cancelled', :from=> 'status-281')
    fill_in('notes-281',:with=> 'TEST TRAINER OUTCOME')
    page.find_all('.dors-well-other')[1]
    select('Cancelled', :from=> 'status-279')
    fill_in('notes-279',:with=> 'TEST TRAINER OUTCOME')
    click_link_or_button("Mark Complete")
  end
  end
  end