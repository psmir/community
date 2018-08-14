class PostItem < Hyperloop::Component
  include ViewHelpers

  param :post

  state expanded: false

  render(DIV, class: 'card m-5') do
    DIV(class: 'card-header') do
      H2(class: 'card-title'){ params.post.title }
      "Posted By #{params.post.user.username} at #{params.post.created_at(:short)}"
    end

    DIV(class: 'card-body') do
      P do
        if state.expanded
          params.post.body
        else
          truncate(params.post.body, length: 300)
        end
      end
    end

    DIV(class: 'card-footer text-right', style: { minHeight: '4rem'}) do
      if params.post.body.length > 300
        A(class: 'btn btn-primary') { state.expanded ? 'Narrow' : 'Expand' }
        .on(:click) do |evt|
          evt.prevent_default
          mutate.expanded !state.expanded
        end
      end
    end
  end
end
