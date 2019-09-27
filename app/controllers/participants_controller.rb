class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def create 
    @testing = Testing.find(params[:testing_id])
    @participant = @testing.participants.create(participants_param)
    
    redirect_to testing_path(@testing)
  end

  def destroy
    @testing = Testing.find(params[:testing_id])
    @participant = @testing.participants.find(params[:id])

    @participant.destroy

    redirect_to testing_path(@testing)
  end

  private
    def participants_param
      params.require(:participant).permit(:student_id, :firstName, :lastName, 
                                          :testing_id, :form, :weapon, :sparring, 
                                          :boardBreak, :fit, :total, categories: [])
    end
end
