class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def show
    @games = User.find(params[:id]).games
    @user = User.find(params[:id])
  end
end
