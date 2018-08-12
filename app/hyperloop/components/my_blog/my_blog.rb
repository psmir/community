class MyBlog < Hyperloop::Router::Component
  render(DIV, class: 'container') do
    H1{ 'My Blog' }

    Link("#{match.url}/add_post", class: 'btn btn-primary') { "Add Post" }
    Route("#{match.url}/add_post", mounts: AddPost)
    MyPosts()
  end
end
