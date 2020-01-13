class RanksController < ApplicationController
  before_action :authenticate_user!

  def update
    @student = Student.find(params[:student_id])
    @rank = AvailableRank.find_by(:order => params[:student][:rank][:name].to_i)
    @student.ranks.create!(name: @rank.name, order: @rank.order, rankType: @rank.rankType)
    redirect_to edit_student_path(@student)
  end

  private
    def ranks_params
      params.require(:student).permit(:rank)
    end
end