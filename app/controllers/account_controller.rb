class AccountController < ApplicationController
    
    def show
       @account = Account.find(params[:id])
       @posts = Post.where(account_id: @account.id)
       @communities = Community.where(account_id: @account.id)
       @comments = Comment.where(account_id: @account.id)
    end
end
