class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, :last_name, :user_name, :email, presence: true
  
  has_many :communities, dependent: :destroy
  has_many :posts, dependent: :destroy
end
