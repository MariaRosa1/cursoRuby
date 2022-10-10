
require_relative 'pagamento'

include Pagamento #o include permite importar sem o ::

puts Pagamento::PI
puts PI