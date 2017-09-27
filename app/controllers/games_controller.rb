class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @board = @game.assignments.in_play
  end

  def create
    game = Game.new(user_id: current_user.id)

    if game.save
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

      redirect_to game_path(game)
    else
      redirect_to root_path
    end
  end

  def check_board
    @game = Game.find(params[:game_id])

    if @game.update_board
      redirect_to game_path(@game)
    else
      flash[:alert] = "There are valid sets on the board. Keep trying! Here's a hint:"
      redirect_to game_path(@game)
    end
  end

  def give_hint
    @game = Game.find(params[:game_id])

    respond_to do |format|
      format.html { redirect_to game_path(@game) }
      format.js {@combo = @game.hint}
    end
  end
end
