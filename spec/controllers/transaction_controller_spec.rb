require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do

	def log_in user
		session[:user_id] = user.id
	end

	let(:event) { create(:event) }
	let(:individual) { create(:individual) }
	let(:valid_attributes) { { :event_id => event.id, :total_price => 10, :tickets_count => 1 } }

	before(:each) do 
		log_in individual.user
		# log_in event.school.user
	end

	describe "GET #new Only individuals" do 
		it "assigns the given event" do 
			get :new, {:event => {:id => event.id} }
			expect(assigns(:event)).to eq event
		end

		it "assigns a client token" do 
			get :new, {:event => {:id => event.id} }
			expect(assigns(:client_token)).not_to eq nil
		end
	end

	describe "POST #Create Only individuals" do 
		context "NOTE: Only Test One at a time, braintree dose not allow multip requests in short time" do 
			xit "creates transaction" do 
				post :create, {:payment_method_nonce => 'fake-valid-nonce', :transaction => valid_attributes}
				expect(assigns(:result).success?).to be true
			end
			it "saves events_users" do 
				expect{ 
					post :create, {:payment_method_nonce => 'fake-valid-nonce', :transaction => valid_attributes}
					}.to change(EventsUser, :count).by(1)
			end
		end
	end
end