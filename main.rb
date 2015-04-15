require './lib/ruby-des'

data = RubyDES::Block.new('FEDCBA9876543210'.hex)
key  = RubyDES::Block.new('133457799BBCDFF1'.hex)

des = RubyDES::Ctx.new(data, key)

encrypted_data = des.encrypt

un_des = RubyDES::Ctx.new(encrypted_data, key)
decrypted_data = un_des.decrypt

puts "Original: #{data.string}"
puts "Final: #{decrypted_data.string}"
puts "Equal: #{data.bit_array.eql?(decrypted_data.bit_array)}"