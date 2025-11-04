class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_rich_text :content

  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :rating, presence: true, inclusion: { in: 1..10 }
end
