class Assignment < ApplicationRecord
  belongs_to :game
  belongs_to :card
  belongs_to :card_set, optional: true
  scope :remaining, -> { where(card_status: 'remaining') }
  scope :in_play, -> { where(card_status: 'in_play') }
  scope :in_set, -> { where(card_status: 'in_set') }
end
