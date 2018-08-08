  class App < Hyperloop::Router
    history :browser

    before_mount do
      u = User.current
      UserStore.set_current! u if u.present?
    end

    route do
      DIV do
        Route('/', mounts: Header)
        Route('/', exact: true, mounts: Landing)
        Route('/sign_in', mounts: LogIn)
        Route('/sign_up', mounts: SignUp)
        Route('/my_blog', mounts: MyBlog)
        Footer()
      end
    end
  end

