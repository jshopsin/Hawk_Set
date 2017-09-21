class Game < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :cards, through: :assignments
  has_many :card_sets, through: :assignments
end
