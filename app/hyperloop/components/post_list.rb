  class PostList < Hyperloop::Component

    render(SECTION) do
      UL do
        Post.each do |post|
          PostItem(post: post)
        end
      end
    end
  end

