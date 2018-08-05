  class PostList < Hyperloop::Component

    render(DIV, class: 'row') do
      DIV(class: 'col col-md-10 mx-auto') do
        UserStore.current.posts.each do |post|
          PostItem(post: post)
        end
      end
    end
  end

