class PublicController < ApplicationController
  def index
    @communities = Community.all.limit(3)
    @posts = Post.all.limit(3)
  end
end
