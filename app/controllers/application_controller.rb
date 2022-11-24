class ApplicationController < ActionController::Base

 # ログインしていない場合トップページ以外の画面のアクセスを制限する
  # before_action :authenticate_customer!, except: [:top,:new_guest]

end
