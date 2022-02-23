class Post < ApplicationRecord
    belongs_to :account
    belongs_to :community
    
    validates :title, :body, :account_id, :community_id, presence: true
   
   
end