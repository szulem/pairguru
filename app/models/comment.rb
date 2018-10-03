class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :description, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :user_id
end
