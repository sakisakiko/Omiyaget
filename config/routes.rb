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


  scope module: :public do
    root to:"homes#top"

     #ゲストユーザー用
     post '/homes/guest_sign_in'=>'homes#new_guest',as: 'new_guest_sign_in'

    resources:post_items,only:[:new,:create,:index,:show,:edit,:update,:destroy]do
      resources:post_comments,only:[:create,:destroy]
      resource:favorites,only:[:create,:destroy]
      resources:bookmarks,only:[:create,:index,:destroy,]
      collection do
        get 'search'
      end
    end
    get '/customers/unsubscribe'=>'customers#unsubscribe',as: 'unsubscribe'
    patch '/customers/withdraw'=>'customers#withdraw',as: 'withdraw'


    resources:customers,only:[:show,:edit,:update] do
      resource :relationships,only:[:create,:destroy]
       get :followings, on: :member
       get :followers, on: :member
    end

  end


  namespace :admin do
    resources:customers,only:[:index,:update]
    resources:categorys,only:[:index,:create,:edit,:update,:destroy]
    # destroy不要。動作など確認後削除

    get '/review'=>'post_items#index',as: 'review'
    patch '/review/update/:id'=>'post_items#update',as: 'review_update'

    resources:post_comments,only:[:destroy]

  end


end