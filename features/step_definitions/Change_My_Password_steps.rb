Then (/^the system will show user 'Profile details' in expand section$/)do
  expect(page.should have_css(".panel-open", visible:true))
end