class Public::PostCommentsController < ApplicationController

def create
  post_item=PostItem.find(params[:post_item_id])
  comment=current_customer.post_comments.new(post_comment_params)
  comment.post_item_id=post_item.id
  comment.save
  redirect_to post_item_path(post_item)
end

def destroy
  post_item=PostItem.find(params[:post_item_id])
  comment=PostComment.find(params[:id])
  comment.destroy
  redirect_to post_item_path(post_item.id)
end




private

def post_comment_params
  params.require(:post_comment).permit(:comment,:post_item_id,:customer_id)
end

end
