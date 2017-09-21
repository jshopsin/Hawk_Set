class CardSetsController < ApplicationController
  def create
    @new_card_set = CardSet.create()

    @game = Game.find(params[:game_id])

    @cards = [ Card.find(params[:card1]), Card.find(:card2), Card.find(params[:card3]) ]


    @cards.each do |card|
      Assignment.find_by_card_id_and_game_id(card.id, @game.id).update(card_status: "in_set", card_set_id: @new_card_set.id)
    end

  end
end
