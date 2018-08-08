class Landing < Hyperloop::Router::Component

  render(SECTION) do
    DIV(class: 'container') do
      DIV(class: 'row viewport-80 align-items-center') do
        DIV(class: 'col col-md-6 mx-auto') do
          H1 { 'Welcome to Community' }
        end
      end
    end
  end
end
