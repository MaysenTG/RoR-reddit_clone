class CommentsController < ApplicationController
  
    before_action :authenticate_account!, except: [:index, :show]
    before_action :set_comment, only: [:show]
    
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new comment_values
        @comment.account_id = current_account.id
        
        if @comment.parent_id.nil?
          @post.total_comments += 1
          @post.save
        end
        
        if @comment.save
            redirect_to post_comment_path(@post.id, @comment.id)
        else
            @community = Community.find(params[:community_id])
            render :new
        end
    end
    
    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      @post.total_comments -= 1
      @post.save
      
      @comment.destroy
      redirect_to post_comment_path(@post.id, @comment.id)
    end
    
      
    private 
    
    def set_comment
      @post = Post.find(params[:post_id])
    end
    
    def comment_values
      params.require(:comment).permit(:body, :parent_id)
    end
end
