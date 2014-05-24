require 'spec_helper'

describe "patients/index" do


  before :each do
    assign(:patients, [
      build_stubbed(:patient, medical_record_number: 1),
      build_stubbed(:patient, medical_record_number: 1)
    ])
  end

  it "renders a list of patients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  

    assert_select "tr>td", :text => "MR000001".to_s, :count => 2
    assert_select "tr>td", :text => "Liu, Peng Da".to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "Male".to_s, :count => 2
    assert_select "tr>td", :text => "Initial".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "HZ".to_s, :count => 2
  end
end
