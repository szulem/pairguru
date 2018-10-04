class Comment < ApplicationRecord
  belongs_to :user, counter_cache: :count_of_comments
  belongs_to :movie

  validates :description, presence: true, length: { minimum: 3 }
  validates :user_id, uniqueness: { scope: :movie_id }

end
