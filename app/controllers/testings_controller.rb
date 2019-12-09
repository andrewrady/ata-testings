class TestingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @testings = Testing.all
  end

  def show
    @testing = Testing.find(params[:id])
    @clone = deep_copy(@testing.participants)
    @currentStudents = @clone.pluck :student_id
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
    @ranks = AvailableRank.all

    if @testing.update(testing_params)
      params[:testing][:participants_attributes].each do |key, value|
        if !value["total"].empty? && value["total"].to_i >= 3
          @student = Student.find(value["student_id"])
          @placement = @ranks.select{ |rank| rank.name == @student.ranks.last.name }
          @newOrder = @placement[0][:order] += 1

          @newRank = @ranks.select{ |rank| rank.order == @newOrder}.last
          @student.ranks.create!(name: @newRank.name, order: @newRank.order, rankType: @newRank.rankType)
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
    @ranks = AvailableRank.all
    @currentRankList = Hash.new
    @ranks.each do |rank| 
      Constants::AvailableSizes.each do |size|
        @student = @testing.participants.where(:rank => rank.name, :size => size)
        if(@student.length === 0 )
          next
        end
        if(@student.length === 1)
          if(@currentRankList.has_key? rank.name)
            @currentRankList.each do |s,v| 
              if(v[0][:size] != @student[0][:size])
                @currentRankList[rank.name].push({:size => @student.pluck(:size)[0], :total => @student.length})
                break
              end
            end
          else
            @currentRankList[rank.name] = [{:size => @student.pluck(:size)[0], :total => @student.length}]
          end
        elsif(@student.length > 1)
          if(@currentRankList.has_key? rank.name)
            @currentRankList[rank.name].each do |s,v| 
              if(v[0][:size] != @student[0][:size])
                @currentRankList[rank.name].push({:size => @student.pluck(:size)[0], :total => @student.length})
                break
              end
            end
          else
            @currentRankList[rank.name] = [{:size => @student.pluck(:size)[0], :total => @student.length}]
          end
        end
      end
    end
    @nextRank = Hash.new
    @currentRankList.each do |key, value| 
      @placement = @ranks.select{ |rank| rank.name == key }
      @newOrder = @placement[0][:order] += 1

      @newRank = @ranks.select{ |rank| rank.order == @newOrder}.last
      @nextRank.store(@newRank, value)
    end
    
  end

  private
    def testing_params
      params.require(:testing).permit(:status, :location, :date, :student_id, :form, :sparring, :boardBreaks, :fit,
                                      participants_attributes: [:form, :sparring, :boardBreak, :fit, :total, :id, :weapon, :student_id])
    end

    def deep_copy(value)
      Marshal.load(Marshal.dump(value))
    end
end
