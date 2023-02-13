puts "Digite um número:"
x = gets.to_i
if x> 10
  puts "x > 10"
else
  puts "x < 10"
end

# Ao menos que x não seja (IF negado)
unless x>10
  puts "Eu ainda sou muito pequeno."
end

case
when 0..2
  puts "bebê"
when 3..12
  puts "criança"
when 13..18
  puts "adolescente"
else
  puts "adulto"
end