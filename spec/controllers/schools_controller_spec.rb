# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  location    :string
#  category    :string
#  avatar      :string
#  reviews     :integer
#  min_age     :integer
#  max_age     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  def log_in user
    session[:user_id] = user.id
  end

  let(:valid_attributes) {
    {name: "Elemental high school", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", location: "Finland", min_age: 2, max_age: 10, category: "International", :email => "adam@gmail.com", :password => "123123123"}}

  let(:invalid_attributes) {
    {description:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", location: "Finland", min_age: 0, max_age: 10, category: "International"}
  }


  let(:school) { create(:school) }


  let(:valid_session) { { :user_id => log_in(school.user) } }

  describe "GET #index" do
    it "assigns all schools as @schools" do
      school = create(:school)
      get :index, params: {}, session: valid_session
      expect(assigns(:schools)).to include(school)
    end
  end

  describe "GET #show" do
    it "assigns the requested school as @school" do
      school = create(:school)

      get :show, id: school.to_param, session: valid_session
      expect(assigns(:school)).to eq(school)
    end
  end

  describe "GET #new" do
    it "assigns a new school as @school" do
      get :new, params: {}, session: valid_session
      expect(assigns(:school)).to be_a_new(School)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "assigns new School" do
        post :create, school: valid_attributes, session: valid_session
        expect(assigns(:school)).to be_a School
      end

      it "redirects to schools edit_path" do
        post :create, school: valid_attributes, session: valid_session
        expect(response).to redirect_to edit_school_path School.last
      end
    end

    context "with invalid params" do
      it "re-renders the 'new' template and display flash alert" do
        post :create, school: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
        expect(flash.alert).to eq "Invalid Email Or Password"
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested school as @school" do
      school = create(:school)
      get :edit, id: school.to_param, session: valid_session
      expect(assigns(:school)).to eq(school)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested school" do
        school = create(:school)
        put :update, id: school.to_param, school: {:name => "Secondary School"}, session: valid_session
        school.reload

        expect(school.name).to eq "Secondary School"
      end

      it "assigns the requested school as @school" do
        school = create(:school)
        put :update, id: school.to_param, school: {:name => "Secondary School"}, session: valid_session
        expect(assigns(:school)).to be_a School
      end

      it "redirects to the edit school and display flash notice" do
        school = create(:school)
        put :update, id: school.to_param, school: valid_attributes, session: valid_session
        expect(response).to redirect_to(edit_school_path school)
        expect(flash.notice).to eq "Your Information Has Been Updated"
      end
    end

    context "with invalid params" do
      it "re-renders edit page and display flash alert" do
        school = create(:school)
        put :update, id: school.to_param, school: {:name => nil }, session: valid_session
        expect(response).to render_template :edit
        expect(flash.alert).to eq "Could not Updated Your Information"
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested school" do
      delete :destroy, {:id => school.id}, valid_session
      expect(School.all).not_to include school
    end

    it "redirects to the schools list" do
      school = create(:school)
      delete :destroy, id: school.to_param, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end

end
