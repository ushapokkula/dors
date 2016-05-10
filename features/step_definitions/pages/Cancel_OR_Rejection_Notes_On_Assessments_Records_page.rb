class CancelORRejectionNotesOnAssessmentsRecordsPage < SitePrism::Page


  def cancell_Assessment
    click_link_or_button("View Details")
    expect(page).to have_css("h1",text: 'My assessment details')
    click_link_or_button("Cancel Request")
    expect(page).to have_css("h4",text: 'Cancel Assessment')
    fill_in("cancellationNotes", :with => "Notes for cancellation")
    click_button('Yes')

  end


  def reject_Assessment
    click_link_or_button("View Details")
  expect(page).to have_css("h1",text: 'Assessment Outcome')
  click_link_or_button("Reject")
  expect(page).to have_css("h4",text: 'Reject Assessment')
  fill_in("cancellationNotes", :with => "Notes for cancellation")
  click_button('Yes')

  end





end