Rails.application.routes.draw do
  mount Hyperloop::Engine => '/hyperloop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'hyperloop#app'
  match '*all', to: 'hyperloop#app', via: [:get]
end
