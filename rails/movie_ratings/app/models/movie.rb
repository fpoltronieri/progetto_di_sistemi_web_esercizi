class Movie < ApplicationRecord
  has_many :castings
  has_many :actors, through: :castings
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
end
