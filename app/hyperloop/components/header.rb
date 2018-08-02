class Header < Hyperloop::Router::Component
  collect_other_params_as :attributes

  render(HEADER) do
    NAV(class: 'navbar navbar-expand-lg navbar-dark bg-dark') do
      DIV(class: :container) do
        A(class: 'navbar-brand', href: '/'){ 'Community' }

        UL(class: 'nav navbar-nav ml-auto') do
          if UserStore.current.present?
            LI(class: 'nav-item') do
              A(class: 'nav-link', href: '#'){ "Logout #{UserStore.current.email}" }.on(:click) do |event|
                event.prevent_default
                LogOutOp.run.fail do |e|
                  puts e.message
                end
              end
            end
          else
            LI(class: 'nav-item') do
              Link('/sign_in', class: 'nav-link') { 'Sign In' }
            end
            LI(class: 'nav-item') do
              Link('/sign_up', class: 'nav-link') { 'Sign Up' }
            end
          end
        end
      end
    end
  end
end
