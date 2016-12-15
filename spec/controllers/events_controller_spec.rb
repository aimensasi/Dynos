# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  start_date  :date
#  end_date    :date
#  location    :string
#  start_time  :time
#  end_time    :time
#  min_age     :integer
#  max_age     :integer
#  school_id   :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  def log_in user
    session[:user_id] = user.id
  end

  let(:valid_attributes) {
    {
        name: "Rafia High School",
        description: "fadsfasafsd",
        date: "12-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15,
        price: 120
    }
  }

  let(:invalid_attributes) {
    {
        name: "Rafia High School",
        description: nil,
        start_date: "12-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15
    }
  }

  let(:event) { create(:event) }

  before(:each) do 
    school = event.school
    #log_in User
    log_in(school.user)
  end


  describe "GET #index" do
    it "assigns all events as @events" do
      get :index, params: {}
      expect(assigns(:events)).to include event
    end
  end

  describe "GET #show" do
    it "assigns the requested event as @event" do
      get :show, id: event.to_param
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "GET #new" do
    it "assigns a new event as @event" do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end

    it "should redirect to root_url when individual tries to access this page" do
      user = create(:individual).user
      valid_session = {:user_id => log_in(user) }

      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe "GET #edit" do
    it "assigns the requested event as @event" do
      get :edit, id: event.to_param
      expect(assigns(:event)).to eq(event)
    end

    it "should redirect to root_url when individual tries to access this page" do
      user = create(:individual).user
      valid_session = {:user_id => log_in(user) }

      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, event: valid_attributes
        }.to change(Event, :count).by(1)
      end

      it "redirects to the created event" do
        post :create, event: valid_attributes
        expect(response).to redirect_to(Event.last)
      end
    end

    context "with invalid params" do
      it "re-renders the 'new' template and display flash alert" do
        post :create ,event: invalid_attributes
        expect(response).to render_template("new")
        expect(flash.alert).to eq "Invalid Attributes"
      end
    end
  end

  describe "PUT #update" do

    context "with valid params" do
      it "changes event name to Ruby Day" do
        put :update, id: event.to_param, event: {:name => "Ruby Day"}
        event.reload
        expect(assigns(:event).name).to eq "Ruby Day"
      end

      it "redirects to the event and display flash notice" do
        put :update, id: event.to_param, event: {:name => "Ruby Day"}
        expect(response).to redirect_to(event)
        expect(flash.notice).to eq "Updated Event successfully"
      end
    end

    context "with invalid params" do
     it "re-renders the 'edit' template and display flash alert" do
        put :update, id: event.to_param, event: {:name => nil}
        expect(response).to render_template :edit
        expect(flash.alert).to eq "Something Went Wrong, Could not updated your event"
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      expect {
        delete :destroy, id: event.to_param
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list and display a flash notice" do
      delete :destroy ,id: event.to_param
      expect(response).to redirect_to(edit_school_path(event.school, :anchor => "your-events"))
      expect(flash.notice).to eq "Your Event Was Deleted Successfully"
    end
  end

end
