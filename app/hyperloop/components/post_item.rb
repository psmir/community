class PostItem < Hyperloop::Component
  param :post

  state editing: false

  render(DIV, class: 'card m-5') do
    if state.editing
      PostForm(key: params.post.id, post: params.post, on_cancel: -> { mutate.editing false} )
    else
      DIV(class: 'card-header') do
        H2(class: 'card-title'){ params.post.title }
      end

      DIV(class: 'card-body') do
        P{ params.post.body }
      end

      DIV(class: 'card-footer text-right') do
        A(class: 'btn btn-primary') { 'Edit'}
        .on(:click) do |evt|
          evt.prevent_default
          mutate.editing true
        end

        A(class: 'btn btn-danger') { 'Delete'}
        .on(:click) do |evt|
          evt.prevent_default
          params.post.destroy
        end
      end
    end
  end
end
