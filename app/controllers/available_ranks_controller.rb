class AvailableRanksController < ApplicationController
  def index
    @ranks = AvailableRank.all
  end

  def show
    @rank = AvailableRank.find(params[:id])
  end

  def new
    @rank = AvailableRank.new
  end

  def create
    @rank = AvailableRank.new(available_rank_params)

    if @rank.save
      redirect_to available_rank_path(@rank)
    else
      render 'new'
    end
  end

  def edit
    @rank = AvailableRank.find(params[:id])
  end

  def update
    @rank = AvailableRank.find(params[:id])

    if @rank.update(available_rank_params)
      redirect_to @rank
    else
      render 'edit'
    end
  end

  def destroy 
    @rank = AvailableRank.find(params[:id])

    @rank.destroy
    redirect_to available_ranks_path
  end

  private
    def available_rank_params
      params.require(:available_rank).permit(:name, :order, :rankType)
    end
end
