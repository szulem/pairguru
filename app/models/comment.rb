class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :description, presence: true
end
