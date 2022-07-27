require 'roda'

class App < Roda
  route do |r|
    p 'ROUTE block'
    r.on 'hello' do
      p 'HELLO block'
      'Hello Lucid!'
    end
  end
end
