class Game < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :cards, through: :assignments
  has_many :card_sets, through: :assignments


  def check_for_possible_sets
    if !sets_available?
      add_three_cards
    end
  end

  def add_three_cards
    cards = []
    cards << self.assigments.remaining.pop(3)
    cards.each do |card|
      card.update_attribute(:card_status, "in_play")
      self.assignments.push(card)
    end
  end

  def sets_available?(cards)
    combos = combos(cards)
    combos.each do |card_set|
      return true if match(card_set)
    end
    false
  end

  def combos(cards)
    cards.to_a.combination(3).to_a
  end

  def match(cards)
    ATTRS.each do |attr|
      return false if !attr_set?(cards, attr)
    end
    true
  end

  ATTRS = ["shape", "color", "shade", "number"]

  def attr_set?(cards, attr)
    array = []
    cards.each do |card|
      array << card.send(attr)
    end

    return true if array.uniq.count == 1
    return true if array.uniq.count == 3
    return false
  end

  def color_diff?(cards)
    return true if cards[0].color == cards[1].color && cards[2].color == cards[1].color
  end

  def shade_diff?(cards)
    return true if cards[0].shade == cards[1].shade && cards[2].shade == cards[1].shade
  end

  def number_diff?(cards)
    return true if cards[0].number == cards[1].number && cards[2].number == cards[1].number
  end

end
