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
    cards << Game.assigments.remaining.pop(3)
    cards.each do |card|
      card.update_attribute(:card_status, "in_play")
      Game.assignments.push(card)
    end
  end

  def sets_available?
    # this will not work because it's dependent on 3 cards
    # we need to collectively work on this, as this is the most
    # difficult logic of the game.
    # We need a method that checks each individual card against all of the other
    # cards.
    match(board) ? true : false
  end

  # Edgar, this is unfinished, but could be used for determining if a 
  # users' 3 cards have a match
  def match(cards)
    case
    when shape_match?(cards) && color_match?(cards) && !shade_match?(cards)
      return false
    when shape_match?(cards) && shade_match?(cards) && !color_match?(cards)
      return false
    when shape_match?(cards) && number_match?(cards) && !color_match?(cards)
      return false
    when shape_match?(cards) && image_match?(cards) && !color_match?(cards)
      return false
    else
      return true
    end
  end

  # Here is a collection of methods to determine if there is a match among
  # 3 cards
  def shape_match?(cards)
    return true if cards[0].shape == cards[1].shape && cards[2].shape == cards[1]
  end

  def color_match?(cards)
    return true if cards[0].color == cards[1].color && cards[2].color == cards[1].color
  end

  def shade_match?(cards)
    return true if cards[0].shade == cards[1].shade && cards[2].shade == cards[1].shade
  end

  def number_match?(cards)
    return true if cards[0].number == cards[1].number && cards[2].number == cards[1].number
  end

  def image_match?(cards)
    return true if cards[0].image_url == cards[1].image_url && cards[2].image_url == cards[1].image_url
  end
end
