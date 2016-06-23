Then (/^the system will load the trainer form where I can create a new trainer record$/)do
  expect(page).to have_css("h1", text:'Trainers management')
  page.should have_css("h3 > strong", text:'Create Trainer')
  page.should have_css("#btnCreateUpdateTrainer", text:'Create Trainer')
  page.should have_css("#btnCancelTrainer", text: 'Cancel')
  puts "I am On Trainers management Page"
end

When(/^I set "([^"]*)" to value "([^"]*)"$/) do |field, value|
  el = find('label', text: /\A#{field}\z/, visible: true)
  el1 = find("##{el[:for]}")
  el1.set(value)
  el.click
end

Then(/^I should see "([^"]*)" message against that field$/) do |validations|
  expect(page).to have_css("p.help-block", text: validations)
end

And(/^I enter the (.*) with (.*) characters$/) do |field, length|
  el = find('label', text: /\A#{field}\z/, visible: true)
  el1 = find("##{el[:for]}")
  if (field =="Username")
   el1.set random_username_string(length.to_i)
  elsif(field =="Primary Email Address")||(field =="Secondary Email Address")
      el1.set random_email_string(length.to_i)
  else
    el1.set alpha_numeric(length.to_i)
  end
  end


Then(/^I should see maximum allowed characters in for (.*) is (.*)$/) do |field, length|
  el = find('label', text: /\A#{field}\z/, visible: true)
  el1 = find("##{el[:for]}")
  el1.value.length.should.eq length
end


