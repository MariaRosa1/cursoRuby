require_relative 'pagamento'

include Pagamento::Master #quando tem um modulo dentro de outro o include é obrigatorio

puts Pagamento::Master::pagando
puts pagando