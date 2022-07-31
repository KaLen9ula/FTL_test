class Expense < ApplicationRecord
  CATEGORIES = %w[Traveling Clothing Taxi Cafes Shops Other]

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
end