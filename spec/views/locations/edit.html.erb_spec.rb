require 'spec_helper'

describe "locations/edit" do
  before(:each) do
    # @location = assign(:location, stub_model(Location,
    #   :code => "MyString",
    #   :name => "MyString"
    # ))
    @location = FactoryGirl.create(:location)
    I18n.locale = "en"
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_path(@location), "post" do
      assert_select "input#location_code[name=?]", "location[code]"
      assert_select "input#location_name[name=?]", "location[name]"
    end
  end
end
