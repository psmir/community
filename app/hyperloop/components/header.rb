class Header < Hyperloop::Component

  render(HEADER) do
    NAV(class: 'navbar navbar-expand-lg navbar-dark bg-dark') do
      DIV(class: :container) do
        A(class: 'navbar-brand', href: '/'){ 'Community' }

        UL(class: 'nav navbar-nav ml-auto') do
          LI(class: 'nav-item') do
            if UserStore.current.present?
              A(class: 'nav-link', href: '#'){ "Logout #{UserStore.current.email}" }.on(:click) do |event|
                event.prevent_default
                LogOutOp.run.fail do |e|
                  puts e.message
                end
              end
            end
          end
        end
      end
    end
  end
end
