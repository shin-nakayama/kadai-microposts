class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build  # form_for 用
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end
  
  def like(micropost)
    self.favorites.find_or_create_by(like_id: micropost.id)
  end
    
  def unlike(micropost)
    favorite = self.favorites.find_by(like_id: micropost.id)
    favorite.destroy if favorite
  end
  
  def like?(micropost)
    self.likes.include?(micropost)
  end
end