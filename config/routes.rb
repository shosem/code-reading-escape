Rails.application.routes.draw do
  get "/", to: redirect("/posts/post-a")

  resources :posts, param: :slug, only: [:show] do
    member do
      get :digest
    end

    resources :comments, only: [:create]
  end

  resource :answer, only: [:new, :create], controller: "answers"
end
