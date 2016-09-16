digits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
input = gets.chomp.to_i
base = gets.chomp.to_i
output = ""
while input > 1
  
  if input == base
    output = "10" + output
    break
  else 
  	d = input % base
    output = digits[d] + output
    input = (input /base).to_i
  end

end

puts output
