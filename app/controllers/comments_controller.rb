class CommentsController < ApplicationController
  
    before_action :authenticate_account!, except: [:index, :show]
    before_action :set_comment, only: [:show]
    
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new comment_values
        @comment.account_id = current_account.id
        
        if @comment.save
            redirect_to community_post_path(@post.community_id, @post.id)
        else
            @community = Community.find(params[:community_id])
            render :new
        end
    end
    
      
    private 
    
    def set_comment
      @post = Post.find(params[:post_id])
    end
    
    def comment_values
      params.require(:comment).permit(:body)
    end
end
