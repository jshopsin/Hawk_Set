class GamesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
    @board = @game.assignments.in_play
  end

  def create
  end
end