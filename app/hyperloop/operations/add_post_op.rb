class AddPostOp < Hyperloop::Operation
  param :title, type: String
  param :body, type: String

  step do
    post = Post.new(
      title: params.title,
      body: params.body,
      user_id: UserStore.current.id
    )
    post.save.then do |r|
      abort! post unless r[:success]
    end
  end
end
