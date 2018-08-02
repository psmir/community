  class App < Hyperloop::Router
    history :browser

    route do
      DIV do
        Route('/', mounts: Header)
        Route('/sign_in', mounts: LogIn)
        Route('/sign_up', mounts: SignUp)
      end
    end
  end

