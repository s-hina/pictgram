class Favorite < ApplicationRecord
  #Commentは1つのUserを持っている
  belongs_to :user
  #Commentは1つのTopicを持っている
  belongs_to :topic
end
