class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all.where(:user_id => current_user)
  end

  def show
    @student = Student.find(params[:id]).where(:user_id => current_user)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user_id = current_user

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def edit
    @student = Student.find(params[:id])    
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private

    def student_params
      params.require(:student).permit(:firstName, :lastName, :size, :rank)
    end
end
