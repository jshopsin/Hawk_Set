class Card < ApplicationRecord
  has_many :assignments
  has_many :games, through: :assignments
  has_many :card_sets, through: :assignments
end
