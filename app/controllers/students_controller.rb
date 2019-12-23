class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all.where(:user_id => current_user)
  end

  def show
    @student = Student.where(:id => params[:id]).where(:user_id => current_user.id).first
    @ranks = AvailableRank.all
  end

  def new
    @student = Student.new
    @ranks = AvailableRank.all
  end

  def create
    @student = Student.new(student_params)
    @student.user_id = current_user.id

    if @student.save
      redirect_to edit_student_path(@student)
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
    @ranks = AvailableRank.all
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private

    def student_params
      params.require(:student).permit(:firstName, :lastName, :size, ranks_attributes: [:name, :order, :rankType])
    end

end
