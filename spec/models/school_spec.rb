require 'rails_helper'

RSpec.describe School, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

   context "validations" do

    it "should have name and email and password_digest" do
      should have_db_column(:name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
    end

    describe "validates presence and uniqueness of name and email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:name) }
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
      When(:school) { School.create(
        name: "Rafia High School",
        email: "rafiaHs@nextacademy.com",
        password: "123456",
        password_confirmation: "123456"
      )}
      Then { school.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a name" do
      When(:school) { School.create(email: "rafiaHs@nextacademy.com", password: "123456", password_confirmation: "123456") }
      Then { school.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:school) { School.create(name: "Rafia High School", password: "123456", password_confirmation: "123456") }
      Then { school.valid? == false }
    end


    describe "cannot be created without a password" do
      When(:school) { School.create(name: "Rafia High School", email: "rafiaHs@nextacademy.com") }
      Then { school.valid? == false }
    end



    describe "should permit valid email only" do
      let(:school1) { School.create(name: "Rafia High School", email: "rafiaHs@nextacademy.com", password: "123456", password_confirmation: "123456")}
      let(:school2) { School.create(name: "DD High School",email: "dd.com", password: "123456", password_confirmation: "123456") }

      # happy_path
      it "sign up with valid email" do
        expect(school1).to be_valid
      end

      # unhappy_path
      it "sign up with invalid email" do
        expect(school2).to be_invalid
      end
    end

  end
end
