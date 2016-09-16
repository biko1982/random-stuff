input = gets.chomp.reverse
output = 0
base = gets.chomp.to_i
numbers = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]

input.length.times do |i|
  output = output + (numbers.index(input[ i ]) * (base ** i ))

end

puts output
