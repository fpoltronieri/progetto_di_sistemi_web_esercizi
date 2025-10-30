class Actor < ApplicationRecord
  has_many :castings
  has_many :movies, through: :castings

  validates :name, presence: true, length: { maximum: 100 }
  validates :dob, presence: true

end
