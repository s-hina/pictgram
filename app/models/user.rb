class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  validates :password, presence:true, length: { in: 8..32 },
                      format: { with: VALID_PASSWORD_REGEX }

  has_secure_password

  #Userは複数のTopicを持っている
  has_many :topics
  #Userは複数のFavoriteを持っている
  has_many :favorites
  #Userは複数のCommentを持っている
  has_many :comments

  #throughを使用してユーザーがいいねしたtopicデータをすべて取得
  has_many :favorites_topics, through: :favorites, source: 'topic'
end
