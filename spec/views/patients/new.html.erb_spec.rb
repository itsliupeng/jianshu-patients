require 'spec_helper'

describe "patients/new" do
  before(:each) do
    # assign(:patient, stub_model(Patient,
    #   :first_name => "First",
    #   :middle_name => "Middle",
    #   :last_name => "Last",
    #   :medical_record_number => 1,
    #   :gender => "Male",
    #   :status => "Initial",
    #   :viewed_count => 1,
    #   :location => stub_model(Location, name: "BJ")
    # ).as_new_record)
    #
    # !!! why does build_stubble not passed, I don't konw
    assign(:patient, build(:patient))
  end

  it "renders new patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patients_path, "post" do
      assert_select "input#patient_first_name[name=?]", "patient[first_name]"
      assert_select "input#patient_middle_name[name=?]", "patient[middle_name]"
      assert_select "input#patient_last_name[name=?]", "patient[last_name]"
      assert_select "input#patient_medical_record_number[name=?]", "patient[medical_record_number]"
      # raido button
      assert_select "input#patient_gender_not_available[name=?]", "patient[gender]"
      assert_select "input#patient_gender_male[name=?]", "patient[gender]"
      assert_select "input#patient_gender_female[name=?]", "patient[gender]"
      # select
      assert_select "select#patient_status[name=?]", "patient[status]"
      assert_select "select#patient_location_id[name=?]", "patient[location_id]"
    end
  end
end
