require 'roda'

class App < Roda
  route do |r|
    p 'ROUTE block'
    r.on 'hello' do
      p 'HELLO block'
      'Hello Lucid!'
    end

    r.on 'goodbye' do
      p 'GOODBYE block'
      'Goodbye Lucid'
    end
  end
end
