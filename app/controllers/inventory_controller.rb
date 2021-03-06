class InventoryController < ApplicationController
  before_action :authenticate_user!


  def index
    @inventory = Inventory.all.order("id DESC")
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
      redirect_to inventory_index_path
    else
      render "new"
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    @inventory = Inventory.find(params[:id])

    if @inventory.update(inventory_params)
      redirect_to inventory_index_path
    else
      render "edit"
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    @inventory.destroy
    redirect_to inventory_index_path
  end

  private
    def inventory_params
      params.require(:inventory).permit(:name, :cost, :price, :distributor, :amount, :tax)
    end
end
