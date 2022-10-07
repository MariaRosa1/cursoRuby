# each
# [1, 5, 'abacate', 20].each do |i|
#     puts "o valor lido foi: " + i.to_s
# end

# (0..5).each do |i|
#     puts "o valor lido foi: " + i.to_s
# end

# i = 0
# num = 5

# while i <= num do
#     puts "contando " + i.to_s
#     i+= 1
# end

v = [[11,12,13], [21,22,23],[31,32,33]]

v.each do |externo|
    externo.each do |interno|
        print interno.to_s + ","
    end
    puts ""
end