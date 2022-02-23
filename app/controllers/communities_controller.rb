class CommunitiesController < ApplicationController
  before_action :authenticate_account!, except: [:index, :show]
  before_action :set_community, only: [:show]
  
  def index
    @communities = Community.all
  end

  def show
    @posts = @community.posts
  end

  def create
    @community = Community.new community_values
    @community.account_id = current_account.id 
    
    if @community.save
      redirect_to communities_path
    else
      render :new
    end
  end

  def new
    @community = Community.new
  end
  
  def edit
  end
  
  
  def update
    respond_to do |format|
      if @community.update(community_values)
        format.html { redirect_to community_path(@community) }
      else
        format.html { render :edit }
      end
    end
  end
  
  private 
  
  def set_community
    @community = Community.find(params[:id])
  end
  
  def community_values
    params.require(:community).permit(:name, :url, :rules, :slogan, :description)
  end
end
