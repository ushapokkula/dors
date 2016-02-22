And(/^I will be shown my record with below read only "([^"]*)" fields$/)do |field_name|

   if(field_name == "Force Areas")
   page.should have_no_css("#selected-force-areas .close")
   else
   field_labeled(field_name, :disabled=> true)
   end

end

And(/^I will be shown my record with below editable "([^"]*)" fields$/)do |field_name|
   field_labeled(field_name, :disabled=> false)
end


