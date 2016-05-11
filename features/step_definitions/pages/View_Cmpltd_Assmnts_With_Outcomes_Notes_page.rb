class ViewCmpltdAssmntsWithOutcomesNotesPage < SitePrism::Page



  def request_Assessment_includes_nearby_trainer
    click_link("REQUEST ASSESSMENT")
    find(:button,'Pick a slot',match: :first).click if find(:button,'Pick a slot', match: :first)
    first(:button,'Request Assessment').click if find(:button,'Request Assessment',match: :first)
    expect(page).to have_css(".dors-well-other")
    find_all('.include-nearby-trainer-checkbox')[1].click
    fill_in('mileage',:with=>'500')  #adding mileage#
    fill_in('notes',:with=>'Test')
    click_link_or_button("Submit")
  end


def approve_Assessment(status)
  expect(page).to have_css(".assessment-status", text: 'Requested')
  click_link_or_button(status)
end

  def complete_Approved_Assessment
    click_link("ASSESSMENT MANAGEMENT")
    find("#single-button").click
    check('assessmentStatusChk1')
    click_link_or_button("View Details")
   select('Cancelled', :from=> 'status-281')
    fill_in('notes-281',:with=> 'TEST TRAINER OUTCOME')
    click_link_or_button("Mark Complete")
  end

end