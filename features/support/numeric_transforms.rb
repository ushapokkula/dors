# this transform converts any captured number from cucumber steps into a integer
CAPTURE_A_NUMBER = Transform /^\d+$/ do |number|
  number.to_i
end