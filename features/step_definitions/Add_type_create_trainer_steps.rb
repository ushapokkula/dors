When (/^I am on create Trainers page$/)do
expect(page).to have_css("h1", text:'Trainers management')
expect(page).to have_css("h3", text:'Create Trainer')
end

Then (/^I can see a Course Name label$/)do
expect(page).to have_xpath("//label[@for='courseNames']", text:'Course name', visible: true)
end

And (/^the Icon shown before the Course Name in dropdown$/)do
  find(".ui-select-container").click
page.all(".glyphicon-book")      #verifying Theory Course icon
  page.find(".glyphicon-road")  #verifying Practical Course icon
end




