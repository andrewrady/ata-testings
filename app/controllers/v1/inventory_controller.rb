class V1::InventoryController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @students = Inventory.all.where(:user_id => params[:id])
    render json: @students, status: 200
  end

  def search
    name = params[:name]
    @results = []
    @results = Inventory.where('"name" ILIKE ?', "%#{name}%") 
    if name.present?
      render json: @results
    end
  end
end