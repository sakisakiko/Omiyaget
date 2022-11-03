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

    #カテゴリー絞り込み検索
    get '/post_items/category/:id'=>'post_items#category_search',as: 'post_items_category_search'
    #購入地域（都道府県）絞り込み検索
    get '/post_items/prefecture'=>'post_items#prefecture_search',as: 'post_items_prefecture_search'

    #ブックマーク一覧
    get '/bookmarks/index'=>'bookmarks#index',as: 'bookmarks_index'

    resources:post_items,only:[:new,:create,:index,:show,:edit,:update,:destroy]do
      resources:post_comments,only:[:create,:destroy]
      resource:favorites,only:[:create,:destroy]
      resource:bookmarks,only:[:create,:destroy]
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