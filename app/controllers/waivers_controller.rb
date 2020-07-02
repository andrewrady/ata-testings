class WaiversController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @student = Student.find(params[:student_id])
    @primaryAddress = @student.addresses.where(isPrimary: true).first
    @primaryEmail = @student.email_addresses.where(isPrimary: true).first
  end

  def create
    @student = Student.find(params[:student_id])

    if @student.update(waiver_params)
      redirect_to edit_student_path(@student)
    else
      render 'new'
    end
  end

  private

    def waiver_params
      params.require(:student).permit(:waiver, :guardianFirstName, :guardianLastName)
    end
end
