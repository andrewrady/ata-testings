class StudentsController < ApplicationController

  def index
    @student = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirct_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update
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
