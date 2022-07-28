require 'roda'

class App < Roda
  # /
  route do |r|
    # /posts -> rozgałęzienie
    r.on 'posts' do
      post_list = {
        1 => 'Post[1]',
        2 => 'Post[2]',
        3 => 'Post[3]',
        4 => 'Post[4]',
        5 => 'Post[5]'
      }
      # /posts/:id -> rozgałęzienie
      r.on Integer do |id|
        post = post_list[id]
        # /posts/:id/show -> rozgałęzienie
        r.on 'show' do
          # /posts/:id/show -> koniec gałęzi
          r.is do
            "Showing #{post}"
          end
          # /posts/:id/show/details -> koniec gałęzi
          r.is 'detail' do
            "Showing #{post} | Last access: #{Time.now.strftime('%H:%M:%S')}"
          end
        end
      end
      # posts -> koniec gałęzi
      r.is do
        post_list.values.map { |post| post }.join(' | ')
      end
    end
  end
end
