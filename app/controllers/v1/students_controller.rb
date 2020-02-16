class V1::StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @students = Student.all.where(:user_id => params[:id])
    render json: @students, status: 200
  end

  def search
    name = params[:name]
    @results = []
    @results = Student.where('"firstName" ILIKE ?'\
                     'OR "lastName" ILIKE ?', "%#{name}%", "%#{name}%") 
    if name.present?
      render json: @results
    end
  end
end