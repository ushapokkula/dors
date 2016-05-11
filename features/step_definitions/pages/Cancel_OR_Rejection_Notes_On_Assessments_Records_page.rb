class CancelORRejectionNotesOnAssessmentsRecordsPage < SitePrism::Page


  def cancel_Assessment
    click_link_or_button("View Details")
    expect(page).to have_css("h1",text: 'My assessment details')
    click_link_or_button("Cancel Request")
    expect(page).to have_css("h4",text: 'Cancel Assessment')
    $cancel_notes = "Notes for cancellation"
    fill_in("cancellationNotes", :with => $cancel_notes)
    click_button('Yes')

  end


  def reject_Assessment
    click_link_or_button("View Details")
  expect(page).to have_css("h1",text: 'Assessment Outcome')
  click_link_or_button("Reject")
  expect(page).to have_css("h4",text: 'Reject Assessment')
    $reject_notes = "Notes for Rejection"
  fill_in("cancellationNotes", :with => $reject_notes)
  click_button('Yes')

  end


  def cancel_Approved_Assessment
    click_link_or_button("View Details")
    expect(page).to have_css("h1",text: 'Assessment Outcome')
    click_link_or_button("Cancel")
    expect(page).to have_css("h4",text: 'Cancel Assessment')
    $cancel_notes = "Notes for cancellation"
    fill_in("cancellationNotes", :with => $cancel_notes)
    click_button('Yes')

  end


end