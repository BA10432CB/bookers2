class Book < ApplicationRecord
  has_one_attached :profile_image

  belongs_to :user
  has_many   :book_comments, dependent: :destroy
  has_many   :favorites,     dependent: :destroy
  has_many   :favorited_users, through: :favorites, source: :user


  # バリデーション
  validates :title, presence: true
  validates :body,  presence: true
  validates :body,  length:   { maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
