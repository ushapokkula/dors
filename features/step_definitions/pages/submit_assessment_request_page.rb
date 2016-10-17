class SubmitAssessmentRequestPage < SitePrism::Page
  element :notes, "#notes"



  def verify_notes_field_limit(count)

    notes_string = notes. set random_string(count)
    expect(page).to have_css('#notes', text: notes_string )
  end

 end