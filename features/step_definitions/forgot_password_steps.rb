Given(/^I am on the login page$/)do
  expect(page).to have_css('#txtemail')
end

And(/^I see "([^"]*)" link  on the login page$/)do |link|
  expect(page).to have_link(link)
end

Then(/^I will be directed to "([^"]*)" page$/)do |page_header|
   expect(page).to have_css("h1", text: page_header)
end

And(/^I leave the "([^"]*)" blank$/)do |field|
  fill_in(field, :with=>'')
end

And(/^Enter remaining field leaving the "([^"]*)"$/)do |field|
 if field == "Username"
   fill_in('email',:with=> 'swapna.gopu@wtg.co.uk')
 else
  fill_in('username',:with=>'sudiv')
 end
 end

And(/^I click Logo to come out from that page$/)do
  find('.dors-logo').click
end

And(/^I enter "([^"]*)" as "([^"]*)"$/)do |data,field|
  fill_in(field, :with=>data)
end

And(/^I see a validation message displayed "([^"]*)" against the field$/)do |message|
  expect(page).to have_css(".form-group.has-error" , text: message)
end

And(/^I will remain on the same page$/)do
  expect(page).to have_css("h1", text:'Forgot your password')
end

And(/^I enter valid "([^"]*)"$/)do|field|
  fill_in(field, :with=> 'sudiv')
end

And(/^I enter Invalid "([^"]*)" format$/)do|field|
  fill_in(field, :with=>'test.com')
end

And(/^I will be re-directed to login page$/)do
  expect(page).to have_css("#txtemail")
end