class TransactionsController < ApplicationController

  # before_action :authenticate_user!
  # before_action :check_cart!

  # Other Code
  def new
  @event = Event.find(params[:event_id])
  gon.client_token = generate_client_token

  end

  def create

      result = Braintree::Transaction.sale(
      :amount => params[:total_price],
      :payment_method_nonce => params[:payment_method_nonce] ,
      :options => {
      :submit_for_settlement => true
      }
    )

    if result.success?
      byebug
      puts "success!: #{result.transaction.id}"
      eventuser = EventsUser.new(transaction_params)
      eventuser.status = "paid"
      eventuser.save
      flash[:notice] = "Transaction Succeed!!"
      redirect_to event_path(eventuser.event_id)
    elsif result.transaction
      puts "Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
      flash[:notice] = "Transaction Failed!!"
      redirect_to event_path(eventuser.event_id)
    else
      flash[:notice] = "Transaction Error!!"
      redirect_to event_path(eventuser.event_id)
    end

  end

  private

  def generate_client_token
      Braintree::ClientToken.generate
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :total_price, :event_id, :user_id)
  end



end
