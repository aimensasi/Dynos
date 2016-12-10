require 'rails_helper'

RSpec.describe User, type: :model do
   context "validations" do

    it "should have name and email and password_digest" do
      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:last_name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
    end

     it "should have other elements" do
      should have_db_column(:location).of_type(:string)
      should have_db_column(:avatar).of_type(:string)
    end

    describe "validates presence and uniqueness of name and email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:password_confirmation) }
      it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }
      it { is_expected.to validate_confirmation_of(:password) }
    end

    # happy_path
    describe "can be created when all attributes are present" do
      When(:user) { User.create(
        first_name: "Josh",
        last_name: "Teng",
        email: "Josh@nextacademy.com",
        password: "123456",
        password_confirmation: "123456",
        location: "sdfasdfkl1kl23123"

      )}
      Then { user.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a first_name" do
      When(:user) { User.create( last_name: "Lim" ,email: "rafiaHs@nextacademy.com", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

     describe "cannot be created without a last_name" do
      When(:user) { User.create( first_name: "Chicken" ,email: "rafiaHs@nextacademy.com", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:user) { User.create(first_name: "Chicken",last_name: "Lim", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end


    describe "cannot be created without a password" do
      When(:user) { User.create(first_name: "Chicken",last_name: "Lim", email: "rafiaHs@nextacademy.com") }
      Then { user.valid? == false }
    end



    describe "should permit valid email only" do
      let(:user1) { User.create(first_name: "Chicken",last_name:"Lim", email: "rafiaHs@nextacademy.com", password: "123456", password_confirmation: "123456")}
      let(:user2) { User.create(first_name: "Monkeu",last_name: "Lim",email: "dd.com", password: "123456", password_confirmation: "123456") }

      # happy_path
      it "sign up with valid email" do
        expect(user1).to be_valid
      end

      # unhappy_path
      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end
    end

  end
end
