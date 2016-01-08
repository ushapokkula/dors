class ShowNearByTrainersPage < SitePrism::Page

def verify_trainer_details(new_table)
  for  i in 1...columns.size
    expect(page.text).to match(/#{columns[i]}/i)
  end

end

end