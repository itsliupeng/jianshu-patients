require 'spec_helper'

describe "patients/index" do
  before(:each) do
    assign(:patients, [
      stub_model(Patient,
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :medical_record_number => 1,
        :gender => "Gender",
        :status => "Status",
        :viewed_count => 2,
        :is_deleted => false,
        :location => nil
      ),
      stub_model(Patient,
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :medical_record_number => 1,
        :gender => "Gender",
        :status => "Status",
        :viewed_count => 2,
        :is_deleted => false,
        :location => nil
      )
    ])
  end

  it "renders a list of patients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
