class AvailableRanksController < ApplicationController
  def index
    @ranks = AvailableRank.all
  end
end
