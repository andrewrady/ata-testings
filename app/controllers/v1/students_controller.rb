class V1::StudentsController < ApplicationController
  
  def index
    @students = Student.all.where(:user_id => params[:id])
    render json: @students, status: 200
  end
end