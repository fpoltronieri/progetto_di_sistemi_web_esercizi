class Movie < ApplicationRecord
  has_many :castings
  has_many :actors, through: :castings
  has_one_attached :poster
  has_rich_text :plot
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
end
