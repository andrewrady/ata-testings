class ParticipantsController < ApplicationController

  def create 
    @testing = Testing.find(params[:testing_id])
    @participant = @testing.participants.create(participants_param)
    
    redirect_to testing_path(@testing)
  end

  private
    def participants_param
      params.require(:participant).permit(:student_id, :testing_id, :form, :weapon, :sparring, :boardBreak, :fit, :total)
    end
end
