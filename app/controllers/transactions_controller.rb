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
      create_ticket
      puts "Done payment_method_nonce #{transaction_params[:total_price]}"
      redirect_to edit_individual_path current_user.individual, :anchor => "your-events"
    else
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
    tickets = transaction_params[:tickets_count].to_i
    
    tickets.times do |n|
        # byebug
      ticket = Ticket.new({
        :event_id => transaction_params[:event_id].to_i,
        :individual_id  => current_user.individual.id
        })

      if ticket.save
        puts "Your #{n} Spot is save "
      else
        puts "Somthing Went Wrong #{ticket.errors.full_messages}"
      end
    end
  end

  def transaction_params
    params.require(:transaction).permit(:tickets_count, :total_price, :event_id)
  end
end
