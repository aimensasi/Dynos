# == Schema Information
#
# Table name: individuals
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  location   :string
#  avatar     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'


RSpec.describe IndividualsController, type: :controller do

  def log_in user
    session[:user_id] = user.id
  end

  let(:valid_attributes) { {:first_name => "Adam", :last_name => "James", :location => "Milano, Italy", :email => "adam@gmail.com", :password => "123456"} }
  let(:invalid_attributes) { {:first_name => "Adam", :location => "Milano, Italy"} }

  let(:individual)  { create(:individual) }

  let(:valid_session) { { :user_id => log_in(individual.user) } }



  describe "GET #show" do
    it "returns http success" do
      get :show, {:id => individual.id}, valid_session
      expect(assigns(:individual)).to be_a Individual
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders new form" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "assigns sessions" do
      get :create, {:individual => valid_attributes}
      expect(session[:user_id]).not_to eq nil
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :destroy, {:id => individual.id}, valid_session
      expect(Individual.all).not_to include individual
    end
  end

  describe "GET #update" do
    it "changes first_name to james" do
      get :update, {:id => individual.id, :individual => {:first_name => 'james'} }, valid_session
      expect(assigns(:individual).first_name).to eq 'james'
    end
  end

end
