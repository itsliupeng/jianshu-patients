require 'spec_helper'

describe "patients/show" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :last_name => "Last Name",
      :medical_record_number => 1,
      :gender => "Gender",
      :status => "Status",
      :viewed_count => 2,
      :is_deleted => false,
      :location => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Middle Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/1/)
    rendered.should match(/Gender/)
    rendered.should match(/Status/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
