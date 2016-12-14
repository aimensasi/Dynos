require 'rails_helper'

RSpec.describe Individual, type: :model do
  
	let(:valid_attributes) { {:first_name => "Adma", :last_name => "James"} }
	let(:invalid_attributes) { {:first_name => "Adma"} }

	describe "Validation" do 
		
		context "validates scheme" do 
			it { should have_db_column :first_name}
			it { should have_db_column :last_name}
			it { should have_db_column :location}
			it { should have_db_column :avatar}
		end

		context "validates attributes" do 
			it { should validate_presence_of :first_name}
			it { should validate_presence_of :last_name}
		end

		context "validates associations" do 
			it { is_expected.to belong_to :user}
			it { is_expected.to have_and_belong_to_many :events}
		end

	end




end
