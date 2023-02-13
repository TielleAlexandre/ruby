v = [15,12,9,14,12]

v.each do |item|
  puts item
end

v1 = Array.new # ou v1 = []

v1.push(9);
v1.push('Teste')
v1.push('Tielle')


v1.each do |elem|
  puts elem
end

puts "Posição[0] é: " + v1[0].to_s

puts "Array aninhado"

v2 = [[15,13,15],[6,5,5],[2,3,4]]
  v2.each do |e|
    puts v2
  end