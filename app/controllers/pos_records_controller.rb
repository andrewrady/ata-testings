class PosRecordsController < ApplicationController
  before_action :authenticate_user!


  def index
    @transactions = PosRecord.all
  end

  def show
    @transaction = PosRecord.find(params[:id])
  end

end
