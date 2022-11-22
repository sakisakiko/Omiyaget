class ApplicationController < ActionController::Base

 # ログインしていない場合トップページ以外の画面のアクセスを制限する
  before_action :authenticate_customer!, except: [:top,:new_guest]



def after_sign_in_path_for(resource)
   post_items_path
end

# def after_sign_in_path_for(resource)
#   case resource
#   when Admin
#     admin_top_path
#   when Customer
#     root_path
#   end
# end

 def after_sign_out_path_for(resource_or_scope)
   if resource_or_scope == :customer
    root_path
   elsif resource_or_scope == :admin
    new_admin_session_path
   else
     root_path
   end
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:prefecture,:gender])
  end
end
