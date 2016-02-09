Then(/^I see that I have access to "([^"]*)","([^"]*)","([^"]*)"$/) do |tab1, tab2, tab3|
  sleep 3
   page.has_link?(tab1, {}).should == true
   page.has_link?(tab2, {}).should == true
   page.has_link?(tab3, {}).should == true
end

And(/^I will be directed to My assessments page$/)do
  page.has_content?("My assessments")
end

And(/^The page will show the list of assessments with status Approved$/)do
  
end