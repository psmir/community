class PostItem < Hyperloop::Component
  param :post
  render(LI) do
    params.post.title
  end
end
