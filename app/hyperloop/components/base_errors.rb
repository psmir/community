class BaseErrors < Hyperloop::Component
  param :store

  render(DIV, class: 'alert alert-danger') do
    params.store.errors[:base]
  end
end
