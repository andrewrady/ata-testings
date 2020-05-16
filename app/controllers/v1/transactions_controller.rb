class V1::TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    raise params.inspect
    requestObject = { 
      merchantKey: ENV["merchantKey"], 
      processorId: ENV["processorId"], 
      cardNumber: params[:cardNumber], 
      cardExpMonth: params[:cardExpMonth],
      cardExpYear: params[:cardExpYear],
      transactionAmount: params[:total]
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
      @transaction = Transaction.new(total: params[:total], tax: params[:tax],
        authCode: body[:data][:authCode], authResponse: body[:data][:authResponse], referenceNumber: body[:data][:referenceNumber],
        orderId: body[:data][:orderId], isPartial: body[:data][:isPartial], partialId: body[:data][:partialId], originalFullAmount: body[:data][:originalFullAmount],
        partialAmountApproved: body[:data][:partialAmountApproved], avsResponse: body[:data][:avsResponse], cvv2Response: body[:data][:cvv2Response],
        cardType: body[:data][:cardType], last4: body[:data][:last4], maskedPan: body[:data][:maskedPan], token: body[:data][:token],
        action: body[:action], isError: body[:isError], isSuccess: body[:isSuccess], student_id: params[:student][:id])

      if @transaction.save!
        params[:items].each do |item|
          @transactionItem = TransactionItem.new(price: item.price, name: item.name, tax: item.tax, transactions_id: @transaction.id)
          @transaction.save
        end
        render json: @transaction, status: 200
      else
        render json: { error: "something went wrong"}, status: 500
      end
    end
  end
end