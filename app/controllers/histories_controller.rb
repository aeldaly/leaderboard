# frozen_string_literal: true
class HistoriesController < ApplicationController
  def show
    @games = current_user.games
  end
end
