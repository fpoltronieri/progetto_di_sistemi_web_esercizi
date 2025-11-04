class Movie < ApplicationRecord
  has_many :castings
  has_many :actors, through: :castings
  has_one_attached :poster
  has_rich_text :plot
  has_many :reviews, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :director, presence: true, length: { minimum: 2, maximum: 100 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, presence: true, length: { minimum: 2, maximum: 100 }


  def average_rating
    return 0 if reviews.count == 0
    reviews.average(:rating).to_f.round(2)
  end
end
