require 'rails_helper'

RSpec.describe SearchEnginsController, type: :controller do

  describe "Search School" do
    it "returns school that is located in Milano" do
			school = create(:school, :location => "Milano, Italy")
    	3.times do |i|
    		create(:school, :location => "USA")
    		create(:school, :location => "Malaysia, Kuala Lumpur") if i == 2
    	end
      get :search_school, { :location => "Milano"}
      expect(assigns(:schools)).to include school
    end
    it "returns schools that teach age between 2 and 9" do 
    	school = create(:school, :max_age => 10, :min_age => 3)
    	3.times do |i|
    		school = create(:school, :max_age => 19, :min_age => 2)
    	end
    	get :search_school, { :min_age => 2, :max_age => 9} 
    	expect(assigns(:schools).first.min_age).to be_between(2, 9)
    	expect(assigns(:schools).first.max_age).to be >= 9
    end
    it "returns private schools" do 
    	school = create(:school, :category => "private")
    	3.times do |i|
    		school = create(:school, :category => "international")
    		school = create(:school, :category => "public")
    		get :search_school, { :category => "private"} 
    		expect(assigns(:schools).first.category).to eq "private"
    	end
    end
  end

  describe "Search Events" do
    it "returns Event that is located in Glomac Damansara" do
			event = create(:event, :location => "AG-7, Glomac Damansara, Jalan Damansara, Tmn Tun Dr Ismail, 60000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur")
    	3.times do |i|
    		create(:event, :location => "MILANO")
    		create(:event, :location => "Malaysia, Kuala Lumpur") if i == 2
    	end
      get :search_event, { :location => "Glomac Damansara"} 
      expect(assigns(:events)).to include event
    end

    it "returns Event that is located in Kuala Lumpur" do
			event = create(:event, :location => "AG-7, Glomac Damansara, Jalan Damansara, Tmn Tun Dr Ismail, 60000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur")
			event2 = create(:event, :location => "Malaysia, Kuala Lumpur")
    	3.times do |i|
    		create(:event, :location => "MILANO")
    	end
      get :search_event, { :location => "Kuala Lumpur"} 
      expect(assigns(:events)).to include(event, event2)
    end
  end


end
