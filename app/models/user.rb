class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 5}

end
