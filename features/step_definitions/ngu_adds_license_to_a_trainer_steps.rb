And(/^I see button "([^"]*)" available under the licenses section$/)do |button|
  within(all(".panel-body")[1])do
    expect(page).to have_button(button,visible:true)
  end
end

Then(/^The "([^"]*)" button  is not visible when maximum licenses are added to a trainer$/)do |button|
  within(all(".panel-body")[1])do
    puts expect(page).to have_no_button(button,visible:true)
  end
end