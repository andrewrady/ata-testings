class TestingsController < ApplicationController

  def index
    @testings = Testing.all
  end

  def show
    @testing = Testing.find(params[:id])
    @currentStudents = @testing.participants.pluck :student_id
    @student = Student.where.not(id: @currentStudents)
    @firstStudent = @student.first

  end

  def new
    @testing = Testing.new
  end

  def create
    @testing = Testing.new(testing_params)

    if @testing.save
      redirect_to @testing
    else
      render 'new'
    end
  end

  def edit
    @testing = Testing.find(params[:id])
  end

  def update
    @testing = Testing.find(params[:id])

    if @testing.update(testing_params)
      redirect_to @testing
    else
      render 'edit'
    end
  end

  def destroy
    @testing = Testing.find(params[:id])
    @testing.destroy

    redirect_to testings_path
  end

  private
    def testing_params
      params.require(:testing).permit(:status, :location, :date, :student_id, :form, :sparring, :boardBreaks, :fit)
    end
end
