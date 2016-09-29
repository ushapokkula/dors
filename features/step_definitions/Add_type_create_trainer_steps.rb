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
page.find(".ui-select-search").set(course_name)
page.find(".ui-select-search").send_keys(:enter)
end


And (/I select the licences status as "([^"]*)"$/)do|status|
  select(status, :from => 'licenseStatuses')
end

Then(/^I should see added licence type shown with "([^"]*)", "([^"]*)", "([^"]*)"$/) do |coursename, status, expirydate|
  page.find(".selected-license-course").value == coursename
  page.find("#licenseStatuses_0").value == status
  page.find("#licenseExpiryDate_0").value == expirydate
end

Then(/^added Scheme "([^"]*)" no longer available in the dropdown for selection$/) do|coursename|
  find('#ui-select-choices-row-0-0').value.should_not eql? coursename
end

Then(/^added Scheme "([^"]*)" available in the dropdown for selection$/) do|coursename|
  find('#ui-select-choices-row-0-1').value.should eql? coursename
end


Then(/^I can verify selected "([^"]*)" type is "([^"]*)"$/) do |course_name, type|
  if(course_name == 'Driving For Change' && type == 'Practical Course' )
    expect(page).to have_css("span[data-scheme-id='136']")
    expect(page).to have_css(".glyphicon-road")
  end
  if(course_name == 'National Driver Alertness Course' && type == 'Practical Course')
    expect(page).to have_css("span[data-scheme-id='135']")
    expect(page).to have_css(".glyphicon-road")
  end
  if(type == 'Theory Course')
  expect(page).to have_css(".glyphicon-book")
end
end
