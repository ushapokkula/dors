Then (/^I am on create Trainers page$/)do
expect(page).to have_css("h1", text:'Trainers management')
expect(page).to have_css("h3", text:'Create Trainer')
end

Then (/^I can see a Course Name label$/)do
expect(page).to have_xpath("//label[@for='courseNames']", text:'Course name', visible: true)
end

And (/^the Icon shown before the Course Name in dropdown$/)do
  page.all(".glyphicon-book")      #verifying Theory Course icon
  page.all(".glyphicon-road")    #verifying Practical Course icon
end

And (/^I am in Licences section$/)do
  page.find_all(('h3'), text: 'Licences')
end

Then(/^I can see Legend shown with "([^"]*)" Icon$/) do |icon|
  if (icon == 'Practical Course')
  expect(page).to have_css(".legend-practical-label", text: icon)
  expect(page).to have_css(".glyphicon-road")    # verifying practical icon
  else
  expect(page).to have_css(".legend-theory-label", text: icon)
  expect(page).to have_css(".glyphicon-book")     #verifying theory icon
  end
  end


Then (/^I click on Course Name field$/)do
page.find(".ui-select-container").click
#expect(page).to have_css("a.ui-select-choices-row-inner > span")
end

And (/^I select a "([^"]*)" from Course Name field$/)do|course_name|

end

Then(/^I can see "([^"]*)" of the Course$/)do|type|

end