class Landing < Hyperloop::Router::Component

  render(SECTION) do
    DIV(class: 'container') do
      DIV(class: 'row viewport-80') do
        DIV(class: 'col col-md-10 mx-auto') do
          H1(class: 'm-3 text-center') { 'Welcome to Community' }
          Post.recent.each do |p|
            PostItem(post: p)
          end
        end
      end
    end
  end
end
