class CancelORRejectionNotesOnAssessmentsRecordsPage < SitePrism::Page
  element :cancel_or_rejection_notes, "#actionNotes"


  $cancel_notes = "Notes for cancellation"
  $reject_notes = "Notes for Rejection"

  def cancel_Assessment
    click_link_or_button("View Details")
    expect(page).to have_css("h1",text: 'Assessment Request')
    click_link_or_button("Cancel Request")
    expect(page).to have_css("h4",text: 'Cancel Assessment')
    fill_in("cancellationNotes", :with => $cancel_notes)
    click_button('Yes')
  end

  def verify_cancel_or_reject_filed_readonly
    page.should have_css("#actionNotes[readonly]")  #Verify readonly field#
   if  page.has_content?($cancel_notes)
        puts ($cancel_notes)
   end
    if page.has_content?($reject_notes)
      puts ($reject_notes)
    end
    puts "Cancel or Reject Notes verified"
    end

    def verify_rejection_field_value
    page.find("#actionNotes").value == $reject_notes
  end

  def verify_cancel_field_value
    page.find("#actionNotes").value == $cancel_notes
  end

  def reject_Assessment
    click_link_or_button("View Details")
  expect(page).to have_css("h1",text: 'Assessment Request')
  click_link_or_button("Reject")
  expect(page).to have_css("h4",text: 'Reject Assessment')
  fill_in("cancellationNotes", :with => $reject_notes)
  click_button('Yes')
  end


  def cancel_Approved_Assessment
    click_link_or_button("View Details")
    expect(page).to have_css("h1",text: 'Assessment Outcome')
    click_link_or_button("Cancel")
    expect(page).to have_css("h4",text: 'Cancel Assessment')
    fill_in("cancellationNotes", :with => $cancel_notes)
    click_button('Yes')
  end

  def verify_cancel_label
    expect(page.find(:css,"label[for='actionNotes']"))
  expect(page).to have_css("label[for='actionNotes']", text: 'Cancellation Notes')
  end

  def verify_reject_label
    expect(page.find(:css,"label[for='actionNotes']"))
    expect(page).to have_css("label[for='actionNotes']", text: 'Rejection Notes')
  end
end