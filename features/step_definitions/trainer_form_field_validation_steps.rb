Then (/^the system will load the trainer form where I can create a new trainer record$/)do
  expect(page).to have_css("h1", text:'Trainers management')
  page.should have_css("h3 > strong", text:'Create Trainer')
  page.should have_css("#btnCreateUpdateTrainer", text:'Create Trainer')
  page.should have_css("#btnCancelTrainer", text: 'Cancel')
  puts "I am On Trainers management Page"
end

When(/^I set (.*) to value (.*)$/) do |field, value|
  el = find('label', text: /\A#{field}\z/, visible: true)
  el1 = find("##{el[:for]}")
  el1.set(value)
  el.click
end

Then(/^I should see "([^"]*)" message against that field$/) do |validations|
  expect(page).to have_css("p.help-block", text: validations)
end


And(/^I enter the (.*) with (.*) characters$/) do |field, length|
  @trainers.trainer_form_field_validation_page.validateUsernameLength(field,length)
    if ((field == 'Primary Email Address')&& (field == 'Secondary Email Address'))
      @trainers.trainer_form_field_validation_page.validateEmailLength(field,length)
    end
  el = find('label', text: /\A#{field}\z/, visible: true)
  el1 = find("##{el[:for]}")
  el1.set(random_string(length))

end


Then(/^I should see maximum allowed characters in for (.*) is (.*)$/) do |field, length|
  el = find('label', text: /\A#{field}\z/, visible: true)
  find("##{el[:for]}").value.length.should.eq length
end






