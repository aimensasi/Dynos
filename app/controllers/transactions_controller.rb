class TransactionsController < ApplicationController

  before_action :require_login
  before_action :is_individual


  def new
    @event = Event.find_by_id(transaction_params[:event_id])
    @client_token = generate_client_token
  end

  def create
    nonce_from_the_client = params["payment-method-nonce"]
    # byebug
    @result = make_transaction(transaction_params[:total_price], nonce_from_the_client)
    if @result.success?
      # create_ticket
      puts "Done payment_method_nonce #{transaction_params[:total_price]}"
    else
      byebug
      flash.alert =  @result.errors.first.message
      redirect_to new_transaction_path :transaction => {:event_id => transaction_params[:event_id]}
    end
  end


  private
  def generate_client_token
    Braintree::ClientToken.generate
  end

  def make_transaction(amount, nonce)
    # byebug
    Braintree::Transaction.sale(
      :amount => amount,
      :payment_method_nonce => nonce,
      :options => { :submit_for_settlement => true }
      )
  end

  def create_ticket
    users_event = EventsUser.new(transaction_params)
    users_event.user = current_user.individual
    if users_event.save
      flash.notice = "Congratulation, Your Spot is now Save"
      redirect_to edit_individual_path(current_user.individual.id, :anchor => "your-events")  
    else
      flash.alert = users_event.errors.full_messages.first
      redirect_to new_transaction_path :transaction => {:event_id => transaction_params[:event_id]}
    end
  end

  def transaction_params
    params.require(:transaction).permit(:tickets_count, :total_price, :event_id)
  end
end
