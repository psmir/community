  class App < Hyperloop::Component

    render(DIV) do
      Header()
      DIV(class: 'container') do
        unless UserStore.current
          DIV(class: 'row mt-5') do
            DIV(class: 'col-md-4 offset-md-2') do
              LogIn()
            end
            DIV(class: 'col-md-4') do
              SignUp()
            end
          end
        end
      end
    end
  end

