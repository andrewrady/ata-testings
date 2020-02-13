class V1::StudentsController < ApplicationController

  def index
    @students = Student.all.where(:user_id => params[:id])
    render json: @students
  end
end