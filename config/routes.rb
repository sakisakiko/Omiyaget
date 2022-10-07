Rails.application.routes.draw do


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

  # ゲストユーザー用
   devise_scope :guest_user do
     post 'guest_user/sign_in', to: 'guest_users/sessions#guest_sign_in'
   end




  scope module: :public do
    root to:"homes#top"
    resources:post_items,only:[:new,:create,:index,:show,:edit,:update]do
      resources:post_comments,only:[:create]
      resource:favorites,only:[:create,:destroy]
      resources:bookmarks,only:[:create,:index,:destroy,]
    end
    get '/customers/user_page'=>'customers#show',as: 'user_page'
    get '/customers/unsubscribe'=>'customers#unsubscribe',as: 'unsubscribe'
    patch '/customers/withdraw'=>'customers#withdraw',as: 'withdraw'
    resources:customers,only:[:edit,:update]

    get '/relationships/following '=>'registrations#following',as: 'following'

  end


  namespace :admin do
    resources:customers,only:[:index,:update]
    resources:categorys,only:[:index,:create,:edit,:update]

    get '/review'=>'post_items#index',as: 'review'
    delete '/review/destroy'=>'post_items#destroy',as: 'review_destroy'

    resources:post_comments,only:[:destroy]

  end


end