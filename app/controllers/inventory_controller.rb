class InventoryController < ApplicationController

  def index
    @inventory = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create 
    @inventory = Inventory.new(inventory_params)
    @inventory.user_id = current_user.id

    if @inventory.save
      redirect_to inventory_path(@inventory)
    else
      render "new"
    end
  end

  private
    def inventory_params
      params.require(:inventory).permit(:name, :cost, :price, :distributor)
    end
end
