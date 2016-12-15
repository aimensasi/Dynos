require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	let(:valid_attributes_school) {{:email => "adam@gmail.com", :password => "AsW12345", :account_type => "school"}}
	let(:valid_attributes_parent) {{:email => "adam@gmail.com", :password => "AsW12345", :account_type => "parent"}}
	let(:invalid_attributes) {{:email => "adam@gmail.com", :password => "AsW12345", :account_type => "user"}}

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #Create" do
    it "login individual" do
    	user = create(:school).user
      get :create, {:session => {:email => user.email, :password => "AsW12345"} }
      expect(session[:user_id]).to eq user.id
    end
    it "login school" do
    	user = create(:school).user
      get :create, {:session => {:email => user.email, :password => "AsW12345"} }
      expect(session[:user_id]).to eq user.id
    end
    it "display flash alert on invalid attributes" do
    	user = create(:school).user
      get :create, {:session => {:email => "Ahmed@gmil.com", :password => "AsW12345"}}
      expect(flash[:alert]).to eq "Invalid Email Or Password"
    end
  end

  describe "DELETE #Destroy" do 
    it "Deletes session on log out" do 
      user = create(:school).user

      get :create, {:session => {:email => user.email, :password => "AsW12345"}}
      expect(session[:user_id]).not_to be nil
      
      delete :destroy, {}, {:user_id => user.id}
      expect(session[:user_id]).to be nil
    end
  end

end
