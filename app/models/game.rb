class Game < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :cards, through: :assignments
  has_many :card_sets, through: :assignments
  scope :remaining, -> { where(card_status: 'remaining') }
  scope :in_play, -> { where(card_status: 'in_play') }
  scope :in_set, -> { where(card_status: 'in_set') }

  ATTRS = ["shape", "color", "shade", "number"]

  # No cards left in deck and no sets available
  def over?
    self.assignments.remaining.count == 0 && !sets_available?
  end

  # call this when you press the button to check for sets
  def update_board
    if !sets_available?
      add_three_cards
      return true
    else
      return false
    end
  end

  # checks remaining cards and update 1st 3 to in_play
  def add_three_cards
    cards = self.assignments.remaining.first(3)
    cards.each do |card|
      card.update_attribute(:card_status, "in_play")
    end
  end

  def sets_available?
    # sets all possible combos
    combos = combos(self.assignments.in_play)
    # goes thu each set of possible cards
    combos.each do |assign_set|
      cards = []
      # goes through each assigned_set of possible cards
      assign_set.each do |assign|
        # adds the actual cards to a cards array
        # we now have an array of actual cards to check
        cards << assign.card
      end
      return true if match(cards)
    end
    false
  end

  # returns all possible 3 card combos
  def combos(cards)
    cards.to_a.combination(3).to_a
  end

  def match(cards)
    # loops through the attributes
    ATTRS.each do |attr|
      return false if !attr_set?(cards, attr)
    end
    true
  end

  # given an attribute and cards
  # checks each card for that attribute
  # pushes the attribute in the array
  # then checks if they're all the same or different
  def attr_set?(cards, attr)
    array = []
    cards.each do |card|
      # evalutes the string 'attr' and returns the value
      array << card.send(attr)
    end

    # only return true if it's all the same or totally different
    return true if array.uniq.count == 1
    return true if array.uniq.count == 3
    return false
  end
end
