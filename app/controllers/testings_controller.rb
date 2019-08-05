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

  def score
    @testing = Testing.find(params[:testing_id])
  end

  def processing
    @testing = Testing.find(params[:testing_id])

    if @testing.update(testing_params)
      if params.has_key?(:participants_attributes)
        params[:testing][:participants_attributes].each do |key, value|
          if !value["total"].empty? && value["total"].to_i >= 3
            @student = Student.find(value["student_id"])

            @student.rank = "purple"
            @student.save
          end
        end
      end
      redirect_to testings_path(@testing)
    end
  end

  private
    def testing_params
      params.require(:testing).permit(:status, :location, :date, :student_id, :form, :sparring, :boardBreaks, :fit,
                                      participants_attributes: [:form, :sparring, :boardBreak, :fit, :total, :id, :weapon, :student_id])
    end
end
