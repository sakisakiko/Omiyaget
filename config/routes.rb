Rails.application.routes.draw do

  namespace :admin do
    get 'post_items/index'
  end
  namespace :admin do
    get 'cutomers/index'
  end
  namespace :admin do
    get 'categorys/index'
    get 'categorys/edit'
  end
  namespace :public do
    get 'relationships/following'
  end
  namespace :public do
    get 'bookmarks/index'
  end
  namespace :public do
    get 'post_items/new'
    get 'post_items/index'
    get 'post_items/show'
    get 'post_items/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscrib'
  end
  namespace :public do
    get 'homes/top'
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
