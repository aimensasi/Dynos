class TransactionsController < ApplicationController

  before_action :require_login
  before_action :is_individual


  def new
    @event = Event.find_by_id(transaction_params[:event_id])
    @client_token = generate_client_token
  end

  def create
    nonce_from_the_client = params[:payment_method_nonce]
    @result = make_transaction(transaction_params[:total_price], nonce_from_the_client)
    if @result.success?
      puts "Price + #{transaction_params[:total_price]}"
      EventsUser.create(transaction_params)
      flash[:notice] = "Congregational, Your Spot is now Save"
      redirect_to edit_individual_path(current_user, :anchor => "your-events")
    else
      flash[:notice] =  @result.errors.first.message
      puts "Price + #{transaction_params[:event_id]}"
      redirect_to new_transaction_path :transaction => {:event_id => transaction_params[:event_id]}
    end
  end

  private

  def generate_client_token
      Braintree::ClientToken.generate
  end

  def make_transaction(amount, nonce)
    Braintree::Transaction.sale(
      :amount => amount, 
      :payment_method_nonce => nonce, 
      :options => { :submit_for_settlement => true }
      )
  end

  def transaction_params
    params.require(:transaction).permit(:ticket_counter, :total_price, :event_id)
  end
end
