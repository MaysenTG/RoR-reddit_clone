class PostsController < ApplicationController
    before_action :authenticate_account!, except: [:index, :show, :new, :edit]
    before_action :set_post, only: [:show]
    
    def index
      @posts = Post.all
    end
  
    def show
      @community = Community.find(params[:community_id])
      @post = Post.find(params[:id])
    end
  
    def create
      @community = Community.find(params[:community_id])
      @post = Post.new post_values
      @post.account_id = current_account.id 
      @post.community_id = params[:community_id]
      
      if @post.save
        redirect_to community_path(@post.community_id)
      else
        @community = Community.find(params[:community_id])
        render :new
      end
    end
  
    def new
      @community = Community.find(params[:community_id])
      @post = Post.new
    end
    
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to community_path(@post.community_id)
    end
    
    
    def edit
      @community = Community.find(params[:community_id])
      @post = Post.find(params[:id])
    end
  
    
    def update
      @post = Post.find(params[:id])
      respond_to do |format|
        if @post.update(post_values)
          format.html { redirect_to community_path(@post.community_id) }
        else
          format.html { render :edit }
        end
      end
    end
    
    
    
    
    private 
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_values
      params.require(:post).permit(:title, :body, :rules)
    end
  end
  