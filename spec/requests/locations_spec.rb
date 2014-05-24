require 'spec_helper'

describe "Locations" do
  before :each do
    @l1 = FactoryGirl.create(:location)
    @p1 = FactoryGirl.create(:patient, location: @l1)
    @p2 = FactoryGirl.create(:patient, location: @l1) 
  end


  describe "GET /locations/:id" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get location_path(@l1)
      response.status.should be(200)
    end

    it "click 中文 to redirect_to /zh-CN/locations/:id" do
      visit location_path(@l1) 
      click_link "中文"
      expect(current_path).to  eq("/zh-CN" + location_path(@l1))
      click_link "English"
    end
    

  end
end
