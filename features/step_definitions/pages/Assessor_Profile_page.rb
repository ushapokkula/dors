class AssessorProfilePage < SitePrism::Page

def view_or_update_profile_details(new_table)
  columns = new_table.map { |x| x['Input Details'] }
  for i in 1..columns.size
    expect(page).to have_content(columns[i])
  end
end


def verify_user_is_on_assessor_profile_page
  expect(page).to have_css("h1", "My profile")
  page.should have_css("#lnk-toggle-profile-details-form", text:'Profile details')
 puts find_field('assessorFirstName').value
  page.should have_css(:button,'Update')
  page.should have_css(:button, 'Cancel')
  puts "I am On Assessor Profile Page"

end

end
