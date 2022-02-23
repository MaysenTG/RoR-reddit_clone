class PublicController < ApplicationController
  def index
    @communities = Community.all.limit(3)
    @posts = Post.all.order(:total_upvotes)
    
  end
end
