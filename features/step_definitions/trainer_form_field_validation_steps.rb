Then (/^the system will load the trainer form where I can create a new trainer record$/)do
  expect(page).to have_css("h1", "Trainers management")
  page.should have_css("h3 > strong", text:'Create Trainer')
  page.should have_css("#btnCreateUpdateTrainer",'Create Trainer')
  page.should have_css("#btnCancelTrainer", 'Cancel')
  puts "I am On Trainers management Page"
end

When(/^I set (.*) to value (.*)$/) do |field, value|
  el = find('label', text: /\A#{field}\z/, visible: true)
  # value = '' if value == 'empty'
  find("##{el[:for]}").set(value)
end

Then(/^I should see "([^"]*)" message against that field$/) do |validations|
  expect(page).to have_content(validations)
end


def random_string(x)
  #string = ([*('A'..'Z'),*('0'..'9'),]+ %w(- _ )).sample(x).join
  chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
  string = (0..x).map {chars.sample}.join
end

And(/^I enter the "([^"]*)" with "([^"]*)" characters$/) do |field, length|
  el = find('label', text: /\A#{field}\z/, visible: true)
  find("##{el[:for]}").set random_string(length)
end


Then(/^I should not get the error message as "([^"]*)"$/)do |trainer_validation_msg|

end

Then(/^I should see "([^"]*)" maximum allowed characters$/)do|field|
  el = find('label', text: /\A#{field}\z/, visible: true)
  find("##{el[:for]}").value.length.should.eq '50'
end

Then (/^I should see "([^"]*)" minimum allowed characters$/)do|field|
  el = find('label', text: /\A#{field}\z/, visible: true)
  find("##{el[:for]}").value.length.should.eq '10'
end

When (/^I enter the "([^"]*)" with "([^"]*)" characters allowed$/)do|field, length|
  el = find('label', text: /\A#{field}\z/, visible: true)
  find("##{el[:for]}").set random_email_string(length)
end