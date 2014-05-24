require 'spec_helper'

describe "patients/show" do
  before(:each) do
    @patient = assign(:patient, build_stubbed(:patient))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Peng/)
    rendered.should match(/Da/)
    rendered.should match(/Liu/)
    rendered.should match(/1/)
    rendered.should match(/Male/)
    rendered.should match(/Initial/)
    rendered.should match(/1/)
    rendered.should match(/HZ/)
  end
end
