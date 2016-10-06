Then (/^I am on create Trainers page$/) do
  expect(page).to have_css("h1", text: 'Trainers management')
  expect(page).to have_css("h3", text: 'Create Trainer')
end

Then (/^I can see a Course Name label$/) do
  expect(page).to have_xpath("//label[@for='courseNames']", text: 'Course name', visible: true)
end

And (/^the Icon shown before the Course Name in dropdown$/) do
  page.all(".glyphicon-book") #verifying Theory Course icon
  page.all(".glyphicon-road") #verifying Practical Course icon
end

And (/^I am in Licences section$/) do
  page.find_all(('h3'), text: 'Licences')
end

Then(/^I can see Legend shown with "([^"]*)" Icon$/) do |icon|
  if (icon == 'Practical Course')
    expect(page).to have_css(".legend-practical-label", text: icon)
    expect(page).to have_css(".glyphicon-road") # verifying practical icon
  else
    expect(page).to have_css(".legend-theory-label", text: icon)
    expect(page).to have_css(".glyphicon-book") #verifying theory icon
  end
end


Then (/^I click on Course Name field$/) do
  page.find(".ui-select-container").click
#expect(page).to have_css("a.ui-select-choices-row-inner > span")
end

And (/^I select a "([^"]*)" from Course Name field for "([^"]*)"$/) do |course_name, course_type|
  page.find(".ui-select-search").set(course_name)
  if (course_name == 'National Driver Alertness Course' && course_type == "Practical Course")
    #find('#ui-select-choices-row-0-1').click
    find(".ui-select-choices-row-inner").click
  else
    page.find(".ui-select-search").send_keys(:enter)
  end
end

And (/^I enter "([^"]*)" name in Course Name field$/) do |coursename|
  page.find(".ui-select-search").set(coursename)
end

Then (/^I should see available number of "([^"]*)" Courses$/) do |coursename|
  expect(page).to have_css(".ui-select-choices-row-inner", :count => 1)
  find(".ui-select-choices-row-inner").value == coursename
  page.find(".ui-select-search").send_keys(:enter)
  expect(page).to have_css(".ui-select-match-text")
  expect(page).to have_css("span.glyphicon-book")
end

And (/I select the licences status as "([^"]*)"$/) do |status|
  select(status, :from => 'licenseStatuses')
end

Then(/^I should see added licence type shown with "([^"]*)", "([^"]*)", "([^"]*)"$/) do |course_name, status, expiry_date|
  page.find(".selected-license-course").value == course_name
  page.find("#licenseStatuses_0").value == status
  page.find("#licenseExpiryDate_0").value == expiry_date
end

Then(/^I see added Scheme "([^"]*)" no longer available in the dropdown for selection$/) do |course_name|
  find_all("a.ui-select-choices-row-inner > span").each do |row|
    row.text != course_name
  end
end

Then(/^I see added Scheme "([^"]*)" available in the dropdown for selection$/) do |course_name|
  find_all("a.ui-select-choices-row-inner > span").each do |row|
    row.text == course_name
  end
end


Then(/^I can verify selected "([^"]*)" type is "([^"]*)"$/) do |course_name, type|
  if (course_name == 'Driving For Change' && type == 'Practical Course')
    expect(page).to have_css(".glyphicon-road")
    #expect(page).to have_css("span[data-scheme-type-id='2']")

  end
  if (course_name == 'National Driver Alertness Course' && type == 'Practical Course')
    expect(page).to have_css(".glyphicon-road")
    #expect(page).to have_css("span[data-scheme-type-id='2']")
  end
  if (course_name == 'National Driver Alertness Course' && type == 'Theory Course')
    expect(page).to have_css(".glyphicon-book")
    #expect(page).to have_css("span[data-scheme-type-id='1']")
  end

  if (type == 'Theory Course')
    expect(page).to have_css(".glyphicon-book")
    #expect(page).to have_css("span[data-scheme-type-id='1']")
  end
end

Then (/^I should see selected Course$/) do
  expect(page).to have_css(".selected-license-course")
end

And(/^I should see that the course name dropdown doesn't contain "([^"]*)"$/) do |course_name|
  find_all("a.ui-select-choices-row-inner > span").each do |row|
    expect(row.text).not_to eql(course_name)
  end
end


When(/^I remove the licence having "([^"]*)" course$/) do |course_type|
  if course_type == "Theory Course"
    all(".btn.btn-danger.btn-remove-license", visible: true)[0].click
  else
    all(".btn.btn-danger.btn-remove-license", visible: true)[1].click
  end
end

Then(/^I should see that the course name dropdown contains "([^"]*)" of type "([^"]*)"$/) do |course_name, course_type|
  find(".ui-select-container").click
  within(".ui-select-dropdown.dropdown-menu") do
    within("#ui-select-choices-row-0-7") do
      if course_type == "Theory Course"
        expect(page).to have_xpath(".//span[text()='National Driver Alertness Course']", visible: true, text: course_name, count:1)
        expect(page).to have_css(".glyphicon.glyphicon-book", visible: true, count: 1)
        expect(page).to have_no_css(".glyphicon.glyphicon-road", visible: true)
      else
        course_type == "Practical Course"
        expect(page).to have_xpath(".//span[text()='National Driver Alertness Course']", visible: true, text: course_name,count:1)
        expect(page).to have_css(".glyphicon.glyphicon-road", visible: true, count: 1)
        expect(page).to have_no_css(".glyphicon.glyphicon-book", visible: true)
      end
    end
  end
end