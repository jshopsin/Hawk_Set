class Assignment < ApplicationRecord
  belongs_to :game
  belongs_to :card
  belongs_to :card_set, optional: true
end
