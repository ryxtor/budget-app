class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups, foreign_key: 'user_id', class_name: 'Group', dependent: :destroy
  has_many :fees, foreign_key: 'user_id', class_name: 'Fee', dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 50 }
end
