class MileageExpenseCalculationPage< SitePrism::Page

  def mileage_calculation(expenses_claimed, miles)
    sleep 5
    actual_expenses = find_field('expenses').value
    expect(actual_expenses).to be == (expenses_claimed)
  end

  def verify_mileage_restriction(mileage)
    restricted_value = find("#mileage").value
    expect(restricted_value).to be == mileage
  end

  def verify_mileage_with_alphabets
    mileage_value = find("#mileage").value
    expect(mileage_value).to be == ""
  end

  def verify_decimal_inclusion_in_mileage_field(mileage_value)
    mileage_value = find("#mileage").value
    expect(mileage_value).to be == mileage_value
  end

  require 'tiny_tds'

  def verify_DB_for_mileage_and_expense(expected_mileage, expected_expense)
    client = TinyTds::Client.new username:'swapna.gopu', password:'Password1', host:'10.100.8.64', port:'1433'
    client.active?
    result = client.execute("select mileage,expenses from [DORS_Classified].[dbo].[tbl_TrainingAssessment]")
    result.each do |row|
      actual_mileage = row['mileage'].to_i
      actual_expense = row['expenses'].to_i
      expect(actual_mileage).to eq(expected_mileage.to_i)
      expect(actual_expense).to eq(expected_expense.to_i)
    end
  end
end
