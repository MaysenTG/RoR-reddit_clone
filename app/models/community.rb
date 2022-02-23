class Community < ApplicationRecord
    belongs_to :account
    validates_presence_of :name, :url, :rules
    
    has_many :posts, dependent: :destroy
    
    
end