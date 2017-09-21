class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @board = @game.assignments.in_play
  end

  def create
    game = Game.new(user_id: current_user.id)
    cards = Card.all
    board = cards.sample(12)
    deck = []

    cards.each do |card|
      if !board.include?(card)
        deck << card
      end
    end

    board.each do |card|
      game.assignments.create!(card_id: card.id, card_status: "in_play")
    end

    deck.each do |card|
      game.assignments.create!(card_id: card.id, card_status: "remaining")
    end

    if game.save
      redirect_to game_path(game)
    else
      redirect_to root_path
    end
  end
end
