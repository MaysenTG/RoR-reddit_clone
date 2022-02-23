class Post < ApplicationRecord
    belongs_to :account
    belongs_to :community
    has_many :comments, dependent: :destroy
    
    validates :title, :body, :account_id, :community_id, presence: true
   
   
end