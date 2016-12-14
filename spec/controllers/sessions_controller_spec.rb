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
    it "login parent" do
    	user = create(:user)
      get :create, {:session => valid_attributes_parent}
      expect(session[:user_id]).to eq user.id
    end
    it "login school" do
    	school = create(:school)
      get :create, {:session => valid_attributes_school}
      expect(session[:user_id]).to eq school.id
    end
    it "display flash alert on invalid attributes" do
    	school = create(:user)
      get :create, {:session => invalid_attributes}
      expect(flash[:alert]).to eq "Wrong Email Or Password"
    end
  end

end
