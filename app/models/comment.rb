class Comment < ApplicationRecord
  #コメントがからの場合はエラー
  validates :content, presence: true

  #Commentは1つのUserを持っている
  belongs_to :user
  #Commentは1つのTopicを持っている
  belongs_to :topic
end
