class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  #Topicは1つのUserを持っている
  belongs_to :user

  mount_uploader :image, ImageUploader

  #Topicは複数のFavoriteを持っている
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  #Topicは複数のCommentを持っている
  has_many :comments
end
