Rails.application.routes.draw do

  scope module: :public do
    root to:"homes#top"
    get '/about'=>'homes#about',as: 'about'
    resources:post_items,only:[:new,:create,:index,:show,:edit,:update]do
      resources:post_comments,only:[:create]
      resource:favorites,only:[:create,:destroy]
      resources:bookmarks,only:[:create,:index,:destroy,]
    end

    get '/customers/unsubscribe'=>'customers#unsubscribe',as: 'unsubscribe'
    patch '/customers/withdraw'=>'customers#withdraw',as: 'withdraw'
    resources:customers,only:[:show,:edit,:update]

    get '/relationships/following '=>'registrations#following ',as: 'following'

  end


  namespace :admin do
    get '/'=>'sessions#new', as: 'top'
    resources:customers,only:[:index,:update]
    resources:categorys,only:[:index,:create,:edit,:update]

    resources:post_items,only:[:index,:destroy] do
     resources:post_comments,only:[:destroy]
    end

  end


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



end
