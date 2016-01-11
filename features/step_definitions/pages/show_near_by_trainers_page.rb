class ShowNearByTrainersPage < SitePrism::Page

def verify_trainer_details(new_table)
  columns= new_table.map { |x| x['Outcomes'] }
  for  i in 1...columns.size
    expect(page.text).to match(/#{columns[i]}/i)
  end
end

require 'tiny_tds'
def verify_trainer_inlcuded_booking_request
  trainer_ids = []
  expected_trainers_included = [1,9,17]
  client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
  result = client.execute("select TrainerLicenseId from [DORS_Classified].[dbo].[tbl_TrainerLicenseAssessment]")
  result.each do |row|
    $trainers = row['TrainerLicenseId']
    trainer_ids.push($trainers)
  end
  expect(trainer_ids).to match_array(expected_trainers_included)
end

end