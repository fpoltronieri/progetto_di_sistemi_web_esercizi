class Casting < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
  validates :character, presence: true, length: { mininum: 2, maximum: 100 }
end
