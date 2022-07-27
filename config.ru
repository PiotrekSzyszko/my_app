require 'roda'

class App < Roda
  route do |r|
    r.get 'hello' do
      'Siemanko!'
    end
  end
end

run App
