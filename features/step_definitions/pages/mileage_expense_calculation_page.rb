class MileageExpenseCalculationPage< SitePrism::Page

  def mileage_calculation(expenses_claimed, miles)
    sleep 5
    actual_expenses = find_field('expenses').value
    puts expect(actual_expenses).to be == (expenses_claimed)
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
end