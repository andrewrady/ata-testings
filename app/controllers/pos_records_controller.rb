class PosRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_charge

  def index
    @transactions = PosRecord.all
  end

  def show
    @transaction = PosRecord.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf {
        send_data: @transaction.receipt.render,
        filename: "#%{@transaction.created_at.strftime("%Y-%m-%d")}-fusion-ma-receipt.pdf",
        type: "application/pdf",
        disposition: :inline
      }
    end
  end

end
