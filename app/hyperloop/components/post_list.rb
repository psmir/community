class PostList < Hyperloop::Component
  PAGE_SIZE = 5

  state page: 1

  render(DIV) do
    total = Post.count
    Post.paginated(state.page, PAGE_SIZE).each do |p|
      PostItem(key: p.id, post: p)
    end

    Pagination(
      activePage: state.page,
      itemsCountPerPage: PAGE_SIZE,
      totalItemsCount: total,
      pageRangeDisplayed: 5,
      linkClass: 'btn btn-secondary',
      onChange: ->(n) { mutate.page n }
    )

  end
end
