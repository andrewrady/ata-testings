# require "/lib/rest_gateway.rb"
class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = new
    requestObject = { 
      merchantKey: ENV["merchantKey"], 
      processorId: ENV["processorId"], 
      cardNumber: params[:transaction][:cardNumber], 
      cardExpMonth: params[:transaction][:cardExpMonth],
      cardExpYear: params[:transaction][:cardExpYear],
      ownerName: params[:transaction][:ownerName],
      ownerStreet: params[:transaction][:ownerStreet],
      ownerCity: params[:transaction][:ownerCity],
      ownerState: params[:transaction][:ownerState],
      ownerZip: params[:transaction][:ownerZip],
      transactionAmount: params[:transaction][:total]
    }
    requestObject.each do |r|
      r.to_json
    end
    # raise requestObject.to_json.inspect
    puts requestObject
    resp = Faraday.post(ENV["transactionUrl"]+ "/Sale", requestObject)
    raise resp.inspect
  end

  private
    def transaction_params
      params.require(:transaction).permit(:total, :cardNumber, :cardExpMonth, :cardExpYear, :tax, 
                                          :discount, :authResponse, :authCode, :referenceNumber, :orderId)
    end
end
