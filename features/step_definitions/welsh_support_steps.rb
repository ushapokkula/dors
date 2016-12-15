#!/bin/env ruby
# encoding: utf-8

And(/^enter all valid details in Street Address,Town,First Name and Last Name$/) do

  sleep 5
  welshChar = Array.new
  String welshChar =['0194 Ê', '0202 Î', '0206  Ô', '0212  Û', '0219  Ŷ', '0374  Ŵ', '0372', '0226  ê', '0234  î', '0238  ô',
                     '0244 û', '0251  ŷ', '0375  ŵ', '0373  Á',]
  size= welshChar.length
  iarraylistCount=0
  # $message="Trainer record successfully updated."

  #while iarraylistCount<size-1 do
    for i in 0..size-1
    @trainers.edit_or_update_trainer_record_page.update_filling_welsh_details(welshChar[i])

    # Commented this - "filling_welsh_details(welshChar)" out as this creates about 100 trainers per one run which is not feasible.
    # Can be run only when it is really required to test create trainer with all/some of these welsh characters

    # @trainers.create_trainer_record_page.filling_welsh_details(welshChar)
    iarraylistCount=iarraylistCount+1
    click_link_or_button('Update Trainer')
    expect(page).to have_css(".toast-message", text: "Trainer record successfully updated.")
  end
  end
  #end

When(/^I hit enter after typing trainer ID "([^"]*)"$/) do |trainer_id|
  expect(page).to have_css("#txt-trainer-name + ul")
  find('#txt-trainer-name').send_keys(:enter)
end
