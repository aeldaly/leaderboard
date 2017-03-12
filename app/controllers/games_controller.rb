class GamesController < ApplicationController
  before_action :set_opponents

  def new
    @game = Game.new
  end

  def create
    @opponent = User.find(params[:opponent])
    @your_score = params[:your_score]
    @their_score = params[:their_score]
    @date = params[:date]

    if @your_score.to_i > @their_score.to_i
      winner = current_user
      loser = @opponent

      winner_score = @your_score
      loser_score = @their_score
    else
      winner = @opponent
      loser = current_user

      winner_score = @their_score
      loser_score = @your_score
    end

    @game = Game.create(
      winner: winner,
      loser: loser,
      winner_score: winner_score,
      loser_score: loser_score,
      date: @date
    )

    if @game.valid?
      flash[:notice] = 'Game successfully saved'
      redirect_to :root
    else
      flash[:error] = 'Error saving game. Please correct the following errors.'
      render :new
    end
  end

  private

  def set_opponents
    @opponents = User.all - [current_user]
  end
end
