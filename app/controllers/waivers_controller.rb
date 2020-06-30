class WaiversController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @student = Student.find(params[:student_id])
    @primaryAddress = @student.addresses.where(isPrimary: true).first
    @primaryEmail = @student.email_addresses.where(isPrimary: true).first
  end

  def create

  end
end
