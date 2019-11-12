class TestingsController < ApplicationController
  before_action :authenticate_user!

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
    @testing.user_id = current_user.id


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
      params[:testing][:participants_attributes].each do |key, value|
        if !value["total"].empty? && value["total"].to_i >= 3
          @student = Student.find(value["student_id"])
          @ranks = Constants::Ranks
          @placement = @ranks.find_index(@student.rank)
          @placement += 1

          @student.rank = @ranks[@placement]
          @student.save
        end
      end
      @testing.status = false
      @testing.save
      redirect_to @testing
    end
  end

  def report
    @testing = Testing.find(params[:testing_id])
    @ranks = Constants::Ranks
    @availableSize = [0, 1, 2, 3, 4, 5, 6, 7,8 ,9]
    @currentRankList = Hash.new
    @ranks.each do |rank| 
      @availableSize.each do |size|
        @test = @testing.participants.where(:rank => rank, :size => size)
        if(@test.length === 1)
          if(@currentRankList.has_key? rank)
            @currentRankList[rank].each do |s| 
              if(s[:size] != @test[0][:size])
                @currentRankList[rank].push({:size => @test.pluck(:size)[0], :total => 1})
              end
            end
          else
            @currentRankList[rank] = [{:size => @test.pluck(:size)[0], :total => 1}]
          end
        elsif(@test.length > 1)
          @currentRankList[rank] = [{:size => @test.pluck(:size)[0], :total => @test.length}]
        end
      end
    end
    @nextRank = Hash.new
    @currentRankList.each do |key, value| 
      @placement = @ranks.find_index(key)
      @placement += 1
      
      @updateRank = @ranks[@placement]
      @nextRank.store(@updateRank, value)
    end
    
  end

  private
    def testing_params
      params.require(:testing).permit(:status, :location, :date, :student_id, :form, :sparring, :boardBreaks, :fit,
                                      participants_attributes: [:form, :sparring, :boardBreak, :fit, :total, :id, :weapon, :student_id])
    end
end
