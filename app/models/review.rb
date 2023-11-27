class Review < ApplicationRecord
  belongs_to :booking

  validates :comment, :rating, presense: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, length: { minimum: 5 }
end
