class CardSet < ApplicationRecord
  has_many :assignments
  has_many :games, through: :assignments
  has_many :cards, through: :assignments
end
