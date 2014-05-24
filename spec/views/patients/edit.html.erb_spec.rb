require 'spec_helper'

describe "patients/edit" do
  before(:each) do
    @patient = assign(:patient, build_stubbed(:patient))
  end

  it "renders the edit patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patient_path(@patient), "post" do
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
