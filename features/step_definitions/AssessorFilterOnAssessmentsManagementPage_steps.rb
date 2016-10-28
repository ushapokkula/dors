And (/^I start typing atleast three characters as "([^"]*)" in the assessor search field$/)do|chars|
  expect(page).to have_css("#txt-assessor-name", visible:true)
  fill_in('txt-assessor-name', :with => chars)

end

Then (/^The system will start autopredicting it and the list of assessor appears$/)do
  expect(page).to have_css("#txt-assessor-name + ul li")
  if (page.should have_no_css(".text-danger"))
    expect(page.all("#txt-assessor-name + ul li").count).to be > 0
  end
end


When (/^I start typing invalid assessor name as "([^"]*)" in the assessor search field$/)do|chars|
  expect(page).to have_css(".title-header", text:'Assessments', visible:true)
  expect(page).to have_css("#txt-assessor-name", visible:true)
  fill_in("txt-assessor-name", :with=> chars)
end

When (/^I hit enter after typing first three chara assessor name as "([^"]*)"$/)do|name|
  fill_in("txt-assessor-name", :with=> name)
  expect(page).to have_css("#txt-assessor-name + ul")
  find('#txt-assessor-name').send_keys(:enter)
  sleep 3
end

Then(/^searched assessor "([^"]*)" name includes assessor full name and assessor ID$/)do |name|
  expect(find("#txt-assessor-name").value).to be == name
end

Then (/^Assessor first name "([^"]*)" will be selected from the auto predict list$/)do |name|
  expect(find("#txt-assessor-name").value).to eq(name)
end

When (/^I hit DOWN arrow key from the assessor auto predict list$/)do
  find("#txt-assessor-name").native.send_keys(:arrow_down)
  find("#txt-assessor-name").send_keys(:enter)
end

When (/^I hit UP arrow key from the assessor auto predict list$/)do
  find("#txt-assessor-name").native.send_keys(:arrow_up)
  find("#txt-assessor-name").send_keys(:enter)
end

And (/^I can see default Assessor filter on Assessment Management Page$/)do
expect(page).to have_css("label[for='txt-assessor-name']", visible: true, text: 'Assessor')
expect(page).to have_css("#txt-assessor-name", visible: true)
end

And (/^default Assessor filter will have no selection$/)do
  expect(find("#txt-assessor-name").value).to eq('')
end

And (/^I search with assessor "([^"]*)" in the assessor search field$/)do|assessor_name|
find("#txt-assessor-name").set(assessor_name)
expect(page).to have_css("#txt-assessor-name + ul li")
if (page.should have_no_css(".text-danger"))
  expect(page.all("#txt-assessor-name + ul li").count).to be > 0
end
find('#txt-assessor-name').send_keys(:enter)
end

Then(/^assessments will be shown which fall under selected Assessor "([^"]*)"$/) do |assessor_name|
  expect(page).to have_css(".dors-table", :count=>1, visible: true)
  expect(page).to have_css(".assessor-name", text: assessor_name, visible: true)
  expect(page).to have_css(".trainer-outcomeStatus", visible: true)
end
