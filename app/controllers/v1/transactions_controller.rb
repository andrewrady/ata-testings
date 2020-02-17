class V1::TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
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

    resp = Faraday.post(ENV["transactionUrl"] + "/Sale", requestObject)
    resp = resp.to_hash
    body = JSON.parse(resp[:body]).with_indifferent_access

    if(body[:validationHasFailed] == true)
      render json: { error: { key: body[:validationFailures][0][:key], value: body[:validationFailures][0][:message] }}, status: 422
    else
      @transaction = Transaction.new(total: params[:transaction][:total], tax: params[:transaction][:tax], discount: params[:transaction][:discount],
        authCode: body[:data][:authCode], authResponse: body[:data][:authResponse], referenceNumber: body[:data][:referenceNumber],
        orderId: body[:data][:orderId], isPartial: body[:data][:isPartial], partialId: body[:data][:partialId], originalFullAmount: body[:data][:originalFullAmount],
        partialAmountApproved: body[:data][:partialAmountApproved], avsResponse: body[:data][:avsResponse], cvv2Response: body[:data][:cvv2Response],
        cardType: body[:data][:cardType], last4: body[:data][:last4], maskedPan: body[:data][:maskedPan], token: body[:data][:token],
        action: body[:action], isError: body[:isError], isSuccess: body[:isSuccess], student_id: params[:student][:id])

      if @transaction.save
        render json: @transaction, status: 200
      end
    end
  end
end