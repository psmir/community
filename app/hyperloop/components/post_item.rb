class PostItem < Hyperloop::Component
  param :post
  render(DIV, class: 'card m-5 p-3') do
    H2{ params.post.title }

    P{ params.post.body }
  end
end
