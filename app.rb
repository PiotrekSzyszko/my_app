require 'roda'

Pizza = Struct.new(:flavor)

class App < Roda
  plugin :h

  mystery_guest = Pizza.new('Mozzarella')

  route do |r|
    r.get 'mystery_guest' do |_name|
      "Tajemniczym gosciem jest: #{h mystery_guest}"
    end
  end
end
