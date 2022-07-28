require 'roda'

class App < Roda
  route do |r|
    p [0, r.matched_path, r.remaining_path]
    r.on 'posts' do
      p [1, r.matched_path, r.remaining_path]
      post_list = {
        1 => 'Post[1]',
        2 => 'Post[2]',
        3 => 'Post[3]',
        4 => 'Post[4]',
        5 => 'Post[5]'
      }

      r.is Integer do |id|
        p [2, r.matched_path, r.remaining_path]
        post_list[id]
      end

      r.is do
        p [3, r.matched_path, r.remaining_path]
        post_list.values.map { |post| post }.join(' | ')
      end
    end
  end
end
